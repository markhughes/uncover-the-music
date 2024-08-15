// hooks/useRevealGameRooms.ts
import { useSyncExternalStore } from "react";
import { config } from "../../config";

/*
  {
    "clients": 1,
    "locked": false,
    "private": false,
    "maxClients": 5,
    "name": "Reveal_GameRoom",
    "processId": "8LrBGpxcE",
    "roomId": "pTrfXQ0ui",
    "createdAt": "2023-06-07T06:05:32.002Z",
    "unlisted": false
  }

*/
type Room = {
  clients: number;
  locked: boolean;
  private: boolean;
  maxClients: number;
  name: string;
  processId: string;
  roomId: string;
  createdAt: string;
  unlisted: boolean;
  metadata: Record<string, string>;
};

let roomsStore = {
  rooms: [] as Room[],
  listeners: new Set<() => void>(),

  setRooms(newRooms: Room[]) {
    roomsStore.rooms = newRooms;
    roomsStore.listeners.forEach((listener: () => void) => listener());
  },

  subscribe(listener: () => void) {
    roomsStore.listeners.add(listener);
    return () => {
      roomsStore.listeners.delete(listener);
    };
  },

  fetchRooms: async () => {
    try {
      const response = await fetch(`${config.httpHost}/reveal/rooms`);
      const rooms = await response.json();
      roomsStore.setRooms(rooms);
    } catch (e) {
      setTimeout(() => {
        roomsStore.fetchRooms();
      }, 500);
    }
  },
};

roomsStore.fetchRooms();

setInterval(async () => {
  await roomsStore.fetchRooms();
}, 5000);

export const useRevealGameRooms = () =>
  useSyncExternalStore(roomsStore.subscribe, () => roomsStore.rooms);
