{pkgs, ...}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-m17n
      fcitx5-openbangla-keyboard
      fcitx5-with-addons
    ];
  };
}
