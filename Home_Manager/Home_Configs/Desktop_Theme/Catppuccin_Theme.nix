{ pkgs, ...}:

{
  # Catppuccin Theme
  gtk = {
    enable = true;
     theme = {
      name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "lavender" ];
          size = "standard";
          tweaks = [ ];
          variant = "mocha";
        };
      };
      iconTheme = {
        name = "kora";
        package = pkgs.kora-icon-theme;
      };
      gtk3 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
      gtk4 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
    };
}

