{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprshade
  ];
  # Config
  home.file.".config/hypr/shaders/vibrance.glsl".text =
    builtins.readFile ./shaders/vibrance.glsl;
  home.file.".config/hypr/shaders/blue-light-filter.glsl".text =
    builtins.readFile ./shaders/blue-light-filter.glsl;
}
