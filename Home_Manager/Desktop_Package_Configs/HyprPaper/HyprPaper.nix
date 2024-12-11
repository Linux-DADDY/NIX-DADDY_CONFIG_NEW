{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprpaper
  ]; # Had to install the package with this, I don't know why they've not added the package with enable option.
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2.0;

      preload = ["/etc/nixos/Home_Manager/Desktop_Package_Configs/HyprPaper/wallpapers/mazda-rx-7.jpg" "./wallpapers/italy.jpg"];

      wallpaper = [
        "eDP-1,/etc/nixos/Home_Manager/Desktop_Package_Configs/HyprPaper/wallpapers/mazda-rx-7.jpg"
        # "DP-1,/share/wallpapers/cat_pacman.png"
      ];
    };
  };
}
