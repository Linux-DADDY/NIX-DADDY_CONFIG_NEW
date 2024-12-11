{
  pkgs,
  configs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # legcord
    (discord.override {
      # nss = nss_latest;
      withOpenASAR = true;
      withVencord = true;
    })
    # .overrideAttrs
    # (old: {
    #   libPath = old.libPath + ":${pkgs.libglvnd}/lib";
    #   nativeBuildInputs = old.nativeBuildInputs ++ [pkgs.makeWrapper];
    #   postFixup = ''
    #     wrapProgram $out/opt/Discord/Discord \
    #       --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland}}"
    #   '';
    # })
  ];
}
# xdg.configFile."Vencord/themes/" = {
#   source = ./themes;
#   recursive = true;
# };
