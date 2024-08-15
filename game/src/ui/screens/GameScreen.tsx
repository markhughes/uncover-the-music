import React from "react";

import { useGameStore } from "../../store/gameStore";

import { PlayerText } from "../components/PlayerText";
import { CaptainInterface } from "../components/CaptainInterface/CaptainInterface";
import { GameOver } from "../components/GameOver/GameOver";

const playerNamePositions = [
  { top: 305, left: 130 }, // pos1
  { top: 250, left: 240 }, // pos2
  { top: 200, left: 342 }, // pos3
];

const PlayerNames = () => {
  const players = useGameStore((state) => state.players);

  return (
    <>
      {Object.entries(players).map(([pos, player]) => {
        // These are lazy fixes to
        if (!player) {
          return;
        }

        if (typeof player !== "object") {
          return null;
        }
        if (!("name" in player)) {
          return null;
        }

        // Incase posiion is not registered
        const posInt = parseInt(pos);
        if (Number.isNaN(posInt) || posInt >= playerNamePositions.length) {
          return null;
        }

        const { top, left } = playerNamePositions[posInt];
        return (
          <PlayerText
            key={player.name}
            text={player.name}
            top={top}
            left={left}
          />
        );
      })}
    </>
  );
};

export const GameScreen = () => {
  return (
    <>
      <PlayerNames />
      <CaptainInterface />
      <GameOver />
    </>
  );
};
