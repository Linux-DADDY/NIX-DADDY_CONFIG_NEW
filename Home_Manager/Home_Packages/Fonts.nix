{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
  };
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    font-awesome
    noto-fonts-emoji
    lohit-fonts.bengali
    times-newer-roman
    # julia-mono
    # monaspace
    (nerdfonts.override {fonts = ["FiraCode" "Iosevka" "JetBrainsMono"];})
  ];
}
