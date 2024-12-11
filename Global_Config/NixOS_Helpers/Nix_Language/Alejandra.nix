{
  inputs,
  pkgs,
  config,
  ...
}:
# let
#   alejandra =
#     (import (builtins.fetchTarball {
#       url = "https://github.com/kamadorueda/alejandra/tarball/3.1.0";
#       sha256 = "102pgnbsbvhpqy5brzs45lrignxbmbkp68ll7966prlr6myr4i43";
#     }) {})
#     .outPath;
# in {
#   environment.systemPackages = [alejandra];
# }
{
  environment.systemPackages = [
    inputs.alejandra.packages.${pkgs.system}.alejandra
    # alejandra.defaultPackage.${system}
  ];
  # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
}
