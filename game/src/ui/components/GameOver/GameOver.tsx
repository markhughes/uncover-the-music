import React, { useEffect, useState } from "react";
import Draggable from "react-draggable";

import styles from "./GameOver.module.scss";
import { useGameStore } from "../../../store/gameStore";
import { events } from "../../../gameEvents";
export const GameOver = () => {
  const players = useGameStore((state) => state.players);
  console.log("players", players);
  const [open, setOpen] = useState(false);

  useEffect(() => {
    const uiOpen = (what: string) => {
      if (what === "end") {
        setOpen(true);
      }
    };

    const uiClose = (what: string) => {
      if (what === "end") {
        setOpen(false);
      }
    };

    events.ui.on.open(uiOpen);

    events.ui.on.close(uiClose);

    return () => {
      events.ui.off.open(uiOpen);
      events.ui.off.close(uiClose);
    };
  });
  // end
  return (
    <>
      {open && (
        <Draggable>
          <div className={styles.gameover}>
            <div className={styles.banner}></div>
            <div className={styles.header}></div>
            {Object.entries(players).map(([pos, player]) => {
              if (!player) {
                return null;
              }
              return (
                <div className={styles.line} key={player.id}>
                  <div>{player.name}</div>
                  <div>{player.matches}</div>
                  <div>{player.bonus}</div>
                  <div>{player.score}</div>
                </div>
              );
            })}
          </div>
        </Draggable>
      )}
    </>
  );
};
