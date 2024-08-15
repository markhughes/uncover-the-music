export const banner = (serviceName: string, version: string) => {
  console.log("                                                      ");
  console.log(".       .                  .-.  .          .          ");
  console.log(" \\     /                  (   )_|_         |   o      ");
  console.log("  \\   /.-. .-.. .-. .--.   `-.  |  .  . .-.|   .  .-. ");
  console.log("   \\ /(.-'(   |(   )`--.  (   ) |  |  |(   |   | (   )");
  console.log("    '  `--'`-`| `-' `--'   `-'  `-'`--`-`-'`--' `-`-' ");
  console.log("           ._.'   ");
  console.log();
  console.log(">>> " + serviceName + " @" + version);
  console.log();
};
