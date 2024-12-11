{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.wlrobs
      obs-studio-plugins.obs-vkcapture
      obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };
}
