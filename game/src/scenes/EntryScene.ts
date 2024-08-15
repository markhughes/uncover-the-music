import Phaser from "phaser";
import { Client } from "colyseus.js";

import { events } from "../gameEvents";
import { config } from "../config";

class LoadingScene extends Phaser.Scene {
  constructor() {
    super({ key: "EntryScene" });
  }

  private connection: Client;

  private highlightPatterns = [
    [0, 0, 0, 0, 0],
    [1, 0, 0, 0, 1],
    [0, 1, 0, 1, 0],
    [1, 0, 1, 0, 0],
    [0, 1, 0, 0, 1],
    [1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2],
    [1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2],
    [1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2],
    [1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2],
    [1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 0],
    [1, 1, 1, 0, 0],
    [1, 1, 0, 0, 0],
    [1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [1, 1, 1, 0, 0],
    [1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 0, 2],
    [1, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 0, 2],
    [1, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 0, 2],
  ];

  private highlights: Phaser.GameObjects.Sprite[] = [];

  private highlightIndex = 0;
  private highlightDelayMs = 200;
  private highlightTimer = 0;

  private uncoverTheHighlightDefault: Phaser.GameObjects.Sprite;
  private uncoverTheHighlightTint: Phaser.GameObjects.Sprite;

  private loaded = false;

  private gameScene: Phaser.Scene;

  preload() {
    this.load.image("background", "background-utm.jpg");

    this.load.image("M", "letters/1_M.png");
    this.load.image("U", "letters/2_U.png");
    this.load.image("S", "letters/3_S.png");
    this.load.image("I", "letters/4_I.png");
    this.load.image("C", "letters/5_C.png");

    this.load.image("UNCOVER_THE_DEFAULT", "uncover_the_default.png");
    this.load.image("UNCOVER_THE_TINT", "uncover_the_tint.png");
  }

  create() {
    this.add.image(0, 0, "background").setOrigin(0, 0);

    const onJoinHandler = (id: string) => {
      this.onJoin(id);
    };
    events.game.on.join(onJoinHandler);

    // MUSIC Highlight Animation Load
    const highlightM = this.add
      .sprite(69, 180, "M")
      .setAlpha(0.8)
      .setVisible(false);
    const highlightU = this.add
      .sprite(129, 180, "U")
      .setAlpha(0.8)
      .setVisible(false);
    const highlightS = this.add
      .sprite(180, 180, "S")
      .setAlpha(0.8)
      .setVisible(false);
    const highlightI = this.add
      .sprite(220, 180, "I")
      .setAlpha(0.8)
      .setVisible(false);
    const highlightC = this.add
      .sprite(261, 180, "C")
      .setAlpha(0.8)
      .setVisible(false);

    this.highlights.push(
      highlightM,
      highlightU,
      highlightS,
      highlightI,
      highlightC
    );

    this.uncoverTheHighlightDefault = this.add
      .sprite(161, 141, "UNCOVER_THE_DEFAULT")
      .setAlpha(0.5)
      .setVisible(false);

    this.uncoverTheHighlightTint = this.add
      .sprite(161, 141, "UNCOVER_THE_TINT")
      .setAlpha(0.5)
      .setVisible(false);

    Promise.all([import(/* webpackMode: "lazy" */ "./GameScene")]).then(
      ([GameScene]) => {
        this.connection = new Client(config.wsHost);
        this.registry.set("connection", this.connection);

        console.debug("Scenes loaded");
        events.ui.emit.open("lobby");

        this.gameScene = this.scene.add("GameScene", GameScene.default, false);

        this.loaded = true;
      }
    );
  }

  update(time: number) {
    // MUSIC Highlight Animation
    if (time > this.highlightTimer) {
      // Hide the current highlight

      // Moves to the next highlight
      this.highlightIndex =
        (this.highlightIndex + 1) % this.highlightPatterns.length;

      const pattern = this.highlightPatterns[this.highlightIndex];

      const [M, U, S, I, C, UNCOVER_THE = 0] = pattern;

      if (this.highlights.length > 0) {
        this.highlights[0].setVisible(M !== 0);
        this.highlights[1].setVisible(U !== 0);
        this.highlights[2].setVisible(S !== 0);
        this.highlights[3].setVisible(I !== 0);
        this.highlights[4].setVisible(C !== 0);
      }

      if (M === 2) {
        this.highlights[0].setTint(0xff0000);
      } else {
        this.highlights[0].clearTint();
      }
      if (U === 2) {
        this.highlights[1].setTint(0xff0000);
      } else {
        this.highlights[1].clearTint();
      }
      if (S === 2) {
        this.highlights[2].setTint(0xff0000);
      } else {
        this.highlights[2].clearTint();
      }
      if (I === 2) {
        this.highlights[3].setTint(0xff0000);
      } else {
        this.highlights[3].clearTint();
      }
      if (C === 2) {
        this.highlights[4].setTint(0xff0000);
      } else {
        this.highlights[4].clearTint();
      }

      if (UNCOVER_THE === 0) {
        this.uncoverTheHighlightDefault.setVisible(false);
        this.uncoverTheHighlightTint.setVisible(false);
      } else if (UNCOVER_THE === 1) {
        this.uncoverTheHighlightDefault.setVisible(false);
        this.uncoverTheHighlightTint.setVisible(true);
      } else if (UNCOVER_THE === 2) {
        this.uncoverTheHighlightDefault.setVisible(true);
        this.uncoverTheHighlightTint.setVisible(false);
      }

      // Update the timer for the next highlight
      this.highlightTimer = time + this.highlightDelayMs;

      if (
        this.highlightIndex > this.highlightPatterns.length / 2 &&
        this.loaded
      ) {
        events.ui.emit.open("lobby");
        this.loaded = null;
      }
    }
  }

  onJoin(gameId: string) {
    this.scene.start(this.gameScene, { gameId, connection: this.connection });
  }
}

export default LoadingScene;
