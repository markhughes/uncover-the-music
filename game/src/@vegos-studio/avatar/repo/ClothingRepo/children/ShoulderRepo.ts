import { Repo, Asset, getAssetName, IDirection } from "@vegos-studio/common";
import { ClothingType } from "@vegos-studio/avatar/types/ClothingType";

export interface ShoulderItem extends Asset {}

export class ShoulderRepo extends Repo<ShoulderItem> {
  constructor() {
    const parts: [string, ShoulderItem][] = [];

    parts.push(...ShoulderRepo.getAllShoulders());

    super(parts);
  }

  getDescriber(
    shoulder: "ls" | "rs",
    action: "crr" | "std" | "sit" | "wlk",
    part: ClothingType,
    direction: IDirection,
    frame: number = 0
  ) {
    return this.getItem(
      getAssetName({
        action: action,
        part: shoulder,
        partCode: part.toString().padStart(3, "0"),
        number: direction.number,
        frame,
      })
    );
  }

  // -------------------------------------------------------
  // STATIC HELPERS
  // -------------------------------------------------------

  private static getAllShoulders() {
    const parts: [string, ShoulderItem][] = [];

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
    const actions = ["crr", "std", "wlk"];
    const possibleParts = ["ls", "rs"];

    for (const possiblePart of possibleParts) {
      for (const partCode of partCodes) {
        for (const action of actions) {
          let animations = [0];
          let directions = [0, 1, 2, 3, 7];

          if (action === "wlk") {
            if (possiblePart === "ls") {
              animations = [0, 2];
            } else {
              animations = [1, 3];
            }

            directions = [0, 2];
          }

          if (action === "sit") {
            directions = [0, 2];
          }

          for (const number of directions) {
            // h_wlk_ls_004_0_0.png
            for (const animation of animations) {
              const bodyPart: ShoulderItem = {
                action,
                part: possiblePart,
                partCode,
                number,
                frame: animation,
              };

              const assetName = getAssetName(bodyPart);

              const ignore = [
                "h_wlk_ls_004_0_0",
                "h_wlk_ls_004_0_2",
                "h_wlk_ls_004_2_0",
                "h_wlk_ls_004_2_2",

                "h_wlk_ls_005_0_0",
                "h_wlk_ls_005_0_2",
                "h_wlk_ls_005_2_0",
                "h_wlk_ls_005_2_2",

                "h_wlk_ls_006_0_0",
                "h_wlk_ls_006_0_2",
                "h_wlk_ls_006_2_0",
                "h_wlk_ls_006_2_2",
              ];

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
