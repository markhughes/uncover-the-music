import { AvatarState } from "../types/AvatarState";
import { ClothingRepo } from "../repo/ClothingRepo/ClothingRepo";
import { Direction, FederatedScene, getAssetName } from "@vegos-studio/common";
import { getDrawOrder } from "../utils/getDrawOrder";
import { BodyPart } from "../types/BodyPart";

export class AvatarScene extends FederatedScene {
  private readonly walkingFrameRate = 6;

  private avatarState: AvatarState;

  private avatarContainer: Phaser.GameObjects.Container;

  private avatarHead: Phaser.GameObjects.Sprite;
  private avatarBody: Phaser.GameObjects.Sprite;
  private avatarLeftShoulder: Phaser.GameObjects.Sprite;
  private avatarRightShoulder: Phaser.GameObjects.Sprite;
  private avatarEyes: Phaser.GameObjects.Sprite;
  private avatarFace: Phaser.GameObjects.Sprite;
  private avatarHair: Phaser.GameObjects.Sprite;
  private avatarTop: Phaser.GameObjects.Sprite;
  private avatarHandLeft: Phaser.GameObjects.Sprite;
  private avatarHandRight: Phaser.GameObjects.Sprite;
  private avatarLegs: Phaser.GameObjects.Sprite;
  private avatarShoes: Phaser.GameObjects.Sprite;

  private clothingRepo: ClothingRepo;

  private drawOrder: BodyPart[] = [];

  private isDebug = false;

  private x: number = 10;
  private y: number = 10;

  constructor() {
    super();
    this.clothingRepo = new ClothingRepo();
  }

  preload() {
    Object.keys(
      this.clothingRepo.getChildRepo("HairRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("HeadRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("BodyRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("TopRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("BottomRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("ShoeRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("ShoulderRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("HandRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("FaceRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });

    Object.keys(
      this.clothingRepo.getChildRepo("EyeRepo").getAllItems()
    ).forEach((key) => {
      this.load.image(key, this.getAssetUrl("parts/" + key));
    });
  }

  private wKey: Phaser.Input.Keyboard.Key;
  private key1: Phaser.Input.Keyboard.Key;
  private key2: Phaser.Input.Keyboard.Key;
  private key3: Phaser.Input.Keyboard.Key;
  private key4: Phaser.Input.Keyboard.Key;
  private key5: Phaser.Input.Keyboard.Key;
  private key6: Phaser.Input.Keyboard.Key;
  private key7: Phaser.Input.Keyboard.Key;
  private key8: Phaser.Input.Keyboard.Key;

  create(data: Record<any, any>) {
    this.cameras.main.backgroundColor.setTo(0, 0, 0, 0);

    this.isDebug = !!data.debug;
    this.setIsDebug(this.isDebug);
    console.log("this.data", this.data);
    if (this.isDebug) {
      console.log("Debug", "enabled");
    }

    if (data.x) {
      this.x = data.x;
      console.debug(`Avatar x pos set to ${this.x}`);
    }
    if (data.y) {
      this.y = data.y;
      console.debug(`Avatar y pos set to ${this.y}`);
    }

    if (this.isDebug) {
      this.wKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.W);
      this.key1 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.ONE
      );
      this.key2 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.TWO
      );
      this.key3 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.THREE
      );
      this.key4 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.FOUR
      );
      this.key5 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.FIVE
      );
      this.key6 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.SIX
      );
      this.key7 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.SEVEN
      );
      this.key8 = this.input.keyboard.addKey(
        Phaser.Input.Keyboard.KeyCodes.EIGHT
      );
    }

    // define avatar's state
    this.avatarState = {
      id: 1,
      gender: "male",
      direction: Direction.SouthEast,
      isWalking: false,
      isSitting: false,
      isSpeaking: false,
      isDancing: false,
      clothes: {
        hair: 1,
        head: 1,
        body: 1,
        legs: 1,
        top: 1,
        eyes: 1,
        face: 1,
        shoes: 1,
      },
    };

    this.drawBody();
  }

  private readonly AVATAR_DEPTH_OFFSET = 10;

  drawBody() {
    this.drawOrder = getDrawOrder(
      this.avatarState.direction,
      this.avatarState.isDancing,
      this.avatarState.isWalking
    );

    if (!this.avatarContainer) {
      this.avatarContainer = this.add.container(this.x, this.y);
    }

    // --------------------------------------------------
    // HAIR
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("HairRepo")
          .getDescriber(
            "std",
            this.avatarState.clothes.hair,
            this.avatarState.direction
          )
      );

      const partPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarHair) {
        if (partPos) {
          this.avatarHair = this.add
            .sprite(partPos.x, partPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Hair)
            );

          this.avatarContainer.add(this.avatarHair);
        }
      } else {
        if (!partPos) {
          this.avatarHair.setVisible(false);
        } else {
          this.avatarHair
            .setTexture(activePart)
            .setX(partPos.x)
            .setY(partPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Hair)
            )
            .setVisible(true);
        }
      }
    }

    // --------------------------------------------------
    // FACE
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("FaceRepo")
          .getDescriber(
            "std",
            this.avatarState.clothes.face,
            this.avatarState.direction
          )
      );

      const partPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarFace) {
        if (partPos) {
          this.avatarHair = this.add
            .sprite(partPos.x, partPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Face)
            );

          this.avatarContainer.add(this.avatarHair);
        }
      } else {
        if (!partPos) {
          // hide the face
          this.avatarFace.setVisible(false);
        } else {
          this.avatarFace.setVisible(true);

          this.avatarFace
            .setTexture(activePart)
            .setX(partPos.x)
            .setY(partPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Face)
            );
        }
      }
    }

    // --------------------------------------------------
    // EYE
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("EyeRepo")
          .getDescriber(
            "std",
            this.avatarState.clothes.eyes,
            this.avatarState.direction
          )
      );

      const partPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarEyes) {
        if (partPos) {
          this.avatarEyes = this.add
            .sprite(partPos.x, partPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Eyes)
            );

          this.avatarContainer.add(this.avatarEyes);
        }
      } else {
        if (!partPos) {
          // hide the face
          this.avatarEyes.setVisible(false);
        } else {
          this.avatarEyes
            .setTexture(activePart)
            .setX(partPos.x)
            .setY(partPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Eyes)
            )
            .setVisible(true);
        }
      }
    }

    // --------------------------------------------------
    // HEAD
    // --------------------------------------------------
    {
      const activeHead = getAssetName(
        this.clothingRepo
          .getChildRepo("HeadRepo")
          .getDescriber(
            this.avatarState.clothes.head,
            "std",
            this.avatarState.direction
          )
      );

      const headPosition = this.clothingRepo.getOffsetPositionFor(activeHead);

      if (!this.avatarHead) {
        if (headPosition) {
          this.avatarHead = this.add
            .sprite(headPosition.x, headPosition.y, activeHead)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Head)
            );

          this.avatarContainer.add(this.avatarHead);
        }
      } else {
        if (!headPosition) {
          this.avatarHead.setVisible(false);
        } else {
          this.avatarHead
            .setTexture(activeHead)
            .setX(headPosition.x)
            .setY(headPosition.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Head)
            )
            .setVisible(true);
        }
      }
    }

    // --------------------------------------------------
    // BODY
    // --------------------------------------------------
    {
      const activeBody = getAssetName(
        this.clothingRepo
          .getChildRepo("BodyRepo")
          .getDescriber("M", "std", this.avatarState.direction)
      );

      const bodyPosition = this.clothingRepo.getOffsetPositionFor(activeBody);

      if (!this.avatarBody) {
        if (bodyPosition) {
          this.avatarBody = this.add
            .sprite(bodyPosition.x, bodyPosition.y, activeBody)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Body)
            );

          this.avatarBody.on(
            "animationupdate",
            (
              _: never,
              animationFrame: Phaser.Animations.AnimationFrame,
              gameObject: Phaser.GameObjects.Sprite
            ) => {
              const frameKey = animationFrame.textureKey;
              const bodyPosition =
                this.clothingRepo.getOffsetPositionFor(frameKey);
              gameObject.x = bodyPosition.x;
              gameObject.y = bodyPosition.y;
            }
          );

          this.avatarContainer.add(this.avatarBody);
        }
      } else {
        if (!bodyPosition) {
          this.avatarBody.setVisible(false);
        } else {
          this.avatarBody
            .setTexture(activeBody)
            .setX(bodyPosition.x)
            .setY(bodyPosition.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Body)
            )
            .setVisible(true);
        }
      }

      // Body animation
      this.anims.remove("bodyWalking");
      this.anims.create({
        key: "bodyWalking",
        frames: [
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BodyRepo")
                .getDescriber("M", "wlk", this.avatarState.direction, 0)
            ),
          },
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BodyRepo")
                .getDescriber("M", "wlk", this.avatarState.direction, 1)
            ),
          },
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BodyRepo")
                .getDescriber("M", "wlk", this.avatarState.direction, 2)
            ),
          },
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BodyRepo")
                .getDescriber("M", "wlk", this.avatarState.direction, 3)
            ),
          },
        ],
        frameRate: this.walkingFrameRate,
        repeat: -1,
      });
    }

    // --------------------------------------------------
    // LEFT SHOULDER
    // --------------------------------------------------
    {
      const activeLeftShoulder = getAssetName(
        this.clothingRepo
          .getChildRepo("ShoulderRepo")
          .getDescriber(
            "ls",
            "std",
            this.avatarState.clothes.body,
            this.avatarState.direction
          )
      );

      const leftShouldPosition =
        this.clothingRepo.getOffsetPositionFor(activeLeftShoulder);

      if (!this.avatarLeftShoulder) {
        if (leftShouldPosition) {
          this.avatarLeftShoulder = this.add
            .sprite(
              leftShouldPosition.x,
              leftShouldPosition.y,
              activeLeftShoulder
            )
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.LeftShoulder)
            );

          this.avatarLeftShoulder.on(
            "animationupdate",
            (
              _: never,
              animationFrame: Phaser.Animations.AnimationFrame,
              gameObject: Phaser.GameObjects.Sprite
            ) => {
              const frameKey = animationFrame.textureKey;
              const bodyPosition =
                this.clothingRepo.getOffsetPositionFor(frameKey);
              gameObject.x = bodyPosition.x;
              gameObject.y = bodyPosition.y;
            }
          );

          this.avatarContainer.add(this.avatarLeftShoulder);
        }
      } else {
        if (!leftShouldPosition) {
          this.avatarLeftShoulder.setVisible(false);
        } else {
          this.avatarLeftShoulder
            .setTexture(activeLeftShoulder)
            .setX(leftShouldPosition.x)
            .setY(leftShouldPosition.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.LeftShoulder)
            )
            .setVisible(true);
        }
      }

      this.anims.remove("leftShoulderWalking");
      this.anims.create({
        key: "leftShoulderWalking",
        frames: [
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoulderRepo")
                .getDescriber(
                  "ls",
                  "std",
                  this.avatarState.clothes.body,
                  this.avatarState.direction,
                  0
                )
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoulderRepo")
                .getDescriber(
                  "ls",
                  "wlk",
                  this.avatarState.clothes.body,
                  this.avatarState.direction,
                  0
                )
            ),
          },
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoulderRepo")
                .getDescriber(
                  "ls",
                  "wlk",
                  this.avatarState.clothes.body,
                  this.avatarState.direction,
                  2
                )
            ),
          },
        ],
        frameRate: this.walkingFrameRate,
        repeat: -1,
      });
    }

    // --------------------------------------------------
    // RIGHT SHOULDER
    // --------------------------------------------------
    {
      const activeRightShoulder = getAssetName(
        this.clothingRepo
          .getChildRepo("ShoulderRepo")
          .getDescriber(
            "rs",
            "std",
            this.avatarState.clothes.body,
            this.avatarState.direction
          )
      );

      const rightShoulderPosition =
        this.clothingRepo.getOffsetPositionFor(activeRightShoulder);

      if (!this.avatarRightShoulder) {
        if (rightShoulderPosition) {
          this.avatarRightShoulder = this.add
            .sprite(
              rightShoulderPosition.x,
              rightShoulderPosition.y,
              activeRightShoulder
            )
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.RightShoulder)
            );
          this.avatarRightShoulder.on(
            "animationupdate",
            (
              _: never,
              animationFrame: Phaser.Animations.AnimationFrame,
              gameObject: Phaser.GameObjects.Sprite
            ) => {
              const frameKey = animationFrame.textureKey;
              const bodyPosition =
                this.clothingRepo.getOffsetPositionFor(frameKey);
              gameObject.x = bodyPosition.x;
              gameObject.y = bodyPosition.y;
            }
          );

          this.avatarContainer.add(this.avatarRightShoulder);
        }
      } else {
        if (!rightShoulderPosition) {
          this.avatarRightShoulder.setVisible(false);
        } else {
          this.avatarRightShoulder
            .setTexture(activeRightShoulder)
            .setX(rightShoulderPosition.x)
            .setY(rightShoulderPosition.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.RightShoulder)
            )
            .setVisible(true);
        }
      }

      this.anims.remove("rightShoulderWalking");
      this.anims.create({
        key: "rightShoulderWalking",
        frames: [
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoulderRepo")
                .getDescriber(
                  "rs",
                  "std",
                  this.avatarState.clothes.body,
                  this.avatarState.direction,
                  0
                )
            ),
          },
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoulderRepo")
                .getDescriber(
                  "rs",
                  "wlk",
                  this.avatarState.clothes.body,
                  this.avatarState.direction,
                  1
                )
            ),
          },
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoulderRepo")
                .getDescriber(
                  "rs",
                  "wlk",
                  this.avatarState.clothes.body,
                  this.avatarState.direction,
                  3
                )
            ),
          },
        ],
        frameRate: this.walkingFrameRate,
        repeat: -1,
      });
    }

    // --------------------------------------------------
    // LEFT HAND
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("HandRepo")
          .getDescriber("lh", "std", this.avatarState.direction)
      );

      const activePartPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarHandLeft) {
        if (activePartPos) {
          this.avatarHandLeft = this.add
            .sprite(activePartPos.x, activePartPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.LeftShoulder)
            );

          this.avatarHandLeft.on(
            "animationupdate",
            (
              _: never,
              animationFrame: Phaser.Animations.AnimationFrame,
              gameObject: Phaser.GameObjects.Sprite
            ) => {
              const frameKey = animationFrame.textureKey;
              const bodyPosition =
                this.clothingRepo.getOffsetPositionFor(frameKey);
              gameObject.x = bodyPosition.x;
              gameObject.y = bodyPosition.y;
            }
          );

          this.avatarContainer.add(this.avatarHandLeft);
        }
      } else {
        if (!activePartPos) {
          this.avatarHandLeft.setVisible(false);
        } else {
          this.avatarHandLeft
            .setTexture(activePart)
            .setX(activePartPos.x)
            .setY(activePartPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.LeftShoulder)
            )
            .setVisible(true);
        }
      }

      this.anims.remove("leftHandWalking");
      this.anims.create({
        key: "leftHandWalking",
        frames: [
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("HandRepo")
                .getDescriber("lh", "std", this.avatarState.direction, 0)
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("HandRepo")
                .getDescriber("lh", "wlk", this.avatarState.direction, 1)
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("HandRepo")
                .getDescriber("lh", "wlk", this.avatarState.direction, 3)
            ),
          },
        ],
        frameRate: this.walkingFrameRate,
        repeat: -1,
      });
    }

    // --------------------------------------------------
    // RIGHT HAND
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("HandRepo")
          .getDescriber("rh", "std", this.avatarState.direction)
      );

      const activePartPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarHandRight) {
        if (activePartPos) {
          this.avatarHandRight = this.add
            .sprite(activePartPos.x, activePartPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.LeftShoulder)
            );
          this.avatarHandRight.on(
            "animationupdate",
            (
              _: never,
              animationFrame: Phaser.Animations.AnimationFrame,
              gameObject: Phaser.GameObjects.Sprite
            ) => {
              const frameKey = animationFrame.textureKey;
              const bodyPosition =
                this.clothingRepo.getOffsetPositionFor(frameKey);
              gameObject.x = bodyPosition.x;
              gameObject.y = bodyPosition.y;
            }
          );

          this.avatarContainer.add(this.avatarHandRight);
        }
      } else {
        if (!activePartPos) {
          this.avatarHandRight.setVisible(false);
        } else {
          this.avatarHandRight
            .setTexture(activePart)
            .setX(activePartPos.x)
            .setY(activePartPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.LeftShoulder)
            )
            .setVisible(true);
        }
      }

      // Bottom animation
      this.anims.remove("rightHandWalking");
      this.anims.create({
        key: "rightHandWalking",
        frames: [
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("HandRepo")
                .getDescriber("rh", "std", this.avatarState.direction, 0)
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("HandRepo")
                .getDescriber("rh", "wlk", this.avatarState.direction, 1)
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("HandRepo")
                .getDescriber("rh", "wlk", this.avatarState.direction, 3)
            ),
          },
        ],
        frameRate: this.walkingFrameRate,
        repeat: -1,
      });
    }

    // --------------------------------------------------
    // TOPS
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("TopRepo")
          .getDescriber(
            "std",
            this.avatarState.clothes.top,
            this.avatarState.direction
          )
      );

      const partPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarTop) {
        if (partPos) {
          this.avatarTop = this.add
            .sprite(partPos.x, partPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.ClothesChest)
            );

          this.avatarContainer.add(this.avatarTop);
        }
      } else {
        if (!partPos) {
          this.avatarTop.setVisible(false);
        } else {
          this.avatarTop
            .setTexture(activePart)
            .setX(partPos.x)
            .setY(partPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.ClothesChest)
            )
            .setVisible(true);
        }
      }
    }

    // --------------------------------------------------
    // BOTTOMS
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("BottomRepo")
          .getDescriber(
            "std",
            this.avatarState.clothes.legs,
            this.avatarState.direction
          )
      );

      const partPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarLegs) {
        if (partPos) {
          this.avatarLegs = this.add
            .sprite(partPos.x, partPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.ClothesLegs)
            );
          this.avatarLegs.on(
            "animationupdate",
            (
              _: never,
              animationFrame: Phaser.Animations.AnimationFrame,
              gameObject: Phaser.GameObjects.Sprite
            ) => {
              const frameKey = animationFrame.textureKey;
              const bodyPosition =
                this.clothingRepo.getOffsetPositionFor(frameKey);
              gameObject.x = bodyPosition.x;
              gameObject.y = bodyPosition.y;
            }
          );

          this.avatarContainer.add(this.avatarLegs);
        }
      } else {
        if (!partPos) {
          this.avatarLegs.setVisible(false);
        } else {
          this.avatarLegs
            .setTexture(activePart)
            .setX(partPos.x)
            .setY(partPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET +
                this.drawOrder.indexOf(BodyPart.ClothesLegs)
            )
            .setVisible(true);
        }
      }

      //bottom animation
      this.anims.remove("bottomWalking");
      this.anims.create({
        key: "bottomWalking",
        frames: [
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BottomRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.legs,
                  this.avatarState.direction,
                  0
                )
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BottomRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.legs,
                  this.avatarState.direction,
                  1
                )
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BottomRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.legs,
                  this.avatarState.direction,
                  2
                )
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("BottomRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.legs,
                  this.avatarState.direction,
                  3
                )
            ),
          },
        ],
        frameRate: this.walkingFrameRate,
        repeat: -1,
      });
    }

    // --------------------------------------------------
    // SHOES
    // --------------------------------------------------
    {
      const activePart = getAssetName(
        this.clothingRepo
          .getChildRepo("ShoeRepo")
          .getDescriber(
            "std",
            this.avatarState.clothes.shoes,
            this.avatarState.direction
          )
      );

      const partPos = this.clothingRepo.getOffsetPositionFor(activePart);

      if (!this.avatarShoes) {
        if (partPos) {
          this.avatarShoes = this.add
            .sprite(partPos.x, partPos.y, activePart)
            .setOrigin(0, 0)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Shoes)
            );
          this.avatarShoes.on(
            "animationupdate",
            (
              _: never,
              animationFrame: Phaser.Animations.AnimationFrame,
              gameObject: Phaser.GameObjects.Sprite
            ) => {
              const frameKey = animationFrame.textureKey;
              const bodyPosition =
                this.clothingRepo.getOffsetPositionFor(frameKey);
              gameObject.x = bodyPosition.x;
              gameObject.y = bodyPosition.y;
            }
          );

          this.avatarContainer.add(this.avatarShoes);
        }
      } else {
        if (!partPos) {
          this.avatarShoes.setVisible(false);
        } else {
          this.avatarShoes
            .setTexture(activePart)
            .setX(partPos.x)
            .setY(partPos.y)
            .setDepth(
              this.AVATAR_DEPTH_OFFSET + this.drawOrder.indexOf(BodyPart.Shoes)
            )
            .setVisible(true);
        }
      }

      // Body animation
      this.anims.remove("shoesWalking");
      this.anims.create({
        key: "shoesWalking",
        frames: [
          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoeRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.shoes,
                  this.avatarState.direction,
                  0
                )
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoeRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.shoes,
                  this.avatarState.direction,
                  1
                )
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoeRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.shoes,
                  this.avatarState.direction,
                  2
                )
            ),
          },

          {
            key: getAssetName(
              this.clothingRepo
                .getChildRepo("ShoeRepo")
                .getDescriber(
                  "wlk",
                  this.avatarState.clothes.shoes,
                  this.avatarState.direction,
                  3
                )
            ),
          },
        ],
        frameRate: this.walkingFrameRate,
        repeat: -1,
      });
    }

    this.avatarContainer.sort("depth");

    if (this.avatarState.direction.flip) {
      this.avatarContainer.setScale(-1, 1);
      this.avatarContainer.x = 76;
    } else {
      this.avatarContainer.x = 0;
      this.avatarContainer.setScale(1, 1);
    }

    // normal no scaling
    // this.avatarContainer.getBounds() Rectangle {type: 5, x: 10, y: 21, width: 56, height: 99}
    // with this.avatarContainer.setScale(-1, 1);
    // this.avatarContainer.getBounds() Rectangle {type: 5, x: -46, y: 21, width: 56, height: 99}

    console.log("this.avatarContainer", this.avatarContainer.getBounds());

    console.log("state");
    console.log(this.avatarState);
    console.log();
  }

  update() {
    if (this.isDebug) {
      if (Phaser.Input.Keyboard.JustDown(this.key1)) {
        this.avatarState.direction = Direction.SouthEast;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.key2)) {
        this.avatarState.direction = Direction.East;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.key3)) {
        this.avatarState.direction = Direction.NorthEast;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.key4)) {
        this.avatarState.direction = Direction.North;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.key5)) {
        this.avatarState.direction = Direction.NorthWest;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.key6)) {
        this.avatarState.direction = Direction.West;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.key7)) {
        this.avatarState.direction = Direction.SouthWest;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.key8)) {
        this.avatarState.direction = Direction.South;
        this.drawBody();
      }

      if (Phaser.Input.Keyboard.JustDown(this.wKey)) {
        if (this.avatarState.isWalking) {
          this.avatarBody && this.avatarBody.stop();
          this.avatarLegs && this.avatarLegs.stop();
          this.avatarShoes && this.avatarShoes.stop();
          this.avatarHandLeft && this.avatarHandLeft.stop();
          this.avatarHandRight && this.avatarHandRight.stop();
          this.avatarRightShoulder && this.avatarRightShoulder.stop();
          this.avatarLeftShoulder && this.avatarLeftShoulder.stop();
        } else {
          this.avatarBody && this.avatarBody.play("bodyWalking", true);
          this.avatarLegs && this.avatarLegs.play("bottomWalking", true);
          this.avatarShoes && this.avatarShoes.play("shoesWalking", true);
          this.avatarHandLeft &&
            this.avatarHandLeft.play("rightHandWalking", true);
          this.avatarHandRight &&
            this.avatarHandRight.play("leftHandWalking", true);
          this.avatarRightShoulder &&
            this.avatarRightShoulder.play("rightShoulderWalking", true);
          this.avatarLeftShoulder &&
            this.avatarLeftShoulder.play("leftShoulderWalking", true);
        }
        this.avatarState.isWalking = !this.avatarState.isWalking;
      }

      this.updateDebugInfo.call(this, this.avatarBody, 0, "avatarBody");

      this.updateDebugInfo.call(
        this,
        this.avatarLeftShoulder,
        1,
        "avatarLeftShoulder"
      );

      this.updateDebugInfo.call(
        this,
        this.avatarRightShoulder,
        2,
        "avatarRightShoulder"
      );

      this.updateDebugInfo.call(this, this.avatarHandLeft, 3, "avatarHandLeft");

      this.updateDebugInfo.call(
        this,
        this.avatarHandRight,
        4,
        "avatarHandRight"
      );
      this.updateDebugInfo.call(this, this.avatarLegs, 5, "avatarLegs");
    }
  }

  startWalkAnimation() {}

  stopWalkAnimation() {}
}
