import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";

export interface BodyItem extends Asset {
  gender: "M" | "F";
}

export class BodyRepo extends Repo<BodyItem> {
  constructor() {
    const parts: [string, BodyItem][] = [];

    parts.push(...BodyRepo.getSitAnimations());
    parts.push(...BodyRepo.getStandAnimations());
    parts.push(...BodyRepo.getWalkAnimations());

    super(parts);
  }

  getDescriber(
    gender: "M" | "M",
    action: "sit" | "std" | "wlk",
    direction: IDirection,
    frame: number = 0
  ) {
    if (action === "sit") {
      return this.getItem(
        getAssetName({
          action: "sit",
          part: "bd",
          partCode: gender === "M" ? "001" : "002",
          number: direction.number,
          frame,
        })
      );
    }

    if (action === "wlk") {
      return this.getItem(
        getAssetName({
          action: "wlk",
          part: "bd",
          partCode: gender === "M" ? "001" : "002",
          number: direction.number,
          frame,
        })
      );
    }

    return this.getItem(
      getAssetName({
        action: "std",
        part: "bd",
        partCode: gender === "M" ? "001" : "002",
        number: direction.number,
        frame,
      })
    );
  }

  // -------------------------------------------------------
  // STATIC HELPERS
  // -------------------------------------------------------

  private static getSitAnimations() {
    const parts: [string, BodyItem][] = [];

    const partCodes = ["001", "002"];
    const directions = [0, 2];

    for (const partCode of partCodes) {
      for (const number of directions) {
        const bodyPart: BodyItem = {
          action: "sit",
          part: "bd",
          partCode,
          number,
          frame: 0,
          gender: partCode === "001" ? "M" : "F",
        };

        parts.push([getAssetName(bodyPart), bodyPart]);
      }
    }

    return parts;
  }

  private static getStandAnimations() {
    const parts: [string, BodyItem][] = [];

    const partCodes = ["001", "002"];
    const directions = [0, 1, 2, 3, 7];

    for (const partCode of partCodes) {
      for (const number of directions) {
        const bodyPart: BodyItem = {
          action: "std",
          part: "bd",
          partCode,
          number,
          frame: 0,
          gender: partCode === "001" ? "M" : "F",
        };

        parts.push([getAssetName(bodyPart), bodyPart]);
      }
    }

    return parts;
  }

  private static getWalkAnimations() {
    const parts: [string, BodyItem][] = [];

    const partCodes = ["001", "002"];
    const directions = [0, 1, 2, 3, 7];
    const frames = [0, 1, 2, 3];

    for (const partCode of partCodes) {
      for (const number of directions) {
        for (const frame of frames) {
          const bodyPart: BodyItem = {
            action: "wlk",
            part: "bd",
            partCode,
            number,
            frame,
            gender: partCode === "001" ? "M" : "F",
          };

          parts.push([getAssetName(bodyPart), bodyPart]);
        }
      }
    }

    return parts;
  }
}
