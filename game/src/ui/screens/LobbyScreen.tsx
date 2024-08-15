import React, { useState } from "react";

import styles from "./LobbyScreen.module.scss";
import Draggable from "react-draggable";
import { createSelector, useUIStore } from "../../store/store";
import { events } from "../../gameEvents";
import { useRevealGameRooms } from "../hooks/useRevealGameRooms";
import { config } from "../../config";

const selector = createSelector("lobby");
const defaultPosition = { x: 410, y: 20 };

interface Game {
  gameId: string;
  players: (null | string)[];
  state: "Full" | "Started" | "GO!";
}
export const LobbyScreen = () => {
  const isOpen = useUIStore(selector);

  const joinGame = (id: string) => {
    events.game.emit.join(id);
    useUIStore.getState().close("lobby");
  };

  const [selected, setSelected] = useState("");

  const rooms = useRevealGameRooms();
  console.log("rooms", rooms);
  const games: Game[] = [
    {
      gameId: "1",
      players: [null, null, null, null, null],
      state: "GO!",
    },
    {
      gameId: "2",
      players: ["d", "a", null, null, null],
      state: "GO!",
    },
  ];

  const createGame = () => {
    const value = prompt("Game Name");
    fetch(`${config.httpHost}/reveal/create`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ roomName: value }),
    }).then(async (response) => {
      const body = await response.json();

      joinGame(body.roomId);
    });
  };
  return (
    isOpen && (
      <Draggable defaultPosition={defaultPosition}>
        <div className={styles.root}>
          <div className={styles.inner}>
            <div className={styles.header}>Navigator</div>

            <div className={styles.tabs}>
              <div className={styles.tabActive}>Select a Game</div>
              <div className={styles.tabInactive}>Find a Friend</div>
            </div>

            <div className={styles.content}>
              <div className={styles.table}>
                <div className={styles.tableHeader}>
                  <div>Games</div>
                  <div>Vegos</div>
                  <div style={{ width: "50px" }}>Status</div>
                </div>

                <div className={styles.tableBody}>
                  <div>
                    <button onClick={createGame}>Create Game</button>
                  </div>

                  {rooms.map((room) => {
                    return (
                      <div
                        key={room.roomId}
                        className={
                          styles.row +
                          " " +
                          (selected === room.roomId ? styles.selected : "")
                        }
                        onClick={() => setSelected(room.roomId)}
                      >
                        <div>{room.metadata.roomName}</div>
                        <div>
                          {[...Array(5)].map((_, i) => {
                            console.log("i", i + 1, room.clients);
                            return (
                              <>
                                {room.clients >= i + 1 ? (
                                  <img
                                    className={styles.player}
                                    src="/assets/ui/lobby/space_b.png"
                                  />
                                ) : (
                                  <img
                                    className={styles.player}
                                    src="/assets/ui/lobby/space_a.png"
                                  />
                                )}
                              </>
                            );
                          })}
                        </div>
                        <div
                          style={{
                            textAlign: "right",
                            fontWeight: 500,
                            cursor: "pointer",
                          }}
                          onClick={() => joinGame(room.roomId)}
                        >
                          {room.locked ? "Started" : "GO!"}
                        </div>
                        <div
                          style={{ cursor: "pointer" }}
                          onClick={() => joinGame(room.roomId)}
                        >
                          <img src="/assets/ui/lobby/arrow.png" />
                        </div>
                      </div>
                    );
                  })}
                </div>
              </div>
            </div>

            <div>...</div>
          </div>
        </div>
      </Draggable>
    )
  );
};
