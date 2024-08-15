import { Client, Room } from "colyseus";
import { ArraySchema } from "@colyseus/schema";

import { Reveal_GameState } from "./Reveal_GameState";
import { Reveal_Player } from "./Reveal_Player";
import { Reveal_Tile } from "./Reveal_Tile";
import { shuffleArray } from "../../util/shuffleArray";
import { createGrid } from "../../util/createGrid";
import { countAdjacentDuplicates } from "../../util/countAdjacentDuplicates";

export class Reveal_GameRoom extends Room<Reveal_GameState> {
  maxClients = 5;
  playerCount = 0;

  timer: NodeJS.Timeout | undefined;

  onCreate(options: any) {
    console.log("options", options);
    this.setState(new Reveal_GameState());
    this.state.hostId = "";
    this.generateTiles();

    this.onMessage("reveal_tile", (client, { tileIndex }) => {
      if (!this.state.isStarted) {
        console.log("Game has not started yet.");
        return;
      }

      // Validate the move
      if (
        !this.isPlayerTurn(client.sessionId) ||
        this.isTileRevealed(tileIndex)
      ) {
        console.log(
          `Invalid move by client ${
            client.sessionId
          } - turn: ${tileIndex} - ${this.isPlayerTurn(
            client.sessionId
          )} - revealed: ${this.isTileRevealed(tileIndex)})}`
        );
        return;
      }

      const currentPlayer = this.state.players.get(client.sessionId);
      if (!currentPlayer) {
        return;
      }
      if (currentPlayer.reveals > 1) {
        console.log("too many reveals");
        return;
      }

      // Reveal the tile
      this.revealTile(tileIndex);

      // If it's a pass card, end their turn
      if (this.isPassCard(tileIndex)) {
        setTimeout(() => {
          this.tileFall(
            currentPlayer.frogMatch !== -1
              ? [currentPlayer.frogMatch, tileIndex]
              : [tileIndex]
          );
          this.endTurn(client.sessionId, true);
        }, 2000);

        return;
      }

      currentPlayer.reveals = currentPlayer.reveals + 1;

      if (currentPlayer.reveals === 1) {
        // If it's their first tile, save it
        currentPlayer.currentTile = tileIndex;

        if (this.isWildCard(tileIndex)) {
          currentPlayer.frogMatch = tileIndex;
        }
      } else {
        // second click
        if (currentPlayer.frogMatch !== -1) {
          console.log("frog match from " + currentPlayer.frogMatch);
          // frog match, instant match
          setTimeout(() => {
            currentPlayer.matches += 1;
            currentPlayer.score += 1;

            const correspondingTile = this.revealCorrespondingTile(tileIndex);
            if (correspondingTile) {
              setTimeout(() => {
                this.tileFall([
                  currentPlayer.frogMatch,
                  tileIndex,
                  correspondingTile,
                ]);

                if (this.noMoreTiles()) {
                  setTimeout(() => this.endGame(), 3000);
                  return;
                }

                setTimeout(() => this.endTurn(client.sessionId), 500);
              }, 3000);
            }
          }, 1000);
          return;
        }

        if (this.isWildCard(tileIndex)) {
          console.log("frog match from " + tileIndex);
          const correspondingTile = this.revealCorrespondingTile(
            currentPlayer.currentTile
          );
          if (correspondingTile) {
            setTimeout(() => {
              this.tileFall([
                currentPlayer.currentTile,
                correspondingTile,
                tileIndex,
              ]);
              currentPlayer.matches += 1;
              currentPlayer.score += 1;
              if (this.noMoreTiles()) {
                setTimeout(() => this.endGame(), 3000);
                return;
              }

              setTimeout(() => this.endTurn(client.sessionId), 500);
            }, 3000);
          }

          return;
        }

        // If it's their second tile, check if it's a match
        if (
          this.isMatch(
            this.state.tiles[currentPlayer.currentTile].id,
            this.state.tiles[tileIndex].id
          )
        ) {
          console.log(
            "matched " +
              currentPlayer.currentTile +
              " (" +
              this.state.tiles[currentPlayer.currentTile].id +
              ") <-> " +
              tileIndex +
              " (" +
              this.state.tiles[tileIndex].id +
              +")"
          );
          this.tileFall([currentPlayer.currentTile, tileIndex]);

          // If it's a match, add a point to their score
          currentPlayer.matches += 1;
          currentPlayer.score += 1;

          // If there are no more tiles, end the game
          if (this.noMoreTiles()) {
            setTimeout(() => this.endGame(), 3000);
            return;
          }
        }

        setTimeout(() => this.endTurn(client.sessionId), 3000);
      }

      // If it's a wild card,
      console.log(
        `Tile ${tileIndex} was clicked. Reveals: ${currentPlayer.reveals}, Score: ${currentPlayer.score}, Current Tile: ${currentPlayer.currentTile}`
      );
      this.state.tiles.forEach((tile) => {
        console.log(
          `Tile ${tile.id} is revealed: ${tile.isRevealed} - visible: ${tile.isVisible}`
        );
      });
    });

    this.onMessage("start_game", (client, message) => {
      console.debug("start_game", message);
      const currentPlayer = this.state.players.get(client.sessionId);
      if (!currentPlayer) {
        return;
      }

      if (currentPlayer.isHost) {
        this.state.isStarted = true;
        this.state.currentPlayer = this.state.hostId;

        this.broadcast("start_game", {
          next: this.state.currentPlayer,
        });
        this.startTimer(this.state.currentPlayer);
      } else {
        console.log(`Only the host can start the game.`);
        return;
      }
    });
  }

  onJoin(client: Client) {
    const player = new Reveal_Player();
    player.id = client.sessionId;
    player.seat = this.playerCount;
    if (this.playerCount === 0) {
      player.isHost = true;
      this.state.hostId = player.id;
    }
    this.state.players.set(client.sessionId, player);
    this.state.playerOrder.push(client.sessionId);
    this.playerCount++;

    this.broadcast("player_joined", {
      id: player.id,
      seat: player.seat,
      host: player.isHost,
      name: `Markeh ${player.id.substring(0, 2)}`,
    });

    this.state.players.forEach((player) => {
      // let the current player know of everyone in as well
      client.send("player_joined", {
        id: player.id,
        seat: player.seat,
        host: player.isHost,
        name: `Markeh ${player.id.substring(0, 2)}`,
      });
    });
  }

  onLeave(client: Client) {
    const player = this.state.players.get(client.sessionId);
    if (!player) {
      return;
    }

    this.playerCount--;
    if (player.isHost) {
      const newHostId = Object.keys(this.state.players)[0];
      const newHost = this.state.players.get(newHostId);
      if (newHost) {
        newHost.isHost = true;
      }
      this.state.hostId = newHostId;
    }

    this.broadcast("player_left", { id: player.id, seat: player.seat });

    this.state.players.delete(client.sessionId);

    const indexToRemove = this.state.playerOrder.indexOf(client.sessionId);
    if (indexToRemove !== -1) {
      this.state.playerOrder.splice(indexToRemove, 1);
    }
  }

  generateTiles() {
    // This is my attempt at a fair shuffle...
    // STANDARD SHUFFLE - FINDS BEST OUT OF 5 IN A GRID
    const pairs: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    const allTiles: number[] = shuffleArray([...pairs, ...pairs, 12, 13]);
    let attempts = 5;
    let bestShuffle,
      lowestScore = Infinity;

    for (let i = 0; i < attempts; i++) {
      let shuffledTiles = shuffleArray(allTiles);
      let grid = createGrid(shuffledTiles, 4, 6);
      let score = countAdjacentDuplicates(grid);

      if (score < lowestScore) {
        lowestScore = score;
        bestShuffle = shuffledTiles;
      }
    }

    const selectedTiles = bestShuffle ?? allTiles;

    // SNAKE BOTTOM CORNER
    // const selectedTiles: number[] = [
    //   1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12,
    //   13,
    // ];

    // // SNAKE BOTTOM RIGHT - offset right 1
    // const selectedTiles: number[] = [
    //   1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 13, 11, 11, 12,
    //   10,
    // ];

    // console.log("allTiles", allTiles);
    this.state.tiles = new ArraySchema<Reveal_Tile>(
      ...selectedTiles.map((id) => {
        const tile = new Reveal_Tile();
        tile.id = id;
        return tile;
      })
    );
  }

  revealTile(tileIndex: number) {
    this.state.tiles[tileIndex].isRevealed = true;

    this.broadcast("reveal_tile", {
      tileIndex: tileIndex,
      tileType: this.state.tiles[tileIndex].id,
    });
  }

  tileFall(tileIndexs: number[]) {
    this.broadcast("tile_fall", {
      tileIndexs,
    });

    console.log("tileIndexes", tileIndexs);
    tileIndexs.forEach((tileIndex) => {
      this.state.tiles[tileIndex].isRevealed = false;
      this.state.tiles[tileIndex].isVisible = false;
    });

    this.state.tiles.forEach((tile, tileIndex) => {
      console.log("tile", tileIndex, tile.id, tile.isVisible, tile.isRevealed);
    });
  }

  isPlayerTurn(sessionId: string): boolean {
    return this.state.currentPlayer === sessionId;
  }
  isTileRevealed(tileIndex: number): boolean {
    return this.state.tiles[tileIndex].isRevealed;
  }

  isMatch(firstTile: number, secondTile: number): boolean {
    return this.state.tiles[firstTile].id === this.state.tiles[secondTile].id;
  }
  noMoreTiles(): boolean {
    return this.state.tiles.every((tile) => !tile.isVisible);
  }

  endGame() {
    console.log("Game ending");
    let highestScoringPlayers: Reveal_Player[] = [];

    let highestScore = -Infinity;

    this.state.players.forEach((player) => {
      if (player.score > highestScore) {
        highestScore = player.score;
        highestScoringPlayers = [player];
      } else if (player.score === highestScore) {
        highestScoringPlayers.push(player);
      }
    });

    const bonus = 60;
    highestScoringPlayers.forEach((player) => {
      player.bonus = Math.floor(bonus / highestScoringPlayers.length);
      player.score += player.bonus;
    });

    this.state.players.forEach((player) => {
      this.playerUpdate(player.id);
    });

    this.broadcast("end_game");
  }

  playerUpdate(sessionId: string) {
    const currentPlayer = this.state.players.get(sessionId);
    if (!currentPlayer) {
      console.log(`Unknown player`);
      return;
    }

    this.broadcast("player_update", {
      id: sessionId,
      bonus: currentPlayer.bonus,
      matches: currentPlayer.matches,
      score: currentPlayer.score,
    });
  }

  endTurn(sessionId: string, skipValidation = false) {
    if (sessionId !== this.state.currentPlayer) {
      console.log(`It's not ${sessionId}'s turn.`);
      return;
    }

    const currentPlayer = this.state.players.get(sessionId);
    if (!currentPlayer) {
      console.log(`Unknown player`);
      return;
    }

    if (currentPlayer.reveals !== 2 && skipValidation === false) {
      console.log(`${sessionId} has not revealed two tiles.`);
      return;
    }

    // already end turning?
    if (this.state.isEndingTurn) {
      return;
    }
    this.state.isEndingTurn = true;

    if (this.timer) {
      clearTimeout(this.timer);
    }

    // reset player
    currentPlayer.currentTile = -1;
    currentPlayer.reveals = 0;
    currentPlayer.frogMatch = -1;

    // move to next player
    const currentPlayerIndex = this.state.playerOrder.indexOf(sessionId);
    const nextPlayerIndex =
      (currentPlayerIndex + 1) % this.state.playerOrder.length;
    const nextPlayerId = this.state.playerOrder[nextPlayerIndex];

    // update the current player incase we had any weird scenarios...
    const nextPlayer = this.state.players.get(nextPlayerId);
    if (nextPlayer) {
      nextPlayer.currentTile = -1;
      nextPlayer.reveals = 0;
      nextPlayer.frogMatch = -1;
    }

    this.state.currentPlayer = nextPlayerId;

    this.state.tiles.forEach((tile) => {
      tile.isRevealed = false;
    });

    this.playerUpdate(sessionId);

    this.state.isEndingTurn = false;

    this.broadcast("end_turn", { id: sessionId, next: nextPlayerId });
    this.startTimer(nextPlayerId);
  }

  startTimer(id: string) {
    if (this.timer) {
      clearTimeout(this.timer);
    }

    // TODO: move to using ticks or something less lazy
    this.timer = setTimeout(() => {
      this.endTurn(id, true);
      // 100ms to compensate connection lag
    }, 15100);
  }

  isPassCard(tileIndex: number): boolean {
    return this.state.tiles[tileIndex].isPassCard();
  }
  isWildCard(tileIndex: number): boolean {
    return this.state.tiles[tileIndex].isWildCard();
  }
  revealCorrespondingTile(tileIndex: number) {
    const correspondingTileIndex = this.state.tiles.findIndex(
      (tile, index) =>
        tile.id === this.state.tiles[tileIndex].id && index !== tileIndex
    );

    if (correspondingTileIndex === -1) {
      console.log("Could not located corresponding tile..");
      return;
    }

    this.revealTile(correspondingTileIndex);

    return correspondingTileIndex;
  }
}
