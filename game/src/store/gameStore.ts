import { createStore } from "zustand/vanilla";
import { devtools } from "zustand/middleware";
import { Player } from "../types/Player";
import { useStore } from "zustand";

export interface GameState {
  players: Record<number, Player>;
}

export interface GameActions {
  add: (pos: number, id: string, name: string) => void;
  remove: (pos: number) => void;
  update: (id: string, args: Partial<Player>) => void;
}

export type GameStore = GameState & GameActions;

export const gameStore = createStore<GameStore>()(
  devtools((set) => ({
    players: [],
    add: (pos, id, name) =>
      set((state) => ({
        players: {
          ...state.players,
          [pos]: {
            id,
            name,
            score: 0,
            matches: 0,
            bonus: 0,
            pos,
          },
        },
      })),
    remove: (pos) =>
      set((state) => ({
        players: {
          ...state.players,
          [pos]: null,
        },
      })),
    update: (id, args) =>
      set((state) => {
        const player = Object.values(state.players).find((p) => p.id === id);

        return {
          players: {
            ...state.players,
            [player.pos]: {
              ...player,
              ...args,
            },
          },
        };
      }),
  }))
);

export const useGameStore = <T = any>(selector?: (selector: GameStore) => T) =>
  useStore(gameStore, selector);
