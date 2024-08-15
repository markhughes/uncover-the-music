import express from "express";
import http from "http";
import { Server, matchMaker } from "colyseus";
import { Reveal_GameRoom } from "./classes/uncoverTheMusic/Reveal_GameRoom";
import { WebSocketTransport } from "@colyseus/ws-transport";

import cors from "cors";
import { banner } from "./common/banner";

banner("Uncover The Music", "1.0.0");

const app = express();
const gameServer = new Server({
  greet: false,
  transport: new WebSocketTransport({
    server: http.createServer(app),
  }),
});

app.use(cors());
app.use(express.json());

gameServer.define("Reveal_GameRoom", Reveal_GameRoom);

/**
 * CREATE ROOM
 * Creates a new room
 */
app.post("/reveal/create", async (req, res) => {
  const roomName = req.body.roomName;

  const room = await matchMaker.createRoom("Reveal_GameRoom", {
    roomName,
  });
  room.metadata = { roomName };
  res.send({ roomId: room.roomId });
});

/**
 * LIST ROOMS
 * Lists rooms available
 */
app.get("/reveal/rooms", async (req, res) => {
  const options = { name: "Reveal_GameRoom" };
  const rooms = await matchMaker.query(options);
  rooms.forEach((room) => {});
  res.send(rooms);
});

gameServer.listen(2567);
