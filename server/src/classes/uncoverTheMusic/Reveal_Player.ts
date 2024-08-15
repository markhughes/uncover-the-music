import { Schema, type } from "@colyseus/schema";

export class Reveal_Player extends Schema {
  @type("string") id!: string;
  @type("number") seat!: number;
  @type("boolean") isHost: boolean = false;

  @type("number") score: number = 0;
  @type("number") matches: number = 0;
  @type("number") bonus: number = 0;

  // in-play values
  @type("number") frogMatch: number = -1;
  @type("number") reveals: number = 0;
  @type("number") currentTile: number = -1;
}
