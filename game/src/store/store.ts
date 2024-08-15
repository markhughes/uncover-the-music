import { create } from "zustand";
import { devtools } from "zustand/middleware";

interface UIState {
  states: Record<string, boolean>;
  open: (what: string) => void;
  close: (what: string) => void;
}

export const useUIStore = create<UIState>()(
  devtools((set) => ({
    states: {},
    open: (what) =>
      set((state) => ({ states: { ...state.states, [what]: true } })),

    close: (what) =>
      set((state) => ({ states: { ...state.states, [what]: false } })),
  }))
);

export const createSelector = (what: string) => (state: UIState) =>
  state.states[what] ?? false;
