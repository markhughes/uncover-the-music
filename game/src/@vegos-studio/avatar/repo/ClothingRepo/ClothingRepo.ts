import { Repo } from "@vegos-studio/common";

import { ShoeRepo } from "./children/ShoeRepo";
import { HairRepo } from "./children/HairRepo";
import { BodyRepo } from "./children/BodyRepo";

// @ts-ignore
import csvData from "../../../../assets/parts/schema.csv";
import { HeadRepo } from "./children/HeadRepo";
import { ShoulderRepo } from "./children/ShoulderRepo";
import { BottomRepo } from "./children/BottomRepo";
import { TopRepo } from "./children/TopRepo";
import { HandRepo } from "./children/HandRepo";
import { FaceRepo } from "./children/FaceRepo";
import { EyeRepo } from "./children/EyeRepo";

const avatarSchemaBuild: { [key: string]: (typeof csvData)[0] } = {};

csvData.forEach((row: Record<string, string>) => {
  avatarSchemaBuild[row.MemberName] = row;
});

type RepoMapping = {
  HeadRepo: HeadRepo;
  BodyRepo: BodyRepo;
  TopRepo: TopRepo;
  BottomRepo: BottomRepo;
  ShoulderRepo: ShoulderRepo;
  ShoeRepo: ShoeRepo;
  HairRepo: HairRepo;
  HandRepo: HandRepo;
  FaceRepo: FaceRepo;
  EyeRepo: EyeRepo;
};

export class ClothingRepo extends Repo<never, RepoMapping> {
  private globalOffsetX = 0;
  private globalOffsetY = 100;

  constructor() {
    super(null, [
      ["HeadRepo", new HeadRepo()],
      ["BodyRepo", new BodyRepo()],
      ["TopRepo", new TopRepo()],
      ["BottomRepo", new BottomRepo()],
      ["ShoulderRepo", new ShoulderRepo()],
      ["ShoeRepo", new ShoeRepo()],
      ["HairRepo", new HairRepo()],
      ["HandRepo", new HandRepo()],
      ["FaceRepo", new FaceRepo()],
      ["EyeRepo", new EyeRepo()],
    ]);
  }

  getOffsetPositionFor(assetNane: string) {
    if (!avatarSchemaBuild[assetNane]) {
      console.warn("getOffsetPositionFor", `Asset ${assetNane} is not defined`);
      return {
        x: 0,
        y: 0,
      };
    }
    const { RegPointH, RegPointV } = avatarSchemaBuild[assetNane];

    const x = this.globalOffsetX - RegPointH;
    const y = this.globalOffsetY - RegPointV;

    return {
      x,
      y,
    };
  }
}
