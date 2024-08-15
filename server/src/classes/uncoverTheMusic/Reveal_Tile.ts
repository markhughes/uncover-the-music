import { Schema, type } from "@colyseus/schema";

export class Reveal_Tile extends Schema {
  @type("number") id!: number;
  @type("boolean") isVisible: boolean = true;
  @type("boolean") isMatched: boolean = false;
  @type("boolean") isRevealed: boolean = false;

  isWildCard(): boolean {
    return this.id === 12;
  }
  isPassCard(): boolean {
    return this.id === 13;
  }
}
