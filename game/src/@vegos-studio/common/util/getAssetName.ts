import { Asset } from '../asset';

export function getAssetName(asset: Asset): string {
  if (!asset) {
    console.warn('getAssetName', 'Asset is not defined');
    return '';
  }
  return `h_${asset.action}_${asset.part}_${
    asset.partCode
  }_${asset.number.toString()}_${asset.frame.toString()}`;
}
