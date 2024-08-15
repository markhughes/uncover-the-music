import React from "react";
import { createRoot } from "react-dom/client";
import Phaser from "phaser";

import { App } from "./ui/App";

import LoadingScene from "./scenes/EntryScene";

const config: Phaser.Types.Core.GameConfig = {
  type: Phaser.WEBGL,
  width: 760,
  height: 520,
  physics: {
    default: "arcade",
    arcade: {
      gravity: { y: 200 },
    },
  },
  pixelArt: true,
  fps: {
    forceSetTimeOut: true,
  },
  scene: [LoadingScene],
  loader: {
    baseURL: "assets",
  },
};

const game = new Phaser.Game(config);

const container = document.getElementById("ui-root");
const root = createRoot(container!, {
  identifierPrefix: "ui",
});
root.render(<App />);
