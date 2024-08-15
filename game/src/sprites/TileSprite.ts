class TileSprite extends Phaser.GameObjects.Sprite {
  static createAndAdd(
    scene: Phaser.Scene,
    x: number,
    y: number,
    i: number,
    tileClick: (tile: TileSprite, i: number) => void
  ) {
    const sprite = new TileSprite(scene, x, y, i, tileClick);
    scene.add.existing(sprite); // Add sprite to scene here
    sprite.setInteractive({ useHandCursor: false, pixelPerfect: true }); // Then make it interactive

    return sprite;
  }

  private frogSprite: Phaser.GameObjects.Sprite;

  hoverTween?: Phaser.Tweens.Tween;
  hoverTweenOver?: Phaser.Tweens.Tween;

  private isActive = false;
  private i = -1;

  private startX: number;
  private startY: number;

  public isUncovered = false;
  public fallen = false;

  constructor(
    scene: Phaser.Scene,
    x: number,
    y: number,
    i: number,
    tileClick: (tile: TileSprite, i: number) => void
  ) {
    super(scene, x, y, "tile_covered");
    const self = this;
    self.setDepth(i * 2);

    self.startX = x;
    this.startY = y;

    self.i = i;
    self.isActive = false;

    self.setOrigin(0.5, 1);

    self.scaleY = 0.5;
    self.alpha = 0.5;

    const randomHoverY = Phaser.Math.Between(2, 5);
    self.hoverTween = scene.tweens.add({
      targets: self,
      y: `-=${randomHoverY}`,
      duration: Phaser.Math.Between(1000, 1300),
      yoyo: true,
      repeat: -1,
    });

    self.on("pointerover", function () {
      if (self.fallen) return;

      if (!self.isActive) {
        return;
      }
      self.setTint(0xadd8e6);
      self.hoverTween.pause();

      self.hoverTweenOver = self.scene.tweens.add({
        targets: this,
        y: "-=1",
        duration: 200,
      });
    });

    self.on("pointerout", function () {
      if (self.fallen) return;

      if (!self.isActive) {
        return;
      }

      self.clearTint();

      if (self.hoverTweenOver) {
        self.hoverTweenOver.stop();
      }
      self.y = y;

      self.hoverTween.resume();
    });

    this.on("pointerdown", function () {
      if (self.fallen) return;

      if (!self.isActive) {
        return;
      }

      tileClick(self, self.i);
    });

    this.setPipeline("Light2D");
  }

  preUpdate(time: number, delta: number) {
    super.preUpdate(time, delta);

    if (!this.input) {
      this.setInteractive(true);
    }
  }

  activateTile() {
    if (this.fallen) return;

    this.setInteractive({ useHandCursor: true, pixelPerfect: true }); // Then make it interactive
    this.isActive = true;
  }

  deactivateTile() {
    this.setInteractive({ pixelPerfect: true }); // Then make it interactive
    this.isActive = false;
  }

  setUncovered(self: TileSprite) {
    console.log(self);
    if (self.fallen) return;

    self.isUncovered = true;
    self.setTexture("tile_music");
  }

  setCovered() {
    if (this.fallen) return;

    this.isUncovered = false;

    this.clearTint();
    this.setTexture("tile_covered");
  }

  setFrogged() {
    const tileWidth = 164 / 2 + 10;
    const tileHeight = 80 / 2 + 10;
    this.isActive = false;
    this.hoverTween.pause();
    this.y = this.startY;
    this.frogSprite = this.scene.add.sprite(this.x, this.y - 10, "frogged");
    this.frogSprite.setOrigin(0.5, 1);
    this.frogSprite.setDepth(this.depth + 1);
    const scaleX = tileWidth / this.frogSprite.width;
    const scaleY = tileHeight / this.frogSprite.height;
    this.frogSprite.setScale(scaleX, scaleY);
    this.frogSprite.play("froggedAnimation");

    this.scene.sound.play("frog");
  }

  setSnaked() {
    this.clearTint();
    this.isActive = false;
    if (this.hoverTween) {
      this.hoverTween.pause();
    }
    this.y = this.startY;
    const snaked = this.scene.add.sprite(this.x - 60, this.y + 470, "snaked");
    snaked.setDepth(1001);
    snaked.setAlpha(0);

    this.scene.tweens.add({
      targets: snaked,
      alpha: 1,
      duration: 1000,
      ease: "Linear",
      delay: 400,
    });

    snaked.play("snakedAnimation");
    this.scene.sound.play("snake");
  }

  fall() {
    this.fallen = true;
    if (this?.hoverTween?.isActive) {
      try {
        this.hoverTween.pause();
      } catch (e) {
        // this can break if cleaned up
      }
    }
    if (this?.hoverTweenOver?.isActive) {
      try {
        this.hoverTweenOver.pause();
      } catch (e) {
        // this can break if cleaned up
      }
    }

    this.scene.tweens.add({
      targets: this.frogSprite ? [this, this.frogSprite] : [this],
      y: "+=500", // Move down by 100 pixels
      duration: 2000, // 2 seconds
    });
  }
}

export default TileSprite;
