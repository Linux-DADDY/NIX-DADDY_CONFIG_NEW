{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      force-window = true;
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
    };
    scripts = with pkgs; [
      mpvScripts.mpris
    ];
    scriptOpts = {
      osc = {
        scalewindowed = 2.0;
        vidscale = false;
        visibility = "always";
      };
    };
  };
}
