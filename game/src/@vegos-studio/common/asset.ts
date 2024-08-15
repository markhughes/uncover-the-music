//   const imageName = `h_${describer.action}_${describer.part}_${describer.partCode}_${describer.direction.number}_${describer.frame}`;

export interface Asset {
  action: string;
  part: string;
  partCode: string;
  number: number;
  frame: number;
}
