import React, { useEffect, useState } from "react";

import Draggable from "react-draggable";

import styles from "./CaptainInterface.module.scss";
import { createSelector, useUIStore } from "../../../store/store";
import { events } from "../../../gameEvents";
import { useGameStore } from "../../../store/gameStore";

const defaultPosition = { x: 334, y: 27 };

const selector = createSelector("captain");

export const CaptainInterface = () => {
  const players = useGameStore((state) => state.players);

  const isOpen = useUIStore(selector);
  const [counter, setCounter] = useState(-1);
  useEffect(() => {
    const openCaptain = (time: number) => {
      setCounter(time);
      useUIStore.getState().open("captain");
    };

    events.game.on.openCaptain(openCaptain);

    return () => {
      events.game.off.openCaptain(openCaptain);
    };
  }, []);

  useEffect(() => {
    if (Object.keys(players).length >= 3 && counter === -1) {
      setCounter(30);
    }
  }, [players, counter, setCounter]);

  useEffect(() => {
    let timerId: NodeJS.Timeout;
    // start countdown only when counter is above 0
    if (counter > 0) {
      timerId = setInterval(() => {
        setCounter((prevCounter) => prevCounter - 1);
      }, 1000);
    }

    // once counter is 0, clear the interval and call your function
    if (counter === 0) {
      clearInterval(timerId);
      // call your function here
      console.log("Countdown finished!");
      events.game.emit.start();
      useUIStore.getState().close("captain");
    }

    // clear the interval when the component unmounts
    return () => clearInterval(timerId);
  }, [counter]);

  return (
    isOpen && (
      <Draggable defaultPosition={defaultPosition}>
        <div className={styles.captain}>
          <div className={styles.captainInfo}>
            <div className={styles.captainInfoText}>
              {counter === -1
                ? `Waiting on at least 3 players`
                : `The game will start in:`}
            </div>
          </div>
          <div className={styles.captainTimer}>
            {counter === -1 ? `∞` : counter}
          </div>
          <div className={styles.captainButtons}>
            {counter === -1 ? (
              <div className={styles.captainButton}>
                <button className={styles.btn}>Cancel</button>
              </div>
            ) : (
              <>
                <div className={styles.captainButton}>
                  <button className={styles.btn} onClick={() => setCounter(0)}>
                    Start Now
                  </button>
                </div>
                <div className={styles.captainButton}>
                  <button className={styles.btn} onClick={() => setCounter(30)}>
                    Wait
                  </button>
                </div>
              </>
            )}
          </div>
        </div>
      </Draggable>
    )
  );
};
