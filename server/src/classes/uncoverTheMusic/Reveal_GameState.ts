import { ArraySchema, MapSchema, Schema, type } from "@colyseus/schema";
import { Reveal_Player } from "./Reveal_Player";
import { Reveal_Tile } from "./Reveal_Tile";

export class Reveal_GameState extends Schema {
  @type({ map: Reveal_Player }) players = new MapSchema<Reveal_Player>();
  @type(["string"]) playerOrder = new ArraySchema<string>();

  @type([Reveal_Tile]) tiles = new ArraySchema<Reveal_Tile>();
  @type("number") currentTurn: number = 0;
  @type("boolean") isStarted: boolean = false;

  @type("string") hostId: string = "";
  @type("string") currentPlayer: string | null = null;

  @type("boolean") isEndingTurn: boolean = false;
}
