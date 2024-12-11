{
  # Enable sound with pipewire.
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig = {
          "10-disable-camera" = {
            "wireplumber.profiles" = {
              main."monitor.libcamera" = "disabled";
            };
          };
        };
      };
    };
    # Boost Pipewire client priorities.
    system76-scheduler.settings.processScheduler.pipewireBoost.enable = true;
  };
  # make pipewire realtime-capable
  security.rtkit.enable = true;
}
