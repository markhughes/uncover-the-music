import { IDirection } from "@vegos-studio/common";
import { BodyPart } from "../types/BodyPart";

export const defaultDrawOrder = [
  BodyPart.LeftHand,
  BodyPart.LeftShoulder,
  BodyPart.Body,
  BodyPart.Shoes,
  BodyPart.ClothesLegs,
  BodyPart.ClothesChest,
  BodyPart.RightItem,
  BodyPart.RightHand,
  BodyPart.RightShoulder,
  BodyPart.Head,
  BodyPart.Face,

  BodyPart.Eyes,

  BodyPart.Hair,
  BodyPart.Headphones,
];

export function getDrawOrder(
  iDirection: IDirection,
  isDancing: boolean,
  isWalking: boolean
) {
  let drawOrder: BodyPart[] = [];

  switch (iDirection.number) {
    case 1:
    case 5:
      drawOrder = [
        BodyPart.Body,
        BodyPart.Shoes,
        BodyPart.ClothesLegs,
        BodyPart.LeftHand,
        BodyPart.LeftShoulder,
        BodyPart.ClothesChest,
        BodyPart.Head,
        BodyPart.Face,
        BodyPart.Eyes,
        BodyPart.RightItem,
        BodyPart.RightHand,
        BodyPart.RightShoulder,
        BodyPart.Hair,
        BodyPart.Headphones,
      ];
      break;
    case 4:
    case 2:
      if (isDancing && !isWalking) {
        drawOrder = [
          BodyPart.LeftHand,
          BodyPart.LeftShoulder,
          BodyPart.Body,
          BodyPart.Shoes,
          BodyPart.ClothesLegs,
          BodyPart.ClothesChest,
          BodyPart.RightItem,
          BodyPart.RightHand,
          BodyPart.RightShoulder,
          BodyPart.Head,
          BodyPart.Face,
          BodyPart.Eyes,
          BodyPart.Hair,
          BodyPart.Headphones,
        ];
      } else {
        drawOrder = [
          BodyPart.Body,
          BodyPart.Shoes,
          BodyPart.ClothesLegs,
          BodyPart.LeftHand,
          BodyPart.LeftShoulder,
          BodyPart.ClothesChest,
          BodyPart.Head,
          BodyPart.Face,
          BodyPart.Eyes,
          BodyPart.RightItem,
          BodyPart.RightHand,
          BodyPart.RightShoulder,
          BodyPart.Hair,
          BodyPart.Headphones,
        ];
      }
      break;
    case 3:
      drawOrder = [
        BodyPart.Body,
        BodyPart.Shoes,
        BodyPart.ClothesLegs,
        BodyPart.ClothesChest,
        BodyPart.LeftHand,
        BodyPart.LeftShoulder,
        BodyPart.Head,
        BodyPart.Face,
        BodyPart.Eyes,
        BodyPart.RightItem,
        BodyPart.RightHand,
        BodyPart.RightShoulder,
        BodyPart.Hair,
        BodyPart.Headphones,
      ];
      break;
    case 7:
      drawOrder = [
        BodyPart.LeftHand,
        BodyPart.LeftShoulder,
        BodyPart.Body,
        BodyPart.Shoes,
        BodyPart.ClothesLegs,
        BodyPart.ClothesChest,
        BodyPart.RightItem,
        BodyPart.RightHand,
        BodyPart.RightShoulder,
        BodyPart.Head,
        BodyPart.Hair,
        BodyPart.Headphones,
      ];
      break;
    case 6:
    case 0:
      if (isDancing && !isWalking) {
        drawOrder = [
          BodyPart.LeftHand,
          BodyPart.LeftShoulder,
          BodyPart.Body,
          BodyPart.Shoes,
          BodyPart.ClothesLegs,
          BodyPart.ClothesChest,
          BodyPart.RightItem,
          BodyPart.RightHand,
          BodyPart.RightShoulder,
          BodyPart.Head,
          BodyPart.Face,
          BodyPart.Eyes,
          BodyPart.Hair,
          BodyPart.Headphones,
        ];
      } else {
        drawOrder = [
          BodyPart.LeftHand,
          BodyPart.LeftShoulder,
          BodyPart.Body,
          BodyPart.Shoes,
          BodyPart.ClothesLegs,
          BodyPart.ClothesChest,
          BodyPart.RightItem,
          BodyPart.RightHand,
          BodyPart.RightShoulder,
          BodyPart.Head,
          BodyPart.Hair,
          BodyPart.Headphones,
        ];
      }
      break;
    default:
      drawOrder = defaultDrawOrder;
  }

  return drawOrder;
}
