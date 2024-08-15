import { IDirection } from "@vegos-studio/common";
import {
  ClothingBottomType,
  ClothingHairType,
  ClothingTopType,
  ClothingType,
  EyeType,
  FaceType,
  ShoeType,
} from "./ClothingType";

export interface AvatarState {
  id: number;
  gender: string;
  direction: IDirection;
  isWalking: boolean;
  isSitting: boolean;
  isSpeaking: boolean;
  isDancing: boolean;
  clothes: {
    hair: ClothingHairType;
    head: 1 | 2 | 3 | 4;
    body: ClothingType;
    legs: ClothingBottomType;
    top: ClothingTopType;
    eyes: EyeType;
    face: FaceType;
    shoes: ShoeType;
  };
}
