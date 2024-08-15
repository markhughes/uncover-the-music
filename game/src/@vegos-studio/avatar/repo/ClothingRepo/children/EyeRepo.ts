import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";
import { EyeType, FaceType } from "@vegos-studio/avatar/types/ClothingType";

export interface EyeRepoItem extends Asset {}

export class EyeRepo extends Repo<EyeRepoItem> {
  constructor() {
    const parts: [string, EyeRepoItem][] = [];

    parts.push(...EyeRepo.getAllParts());

    super(parts);
  }

  getDescriber(
    action: "std" | "srp" | "sml" | "sad" | "agr" | "eyb",
    part: EyeType,
    direction: IDirection,
    frame: number = 0
  ) {
    return this.getItem(
      getAssetName({
        action: action,
        part: "ey",
        partCode: part.toString().padStart(3, "0"),
        number: direction.number,
        frame,
      })
    );
  }

  // -------------------------------------------------------
  // STATIC HELPERS
  // -------------------------------------------------------

  private static getAllParts() {
    const parts: [string, EyeRepoItem][] = [];

    const partCodes = ["001", "002", "003", "004", "005", "006", "007", "008"];

    const actions = ["std", "srp", "sml", "sad", "agr", "eyb"];
    const possibleParts = ["ey"];

    for (const possiblePart of possibleParts) {
      for (const partCode of partCodes) {
        for (const action of actions) {
          let maxAnimations = 0;
          let directions = [1, 2, 3];

          for (const number of directions) {
            let i = 0;
            while (i <= maxAnimations) {
              const bodyPart: EyeRepoItem = {
                action,
                part: possiblePart,
                partCode,
                number,
                frame: i,
              };

              const assetName = getAssetName(bodyPart);

              const ignore: string[] = [];

              // TODO: is there a better way to determine what to ignore?
              if (!ignore.includes(assetName)) {
                parts.push([assetName, bodyPart]);
              }

              i++;
            }
          }
        }
      }
    }

    return parts;
  }
}
