{
  programs.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        # path = "/home/Linux-DADDY/Pictures/catppuccin-wallpapers";
        path = "/home/Linux-DADDY/Pictures/catppuccin-wallpapers/landscapes/";
        # path = "/etc/nixos/home-manager/modules/Desktop-Apps/wpaperd/aesthetic-wallpapers-main/";
        duration = "1m";
        sorting = "ascending";
      };
      # HDMI-A-1 = {
      #   # path = "/etc/nixos/home-manager/modules/Desktop-Apps/wpaperd/wallpapers/";
      #   path = "/etc/nixos/Home_Manager/Desktop_Package_Configs/Wpaperd/wallpapers/";
      #   duration = "5m";
      #   sorting = "descending";
      # };
    };
  };
}
