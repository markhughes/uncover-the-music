import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";
import {
  ClothingBottomType,
  ClothingTopType,
} from "@vegos-studio/avatar/types/ClothingType";

export interface TopRepoItem extends Asset {}

export class TopRepo extends Repo<TopRepoItem> {
  constructor() {
    const parts: [string, TopRepoItem][] = [];

    parts.push(...TopRepo.getAllTops());

    super(parts);
  }

  getDescriber(
    action: "std",
    part: ClothingTopType,
    direction: IDirection,
    frame: number = 0
  ) {
    return this.getItem(
      getAssetName({
        action: action,
        part: "ch",
        partCode: part.toString().padStart(3, "0"),
        number: direction.number,
        frame,
      })
    );
  }

  // -------------------------------------------------------
  // STATIC HELPERS
  // -------------------------------------------------------

  private static getAllTops() {
    const parts: [string, TopRepoItem][] = [];

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
      "014",
      "015",
      "016",
      "017",
      "018",
      "019",
      "020",
      "021",
      "022",
      "023",
      "024",
      "025",
      "026",
      "027",
      "028",
    ];

    const actions = ["std"];
    const possibleParts = ["ch"];

    for (const possiblePart of possibleParts) {
      for (const partCode of partCodes) {
        for (const action of actions) {
          let maxAnimations = 0;
          let directions = [0, 1, 2, 3, 7];

          for (const number of directions) {
            let i = 0;
            while (i <= maxAnimations) {
              const bodyPart: TopRepoItem = {
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
