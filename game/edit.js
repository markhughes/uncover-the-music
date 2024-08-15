const Jimp = require("jimp");

Jimp.read("src/assets/tile.png")
  .then((image) => {
    const newImage = new Jimp(image.bitmap.width, image.bitmap.height + 10);

    newImage.composite(image, 0, 0);

    const lastLeftPixelColor = image.getPixelColor(0, image.bitmap.height - 1);
    const lastRightPixelColor = image.getPixelColor(
      image.bitmap.width - 1,
      image.bitmap.height - 1
    );

    for (let y = image.bitmap.height; y < newImage.bitmap.height; y++) {
      for (let x = 0; x < newImage.bitmap.width; x++) {
        const color =
          x < newImage.bitmap.width / 2
            ? lastLeftPixelColor
            : lastRightPixelColor;
        newImage.setPixelColor(color, x, y);
      }
    }

    return newImage.writeAsync("src/assets/tile.built.png");
  })
  .catch((err) => {
    console.error(err);
  });
