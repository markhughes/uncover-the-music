export interface IDirection {
  number: number;
  flip: boolean;
}
export const Direction: Record<string, IDirection> = {
  North: {
    number: 7,
    flip: false,
  },
  NorthEast: {
    number: 0,
    flip: false,
  },
  East: {
    number: 1,
    flip: false,
  },
  SouthEast: {
    number: 2,
    flip: false,
  },
  South: {
    number: 3,
    flip: false,
  },

  // flipped variants
  SouthWest: {
    number: 2,
    flip: true,
  },
  West: {
    number: 1,
    flip: true,
  },
  NorthWest: {
    number: 0,
    flip: true,
  },
};

export const DirectionNames = Object.keys(Direction);

export const getNextDirection = (
  directionName: string,
  reverse: boolean = false
): string => {
  const directionIndex = DirectionNames.indexOf(directionName);

  if (reverse) {
    if (directionIndex === 0) {
      return DirectionNames[DirectionNames.length - 1];
    }
    return DirectionNames[directionIndex - 1];
  } else {
    if (directionIndex === DirectionNames.length - 1) {
      return DirectionNames[0];
    }
    return DirectionNames[directionIndex + 1];
  }
};
