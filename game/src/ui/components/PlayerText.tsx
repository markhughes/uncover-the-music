import React from "react";

import styles from "./PlayerText.module.scss";

interface PlayerPropProps {
  text: string;
  left: number;
  top: number;
}
export const PlayerText = ({ top, left, text }: PlayerPropProps) => {
  return (
    <div
      id="overlay"
      style={{
        position: "absolute",
        top: `${top}px`,
        left: `${left}px`,
        fontFamily: "Arial",
      }}
    >
      <div className={styles.text}>{text}</div>
    </div>
  );
};
