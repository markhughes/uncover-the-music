declare module "*.module.scss" {
  const content: { [className: string]: string };
  export = content;
}

declare module "*.glsl" {
  const content: string;
  export default content;
}
