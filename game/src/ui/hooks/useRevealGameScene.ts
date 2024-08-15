import { useEffect, useState } from "react";
import GameScene from "../../scenes/GameScene";

export const useRevealGameScene = () => {
  const [scene, setScene] = useState<GameScene | null>(null);

  useEffect(() => {
    const scene = new GameScene();
    if (scene) {
      setScene(scene);
    }
  }, []);

  return scene;
};
