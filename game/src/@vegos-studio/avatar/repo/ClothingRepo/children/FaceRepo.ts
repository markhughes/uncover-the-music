import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";
import { FaceType } from "@vegos-studio/avatar/types/ClothingType";

export interface FaceRepoItem extends Asset {}

export class FaceRepo extends Repo<FaceRepoItem> {
  constructor() {
    const parts: [string, FaceRepoItem][] = [];

    parts.push(...FaceRepo.getAllParts());

    super(parts);
  }

  getDescriber(
    action: "std" | "srp" | "spk" | "sml" | "sad" | "agr",
    part: FaceType,
    direction: IDirection,
    frame: number = 0
  ) {
    return this.getItem(
      getAssetName({
        action: action,
        part: "fc",
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
    const parts: [string, FaceRepoItem][] = [];

    const partCodes = ["001", "002", "003", "004"];

    const actions = ["std", "srp", "spk", "sml", "sad", "agr"];
    const possibleParts = ["fc"];

    for (const possiblePart of possibleParts) {
      for (const partCode of partCodes) {
        for (const action of actions) {
          let maxAnimations = 0;
          let directions = [1, 2, 3];

          if (action === "spk") {
            maxAnimations = 1;
          }

          for (const number of directions) {
            let i = 0;
            while (i <= maxAnimations) {
              const bodyPart: FaceRepoItem = {
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
