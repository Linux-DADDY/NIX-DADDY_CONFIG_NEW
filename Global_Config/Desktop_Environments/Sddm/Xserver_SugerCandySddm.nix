{lib, ...}: {
  # DE
  services = {
    # enable = true;
    xserver.videoDrivers = [
      "amdgpu"
    ];
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      # settings = {
      #   Autologin = {
      #     Session = "hyprland.desktop";
      #     User = "nahian-adnan";
      #   };
      # };
      autoNumlock = true;
      # theme = "tokyo-night-sddm";
      sugarCandyNix = {
        enable = true;
        settings = {
          Background = lib.cleanSource ./Lock_Screen_Pictures/luxury-mandala-background.jpg;
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
