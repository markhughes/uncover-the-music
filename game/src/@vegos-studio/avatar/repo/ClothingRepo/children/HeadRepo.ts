import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";

export interface HeadItem extends Asset {}

// Repository of heads
export class HeadRepo extends Repo<HeadItem> {
  constructor() {
    const parts: [string, HeadItem][] = [];

    parts.push(...HeadRepo.getStandAnimations());

    super(parts);
  }

  getDescriber(
    headChoice: 1 | 2 | 3 | 4,
    action: "spk" | "std",
    direction: IDirection,
    frame: number = 0
  ) {
    if (action === "spk") {
      return this.getItem(
        getAssetName({
          action: "sit",
          part: "hd",
          partCode: headChoice.toFixed().padStart(3, "0"),
          number: direction.number,
          frame,
        })
      );
    }

    return this.getItem(
      getAssetName({
        action: "std",
        part: "hd",
        partCode: headChoice.toFixed().padStart(3, "0"),
        number: direction.number,
        frame,
      })
    );
  }

  // -------------------------------------------------------
  // STATIC HELPERS
  // -------------------------------------------------------

  private static getStandAnimations() {
    const parts: [string, HeadItem][] = [];

    const partCodes = ["001", "002", "003", "004"];
    const directions = [0, 1, 2, 3, 7];

    for (const partCode of partCodes) {
      for (const number of directions) {
        const bodyPart: HeadItem = {
          action: "std",
          part: "hd",
          partCode,
          number,
          frame: 0,
        };

        parts.push([getAssetName(bodyPart), bodyPart]);
      }
    }

    return parts;
  }

  private static getSpeakAnimations() {
    const parts: [string, HeadItem][] = [];

    return parts;
  }
}
