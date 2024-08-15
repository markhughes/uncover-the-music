import Phaser = require("phaser");

export class FederatedScene extends Phaser.Scene {
  private debugTexts: Phaser.GameObjects.Text[] = [];

  private federationDebug = false;

  setIsDebug(enabledDebug: boolean) {
    this.federationDebug = enabledDebug;
  }

  isFederatedModule(module: any) {
    console.log("document.currentScript", document.currentScript);
    // @ts-ignore
    return Boolean(__webpack_require__.m[module.id]);
  }

  getAssetUrl(assetName: string) {
    if ("process" in globalThis) {
      if (process.env["ASSET_BASE_URL"]) {
        return `${process.env["ASSET_BASE_URL"]}/assets/${assetName}.png`;
      }
    }
    return `${assetName}.png`;
  }

  updateDebugInfo(
    sprite: Phaser.GameObjects.Sprite,
    index: number,
    label: string
  ) {
    if (!this.federationDebug) {
      return;
    }
    if (!this.debugTexts[index]) {
      this.debugTexts[index] = this.add.text(200, index * 80, "", {
        fontSize: "14px",
        color: "#FFFFFF",
        backgroundColor: "#000000",
      });
    }

    const anim = sprite?.anims?.currentAnim
      ? sprite.anims.currentAnim.key
      : "None";

    this.debugTexts[index].setText(
      `Sprite ${label} Info:\n` +
        `texture key: ${sprite?.texture?.key ?? "null"}\n` +
        `x: ${sprite?.x?.toFixed(2) ?? "null"}\n` +
        `y: ${sprite?.y?.toFixed(2) ?? "null"}\n` +
        `Animation: ${anim}\n` +
        `---------`
    );
  }
}
