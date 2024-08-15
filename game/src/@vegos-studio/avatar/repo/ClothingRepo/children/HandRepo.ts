import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";

export interface HandRepoItem extends Asset {}

export class HandRepo extends Repo<HandRepoItem> {
  constructor() {
    const parts: [string, HandRepoItem][] = [];

    parts.push(...HandRepo.getAllShoulders());

    super(parts);
  }

  getDescriber(
    hand: "lh" | "rh",
    action: "crr" | "std" | "sit" | "wlk",
    direction: IDirection,
    frame: number = 0
  ) {
    return this.getItem(
      getAssetName({
        action: action,
        part: hand,
        partCode: "001",
        number: direction.number,
        frame,
      })
    );
  }

  // -------------------------------------------------------
  // STATIC HELPERS
  // -------------------------------------------------------

  private static getAllShoulders() {
    const parts: [string, HandRepoItem][] = [];

    const partCodes = ["001"];
    const actions = ["crr", "drk", "std", "wlk"];
    const possibleParts = ["lh", "rh"];

    for (const possiblePart of possibleParts) {
      for (const partCode of partCodes) {
        for (const action of actions) {
          let animations = [0];
          let directions = [0, 1, 2, 3, 7];

          if (action === "wlk") {
            animations = [1, 3];
            directions = [0, 2];

            // if (possiblePart === 'rs') {
            //   continue;
            // }
          }

          if (action === "sit") {
            directions = [0, 2];
          }

          for (const number of directions) {
            // h_wlk_ls_004_0_0.png
            for (const animation of animations) {
              const bodyPart: HandRepoItem = {
                action,
                part: possiblePart,
                partCode,
                number,
                frame: animation,
              };

              const assetName = getAssetName(bodyPart);

              const ignore: string[] = [];

              // TODO: is there a better way to determine what to ignore?
              if (!ignore.includes(assetName)) {
                parts.push([assetName, bodyPart]);
              }
            }
          }
        }
      }
    }

    return parts;
  }
}
