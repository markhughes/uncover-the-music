import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";
import { ClothingBottomType } from "@vegos-studio/avatar/types/ClothingType";

export interface BottomRepoItem extends Asset {}

export class BottomRepo extends Repo<BottomRepoItem> {
  constructor() {
    const parts: [string, BottomRepoItem][] = [];

    parts.push(...BottomRepo.getAllBottoms());

    super(parts);
  }

  getDescriber(
    action: "std" | "sit" | "wlk",
    part: ClothingBottomType,
    direction: IDirection,
    frame: number = 0
  ) {
    return this.getItem(
      getAssetName({
        action: action,
        part: "lg",
        partCode: part.toString().padStart(3, "0"),
        number: direction.number,
        frame,
      })
    );
  }

  // -------------------------------------------------------
  // STATIC HELPERS
  // -------------------------------------------------------

  private static getAllBottoms() {
    const parts: [string, BottomRepoItem][] = [];

    const partCodes = [
      "001",
      "002",
      "003",
      "004",
      "005",
      "006",
      "007",
      "008",
      "009",
      "010",
      "011",
      "012",
      "013",
    ];

    const actions = ["std", "wlk"];
    const possibleParts = ["lg"];

    for (const possiblePart of possibleParts) {
      for (const partCode of partCodes) {
        for (const action of actions) {
          let maxAnimations = 0;
          let directions = [0, 1, 2, 3, 7];

          if (action === "wlk") {
            maxAnimations = 3;
            directions = [0, 2];

            if (possiblePart === "rs") {
              continue;
            }
          }

          for (const number of directions) {
            let i = 0;
            while (i <= maxAnimations) {
              const bodyPart: BottomRepoItem = {
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
