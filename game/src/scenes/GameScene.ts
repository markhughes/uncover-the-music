import Phaser from "phaser";
import { Client, Room } from "colyseus.js";

import TileSprite from "../sprites/TileSprite";
import { gameStore, useGameStore } from "../store/gameStore";
import { ScorePadSprite } from "../sprites/ScorePadSprite";
import { Connection } from "colyseus.js/lib/Connection";
import { events } from "../gameEvents";
import { AvatarScene } from "@vegos-studio/avatar/scenes/AvatarScene";

class GameScene extends Phaser.Scene {
  private static instance: GameScene = undefined;
  public static getInstance(): GameScene | undefined {
    return GameScene.instance ?? undefined;
  }

  constructor() {
    super({ key: "gameScene" });
    GameScene.instance = this;

    (globalThis as any).gameScene = this;
  }

  public gameId: string;
  public room: Room;
  public connection: Client;

  private map: TileSprite[] = [];

  private userId: string = crypto.randomUUID();

  private timer: Phaser.GameObjects.Sprite;

  private scorePads: Record<string, ScorePadSprite> = {};

  private totems: Record<string, Phaser.GameObjects.Sprite> = {
    pos_0: null,
    pos_1: null,
    pos_2: null,
    pos_3: null,
    pos_4: null,
  };
  private poles: Record<string, Phaser.GameObjects.Sprite> = {
    pos_0: null,
    pos_1: null,
    pos_2: null,
    pos_3: null,
    pos_4: null,
  };

  private cover: Phaser.GameObjects.Sprite;

  private avatars: Record<string, Phaser.Scene> = {};

  public getRoom(): Room {
    return this.room;
  }

  init(data: { gameId: string; connection: Client }): void {
    this.gameId = data.gameId;
    this.connection = data.connection;
  }

  preload() {
    this.load.image("background-grid", "background-grid.jpg");
    this.load.image("background-grid-bottom", "background-grid-bottom.png");
    this.load.image(
      "background-grid-bottom-cover",
      "background-bottom-cover.png"
    );
    this.load.image("grain", "grain.png");

    this.load.audio("tile01", "sounds/01.mp3");
    this.load.audio("tile02", "sounds/02.mp3");
    this.load.audio("tile03", "sounds/03.mp3");
    this.load.audio("tile04", "sounds/04.mp3");
    this.load.audio("tile05", "sounds/05.mp3");
    this.load.audio("tile06", "sounds/06.mp3");
    this.load.audio("tile07", "sounds/07.mp3");
    this.load.audio("tile08", "sounds/08.mp3");
    this.load.audio("tile09", "sounds/09.mp3");
    this.load.audio("tile10", "sounds/10.mp3");
    this.load.audio("tile11", "sounds/11.mp3");

    this.load.audio("frog", "sounds/frogged.mp3");
    this.load.audio("snake", "sounds/snaked.mp3");

    this.load.image("tile_covered", "tile-rotated.png");
    this.load.image("tile_music", "tile-rotated-music.png");

    this.load.image("cover", "cover.png");

    this.load.image("player_scorepad", "player/scorepad.png");
    this.load.spritesheet("frogged", "sheets/frogged.png", {
      frameWidth: 119,
      frameHeight: 73,
    });

    this.load.spritesheet("snaked", "sheets/snaked.png", {
      frameWidth: 204,
      frameHeight: 1126,
    });

    this.load.spritesheet("timer", "sheets/timer.png", {
      frameWidth: 99,
      frameHeight: 69,
    });

    this.load.spritesheet("totemhead", "sheets/totemhead.png", {
      frameWidth: 131,
      frameHeight: 135,
    });

    this.load.spritesheet("pole", "sheets/pole.png", {
      frameWidth: 66,
      frameHeight: 314,
    });

    // 164px, height: 127px, frames: 3
    this.load.spritesheet("water_side", "sheets/finish/water-side.png", {
      frameWidth: 164,
      frameHeight: 127,
    });

    // width: 56px, height: 255px, frames: 3,
    this.load.spritesheet("water_top", "sheets/finish/water-top.png", {
      frameWidth: 56,
      frameHeight: 255,
    });

    // width: 40px, height: 70px, frames: 3
    this.load.spritesheet("water_bottom", "sheets/finish/water-bottom.png", {
      frameWidth: 40,
      frameHeight: 70,
    });

    // width: 455px, height: 236px, frames: 6,
    this.load.spritesheet("water_pool", "sheets/finish/water-pool.png", {
      frameWidth: 455,
      frameHeight: 236,
    });

    // width: 496px, height: 325px, frames: 5
    this.load.spritesheet("water_splash", "sheets/finish/water-splash.png", {
      frameWidth: 496,
      frameHeight: 325,
    });

    // width: 275px, height: 175px, frames: 24
    this.load.spritesheet("sparkles", "sheets/finish/sparkles.png", {
      frameWidth: 275,
      frameHeight: 175,
    });

    //width: 185px, height: 110px, frames: 12,
    this.load.spritesheet("decibles", "sheets/finish/decibles.png", {
      frameWidth: 185,
      frameHeight: 110,
    });
  }

  createTile(y: number, x: number, i: number) {
    const self = this;

    const tileWidth = 164 / 2;
    const tileHeight = 80 / 2;
    const space = 5;
    const offsetX = 415;
    const offsetY = 290;

    let tileX = offsetX + ((x - y) * (tileWidth + space)) / 2;
    let tileY = offsetY + ((x + y) * (tileHeight + space)) / 2;

    const tile = TileSprite.createAndAdd(self, tileX, tileY, i, (tile, i) =>
      this.tileClick(tile, i)
    );

    let grainEffect = this.add.sprite(tile.x, tile.y, "grain");

    grainEffect.setScale(
      tile.width / grainEffect.width,
      tile.height / grainEffect.height
    );
    grainEffect.blendMode = Phaser.BlendModes.SCREEN;

    let mask = tile.createBitmapMask();

    grainEffect.setMask(mask);

    return tile;
  }

  private colourSourceInactive = 0xcacaca;
  private colourSourceActive = 0xffffee;

  activatePlayer() {
    this.map.forEach((tile) => {
      tile.activateTile();
    });

    this.lights.setAmbientColor(this.colourSourceActive);
  }

  deactivatePlayer() {
    this.lights.setAmbientColor(this.colourSourceInactive);

    this.map.forEach((tile) => {
      try {
        tile.deactivateTile();
      } catch (err) {
        // incase it was nuked!
      }
    });
  }

  setInactive() {}

  reset() {
    const map = [
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
    ];

    let i = 0;
    for (let y = 0; y < map.length; y++) {
      for (let x = 0; x < map[y].length; x++) {
        if (map[y][x] === 1) {
          this.map[i] = this.createTile(y, x, i);
          i++;
        }
      }
    }
  }

  tileClick(tile: TileSprite, i: number) {
    tile.clearTint();
    tile.setInteractive(false);
    this.room.send("reveal_tile", {
      command: "reveal_tile",
      tileIndex: i,
    });
  }

  createServer() {
    this.room.onMessage("player_joined", (data) => {
      let { id, seat, name, host }: Record<string, any> = data;
      console.debug("[GameScene] player_joined", data);
      gameStore.getState().add(seat, id, name);

      // add their scorepad
      this.scorePads[seat] = ScorePadSprite.createAndAdd(this, seat);

      const totem = this.totems[`pos_${seat}`];

      totem.play("totemheadAnimation");
      const jiggleTween = this.tweens.add({
        targets: totem,
        y: "+=2",
        duration: 100,
        ease: "Sine.inOut",
        yoyo: true,
        repeat: -1,
      });

      const stopTween = () => {
        totem.off("animationcomplete", stopTween);
      };

      totem.on("animationcomplete", function () {
        // stop the jiggle animation
        jiggleTween.stop();
      });

      console.debug(`Player ${id} joined ${seat}.`);

      if (id === this.room.sessionId && host) {
        events.ui.emit.open("captain");
      }

      // Add the avatar

      const sceneKey = `AvatarScene_${id}`;

      console.debug(`Adding avatar to seat ${seat} for ${id} as ${sceneKey}`);

      let sceneData = {
        debug: false,
        avatarId: "123",
        avatarGender: "male",
        key: sceneKey,
        x: 300,
        y: 200,
      };
      switch (seat) {
      }

      console.log(this.scene.manager);
      if (!this.scene.get(sceneKey)) {
        this.scene.add(sceneKey, AvatarScene, false, sceneData);
        console.debug(`Added avatar scene for key: ${sceneKey}`);
      } else {
        console.debug(`Skipping, scene with key: ${sceneKey} already created.`);
      }

      this.scene.launch(sceneKey, sceneData);

      events.game.emit.playerJoin(id);
    });

    this.room.onMessage("player_left", ({ id, seat }: Record<string, any>) => {
      console.debug("[GameScene] player_left", id, seat);
      if (this.scorePads[seat]) {
        gameStore.getState().remove(seat);

        this.scorePads[seat].destroy();
        this.scorePads[seat] = null;
      }
      console.debug(`Player ${id} left.`);
    });

    this.room.onMessage("player_update", ({ id, bonus, matches, score }) => {
      console.debug("[GameScene] player_update", id, bonus, matches, score);
      gameStore.getState().update(id, { bonus, matches, score });
    });

    this.room.onMessage(
      "reveal_tile",
      ({ tileIndex, tileType }: Record<string, any>) => {
        console.debug("[GameScene] reveal_tile i:", tileIndex, "t:" + tileType);
        if (tileType <= 11) {
          this.map[tileIndex].setUncovered(this.map[tileIndex]);

          let tileSound;
          if (tileType < 10) {
            tileSound = "tile0" + tileType.toString();
          } else {
            tileSound = "tile" + tileType.toString();
          }

          console.log("tileSound", tileSound);

          this.sound.play(tileSound);
        } else if (tileType === 12) {
          this.map[tileIndex].setFrogged();
        } else if (tileType === 13) {
          this.deactivatePlayer();
          this.map[tileIndex].setSnaked();
        }
      }
    );

    this.room.onMessage("end_turn", ({ next }: Record<string, any>) => {
      console.debug("[GameScene] end_turn", next);
      Object.values(this.map).forEach((tile) => {
        tile.setCovered();
      });

      if (next === this.userId) {
        this.activatePlayer();
      } else {
        this.deactivatePlayer();
      }

      this.startTimer();
    });

    this.room.onMessage("tile_fall", ({ tileIndexs }: Record<string, any>) => {
      console.debug("[GameScene] tile_fall", tileIndexs);
      const tiles = this.map.filter((_, index) => {
        return tileIndexs.includes(index);
      });

      tiles.forEach((tile) => tile.fall());
    });

    this.room.onMessage("start_game", ({ next }: Record<string, any>) => {
      console.debug("[GameScene] start_game", next);
      this.startMainGame();
      setTimeout(() => {
        if (next === this.userId) {
          this.activatePlayer();
        } else {
          this.deactivatePlayer();
        }
        this.startTimer();
      }, 1000);
    });

    this.room.onMessage("end_game", () => {
      this.endSequence();
    });
  }

  startTimer() {
    this.timer.play("timerAnimation");
  }

  startMainGame() {
    this.tweens.add({
      targets: this.cover,
      alpha: 0,
      duration: 1000,
      ease: "Linear",
      onComplete: () => {
        this.cover.destroy();

        this.tweens.add({
          delay: 200,
          targets: this.map,
          alpha: 1,

          duration: 1000,
          ease: "Linear",
          onComplete: () => {},
        });
      },
    });
  }

  create() {
    this.sound.pauseOnBlur = false;

    this.cover = this.add.sprite(369, 341, "cover").setDepth(100);

    // this.startMainGame();

    this.anims.create({
      key: "froggedAnimation",
      frames: this.anims.generateFrameNumbers("frogged", { start: 0, end: 10 }),
      frameRate: 10,
      repeat: 0,
      delay: 500,
    });

    this.anims.create({
      key: "snakedAnimation",
      frames: this.anims.generateFrameNumbers("snaked", { start: 0, end: 25 }),
      frameRate: 10,
      repeat: 0,
      delay: 2000,
    });

    this.anims.create({
      key: "timerAnimation",
      frames: this.anims.generateFrameNumbers("timer", { start: 0, end: 90 }),
      frameRate: 6,
      repeat: 0,
      delay: 0,
    });

    this.anims.create({
      key: "totemheadAnimation",
      frames: this.anims.generateFrameNumbers("totemhead", {
        start: 0,
        end: 24,
      }),
      frameRate: 24,
      repeat: 0,
      delay: 0,
    });

    this.anims.create({
      key: "poleDownAnimation",
      frames: this.anims.generateFrameNumbers("pole", {
        start: 109,
        end: 0,
      }),
      frameRate: 24,
      repeat: 0,
      delay: 0,
    });

    this.totems.pos_0 = this.add
      .sprite(67, 130, "totemhead")
      .setDepth(100)
      .setFlipX(false);
    this.totems.pos_1 = this.add
      .sprite(175, 74, "totemhead")
      .setDepth(100)
      .setFlipX(false);
    this.totems.pos_2 = this.add
      .sprite(278, 22, "totemhead")
      .setDepth(100)
      .setFlipX(false);
    this.totems.pos_3 = this.add
      .sprite(569, 34, "totemhead")
      .setDepth(100)
      .setFlipX(true);
    this.totems.pos_4 = this.add
      .sprite(677, 91, "totemhead")
      .setDepth(100)
      .setFlipX(true);

    this.poles.pos_0 = this.add
      .sprite(94, 242, "pole", 1)
      .setDepth(100)
      .setScale(0.8, 0.8);

    this.poles.pos_1 = this.add
      .sprite(205, 185, "pole", 1)
      .setDepth(100)
      .setScale(0.8, 0.8);

    this.poles.pos_2 = this.add
      .sprite(305, 134, "pole", 1)
      .setDepth(100)
      .setScale(0.8, 0.8);

    this.poles.pos_3 = this.add
      .sprite(541, 144, "pole", 1)
      .setDepth(100)
      .setFlipX(true)
      .setScale(0.8, 0.8);

    this.poles.pos_4 = this.add
      .sprite(648, 202, "pole", 1)
      .setDepth(100)
      .setFlipX(true)
      .setScale(0.8, 0.8);

    //321.9999999196906, y: 466
    // const dragsprite = this.add.sprite(
    //   322,
    //   466,
    //   "background-grid-bottom-cover"
    // );
    // dragsprite.setInteractive();
    // dragsprite.setDepth(90100);
    // this.input.setDraggable(dragsprite);

    // this.input.on(
    //   "drag",
    //   (pointer: any, gameObject: any, dragX: any, dragY: any) => {
    //     gameObject.x = dragX;
    //     gameObject.y = dragY;
    //   }
    // );

    // this.input.on("dragend", (pointer: any, gameObject: any) => {
    //   console.log(`Sprite released at x: ${gameObject.x}, y: ${gameObject.y}`);
    // });

    this.timer = this.add.sprite(662, 406, "timer").setDepth(1001);
    this.lights.enable();

    // this.startTimer();

    this.lights.setAmbientColor(this.colourSourceInactive);

    this.lights.addLight(400, 300, 600, 0xffffee, 0);

    this.add.image(0, 0, "background-grid").setOrigin(0, 0);

    const bottomGrid = this.add.image(
      0,
      this.sys.game.config.height as number,
      "background-grid-bottom"
    );
    bottomGrid.setOrigin(0, 1);
    bottomGrid.setDepth(1000);

    const bottomGridCover = this.add.sprite(
      322,
      466,
      "background-grid-bottom-cover"
    );
    bottomGridCover.setDepth(1002);

    this.reset();

    events.game.on.start(() => {
      console.log("starting..");
      this.room.send("start_game");
    });

    this.connection
      .join("Reveal_GameRoom", {
        gameId: this.gameId,
      })
      .then((room) => {
        this.room = room;
        this.userId = room.sessionId;
        this.createServer();
      });
  }

  endSequence() {
    // clean up anything
    this.map.forEach((tile) => tile.destroy());
    this.cover.destroy();
    this.timer.setAlpha(0);
    try {
      this.timer.anims.setProgress(0);
      this.timer.anims.stop();
    } catch (e) {
      // incase the timer is nuked
    }

    // animations
    this.anims.create({
      key: "waterSideAnimation",
      frames: this.anims.generateFrameNumbers("water_side", {
        start: 0,
        end: 2,
      }),
      frameRate: 12,
      repeat: -1,
      delay: 0,
    });

    this.anims.create({
      key: "waterTopAnimation",
      frames: this.anims.generateFrameNumbers("water_top", {
        start: 0,
        end: 2,
      }),
      frameRate: 12,
      repeat: -1,
      delay: 0,
    });

    this.anims.create({
      key: "waterBottomAnimation",
      frames: this.anims.generateFrameNumbers("water_bottom", {
        start: 0,
        end: 2,
      }),
      frameRate: 12,
      repeat: -1,
      delay: 0,
    });

    this.anims.create({
      key: "waterPoolAnimation",
      frames: this.anims.generateFrameNumbers("water_pool", {
        start: 0,
        end: 5,
      }),
      frameRate: 12,
      repeat: -1,
      delay: 0,
      yoyo: true,
    });

    this.anims.create({
      key: "waterSplashAnimation",
      frames: this.anims.generateFrameNumbers("water_splash", {
        start: 0,
        end: 4,
      }),
      frameRate: 12,
      repeat: -1,
      delay: 0,
    });

    this.anims.create({
      key: "deciblesAnimation",
      frames: this.anims.generateFrameNumbers("decibles", {
        start: 0,
        end: 11,
      }),
      frameRate: 6,
      repeat: -1,
      delay: 0,
    });

    this.anims.create({
      key: "sparklesAnimation",
      frames: this.anims.generateFrameNumbers("sparkles", {
        start: 0,
        end: 23,
      }),
      frameRate: 12,
      repeat: -1,
      delay: 0,
    });

    // srpites w/ their animations and depths sorted

    const waterLeft = this.add.sprite(211, 407, "water_side").setAlpha(0.6);
    waterLeft.anims.play("waterSideAnimation");

    const waterRight = this.add.sprite(533, 356, "water_side").setAlpha(0.6);
    waterRight.anims.play("waterSideAnimation");
    waterRight.setFlipX(true);

    // 426, y: 323
    const waterTop = this.add.sprite(426, 323, "water_top").setAlpha(0.6);
    waterTop.anims.play("waterTopAnimation");

    // 335, y: 437
    const waterBottom = this.add.sprite(335, 437, "water_bottom").setAlpha(0.6);
    waterBottom.anims.play("waterBottomAnimation");
    waterBottom.setDepth(3);

    // 361, y: 538 -> 373, y: 347
    const waterPool = this.add.sprite(361, 538, "water_pool").setAlpha(0.6);
    waterPool.anims.play("waterPoolAnimation");
    waterPool.setDepth(1);

    const waterPoolOffset1 = this.add
      .sprite(361, 538, "water_pool")
      .setAlpha(0.8);
    const waterPoolOffset2 = this.add
      .sprite(361, 538, "water_pool")
      .setAlpha(0.8);
    const waterPoolOffset3 = this.add
      .sprite(361, 538, "water_pool")
      .setAlpha(0.8);

    //  386, y: 287
    const sparkles = this.add.sprite(386, 287, "sparkles").setAlpha(0);
    sparkles.anims.play("sparklesAnimation");

    // 362, y: 348
    const waterSplash = this.add.sprite(362, 348, "water_splash").setAlpha(0.7);
    waterSplash.setDepth(3);
    waterSplash.anims.play("waterSplashAnimation");

    // start water tween
    this.tweens.add({
      targets: waterPool,
      x: 373,
      y: 347,
      duration: 10000,
      repeat: 0,
      onUpdate: function () {
        waterPoolOffset1.x = waterPool.x;
        waterPoolOffset1.y = waterPool.y + waterPool.height * 0.2;

        waterPoolOffset2.x = waterPool.x;
        waterPoolOffset2.y = waterPool.y + waterPool.height * 0.3;

        waterPoolOffset3.x = waterPool.x;
        waterPoolOffset3.y = waterPool.y + waterPool.height * 0.4;
      },
      onComplete: () => {
        waterTop.destroy();
        waterBottom.destroy();
        waterLeft.destroy();
        waterRight.destroy();

        this.tweens.add({
          targets: sparkles,
          alpha: 0.5,
          duration: 200,
        });

        this.tweens.add({
          targets: waterSplash,
          alpha: 0,
          duration: 1000,
          repeat: 0,
          scale: 0.5,
          onComplete: () => {
            waterSplash.destroy();
          },
        });
      },
    });

    // decibles tween
    // x:360 y: 525 -> 372, y: 343
    const decibles = this.add.sprite(360, 525, "decibles").setAlpha(1);
    decibles.setDepth(2);
    decibles.anims.play("deciblesAnimation");
    this.tweens.add({
      targets: decibles,
      x: 372,
      y: 343,
      duration: 10000,
      repeat: 0,

      onComplete: () => {
        events.ui.emit.open("end");
      },
    });

    // // // x:360 y: 151 -> 372, y: 343
    // const dragsprite = this.add.sprite(300, 100, "sparkles").setAlpha(1);

    // dragsprite.setInteractive();
    // dragsprite.setDepth(100);
    // this.input.setDraggable(dragsprite);

    // this.input.on(
    //   "drag",
    //   (pointer: any, gameObject: any, dragX: any, dragY: any) => {
    //     gameObject.x = dragX;
    //     gameObject.y = dragY;
    //   }
    // );

    // this.input.on("dragend", (pointer: any, gameObject: any) => {
    //   console.log(`Sprite released at x: ${gameObject.x}, y: ${gameObject.y}`);
    // });
  }

  update() {
    // ??
  }
}

export default GameScene;
