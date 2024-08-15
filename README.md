<p align="center">
  <img src="https://github.com/markhughes/uncover-the-music/blob/main/media/uncover-the-music.png?raw=true"/>
</p>

# Uncover The Music

This project is a rebuild of "Uncover The Music", a game from the MyCoke/Coke Studios/Coke Music.

Originally created for the Vegos Studio project.

As I do not have access to the original sounds, it uses audio from the mixer.

This inclues an older version of the Avatar scene which can rebuild avatars. If you are interested in that check out `game/src/@vegos-studio/avatar`, `game/src/assets/parts`, and `game/src/assets/parts/schema.csv`.

I have also included some research fles in `_resources`.

The project is partially setup with Module Federation, as the orginal Vegos Studio project used that.

## Getting started

There are two projects, the **game** itself - using React + Phaser, and the **server** - using colyseus.

### Game

To run locally install your dependencies, and run dev

```
cd game/
yarn
yarn dev
```

### Server

To run locally install your dependencies, and run start

```
cd server/
yarn
yarn start
```

## TODO

- Cleanup of project, its picked out of an nx project so it's messy
- Find and update the original sounds
- Avatar Placement
- Missing labels and placement for final 2 players
- Test lots
- Bugs out currently when a player leaves
- Finish UI components
- Create production builds
