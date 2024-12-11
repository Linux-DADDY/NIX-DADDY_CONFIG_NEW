{
  pkgs,
  inputs,
  ...
}: {
  # Hyprland.
  programs = {
    # waybar.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
      # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };

  # XDG Portal.
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        # xdg-desktop-portal-gnome
        # xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  # Swaylock
  security.pam.services.swaylock.text = ''
    auth include login
  '';

  # Hyprlock
  security.pam.services.hyprlock = {};

  # Dconf
  programs.dconf.enable = true;

  # security
  services.gnome.gnome-keyring.enable = true;
  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  };

  # DBUS & services Accounts
  services = {
    dbus.enable = true;
    accounts-daemon.enable = true;
  };
}
