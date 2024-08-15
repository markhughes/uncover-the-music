import Phaser from "phaser";

export const gameEvents = new Phaser.Events.EventEmitter();

export const events = {
  ui: {
    emit: {
      open: (what: string) => {
        gameEvents.emit("ui:open", what);
      },
      close: (what: string) => {
        gameEvents.emit("ui:close", what);
      },
    },
    on: {
      open: (fn: (what: string) => void) => {
        return gameEvents.on("ui:open", fn);
      },
      close: (fn: (what: string) => void) => {
        return gameEvents.on("ui:close", fn);
      },
    },
    off: {
      open: (fn: (what: string) => void) => {
        return gameEvents.off("ui:open", fn);
      },
      close: (fn: (what: string) => void) => {
        return gameEvents.off("ui:close", fn);
      },
    },
  },

  game: {
    emit: {
      join: (gameId: string) => {
        gameEvents.emit("game:join", gameId);
      },
      openCaptain: (time: number) => {
        gameEvents.emit("game:openCaptain", time);
      },
      playerJoin: (playerId: string) => {
        gameEvents.emit("game:playerJoin", playerId);
      },
      start: () => {
        gameEvents.emit("game:start");
      },
    },
    on: {
      join: (fn: (gameId: string) => void) => {
        return gameEvents.on("game:join", fn);
      },
      openCaptain: (fn: (time: number) => void) => {
        return gameEvents.on("game:openCaptain", fn);
      },
      playerJoin: (fn: (playerId: string) => void) => {
        return gameEvents.on("game:playerJoin", fn);
      },

      start: (fn: () => void) => {
        return gameEvents.on("game:start", fn);
      },
    },
    off: {
      join: (fn: (gameId: string) => void) => {
        return gameEvents.off("game:join", fn);
      },
      openCaptain: (fn: (time: number) => void) => {
        return gameEvents.off("game:openCaptain", fn);
      },
      playerJoin: (fn: (playerId: string) => void) => {
        return gameEvents.off("game:playerJoin", fn);
      },
      start: (fn: () => void) => {
        return gameEvents.off("game:start", fn);
      },
    },
  },
};
