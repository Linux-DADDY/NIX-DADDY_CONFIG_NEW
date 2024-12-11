{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.sddm-sugar-candy-nix.nixosModules.default
  ];
  nixpkgs = {
    overlays = [
      inputs.sddm-sugar-candy-nix.overlays.default
    ];
  };

  # SDDM
  services = {
    displayManager.sddm = {
      enable = true;
      enableHidpi = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
        # SDDM Extra packages for the theme.
        libsForQt5.qtgraphicaleffects
        libsForQt5.qt5.qtsvg
        libsForQt5.qt5ct
        libsForQt5.qtquickcontrols2
      ];

      # settings = {
      #   Autologin = {
      #     Session = "hyprland.desktop";
      #     User = "Linux-DADDY";
      #   };
      # };

      autoNumlock = true;
      sugarCandyNix = {
        enable = true;
        settings = {
          Background = lib.cleanSource ./Lock_Screen_Pictures/Cloudsday.jpg;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
          MainColor = "#cdd6f4";
          AccentColor = "#89dceb";
        };
      };
    };
  };
}
