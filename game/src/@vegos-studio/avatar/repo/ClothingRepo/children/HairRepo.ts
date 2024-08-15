import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";
import { ClothingHairType } from "@vegos-studio/avatar/types/ClothingType";

export interface HairRepoItem extends Asset {}

export class HairRepo extends Repo<HairRepoItem> {
  constructor() {
    const parts: [string, HairRepoItem][] = [];

    parts.push(...HairRepo.getAllBottoms());

    super(parts);
  }

  getDescriber(
    action: /*'spk' | */ "std",
    part: ClothingHairType,
    direction: IDirection,
    frame: number = 0
  ) {
    return this.getItem(
      getAssetName({
        action: action,
        part: "hr",
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
    const parts: [string, HairRepoItem][] = [];

    const partCodes = [
      "001",
      // '002',
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
    ];

    const actions = [/*'spk',*/ "std"];
    const possibleParts = ["hr"];

    for (const possiblePart of possibleParts) {
      for (const partCode of partCodes) {
        for (const action of actions) {
          let maxAnimations = 0;
          let directions = [0, 1, 2, 3, 7];

          // if (action === 'spk') {
          //   maxAnimations = 0;
          // }

          for (const number of directions) {
            let i = 0;
            while (i <= maxAnimations) {
              const bodyPart: HairRepoItem = {
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
