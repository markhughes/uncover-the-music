const positions: Record<string, any> = {
  pos_1: { x: 20, y: 190 },
  pos_2: { x: 135, y: 130 },
  pos_3: { x: 235, y: 80 },
};
export class ScorePadSprite extends Phaser.GameObjects.Sprite {
  static createAndAdd(scene: Phaser.Scene, pos: number) {
    const { x, y } = positions["pos_" + pos] ?? { x: 0, y: 0 };

    const sprite = new ScorePadSprite(scene, x, y, pos);
    scene.add.existing(sprite);
    sprite.setInteractive({ useHandCursor: false, pixelPerfect: true });

    return sprite;
  }
  constructor(scene: Phaser.Scene, x: number, y: number, private pos: number) {
    super(scene, x, y, "player_scorepad");
    const self = this;
    self.setDepth(1);
  }
}
