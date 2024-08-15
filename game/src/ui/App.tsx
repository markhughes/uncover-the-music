import React, { useEffect } from "react";
import { events, gameEvents } from "../gameEvents";

import { LobbyScreen } from "./screens/LobbyScreen";
import { GameScreen } from "./screens/GameScreen";

import { PlayerText } from "./components/PlayerText";

import { useUIStore } from "../store/store";

import "./App.scss";

const uiOpen = (what: string) => {
  useUIStore.getState().open(what);
};
const uiClose = (what: string) => {
  useUIStore.getState().close(what);
};
export const App = () => {
  useEffect(() => {
    events.ui.on.open(uiOpen);
    events.ui.on.close(uiClose);

    return () => {
      events.ui.off.open(uiOpen);
      events.ui.off.close(uiOpen);
    };
  }, []);

  return (
    <>
      <LobbyScreen />
      <GameScreen />
    </>
  );
};
