{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # (vivaldi.overrideAttrs
    #   (old: {
    #     buildInputs =
    #       (old.buildInputs or [])
    #       ++ [
    #         libsForQt5.qtwayland
    #         libsForQt5.qtx11extras
    #         kdePackages.plasma-integration.qt5
    #         kdePackages.kio-extras-kf5
    #         kdePackages.breeze.qt5
    #       ];
    #   })
    #   .override {
    #     proprietaryCodecs = true;
    #     enableWidevine = true;
    #   })

    # (
    #   vivaldi.overrideAttrs
    #   (old: {
    #     buildInputs =
    #       (old.buildInputs or [])
    #       ++ [
    #         libsForQt5.qtwayland
    #         libsForQt5.qtx11extras
    #         kdePackages.plasma-integration.qt5
    #         kdePackages.kio-extras-kf5
    #         kdePackages.breeze.qt5
    #       ];
    #   })
    # )
    # .override
    # {
    #   proprietaryCodecs = true;
    #   enableWidevine = true;
    # }

    #Vivaldi
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
      # isSnapshot = true;
      # kerberosSupport = true;
      # commandLineArgs = [
      #   # Vivaldi support forum, "https://forum.vivaldi.net/post/756473"
      #   "--ozone-platform=wayland"
      #   "--use-gl=angle "
      #   "--use-angle=gl "
      #   "--disable-gpu-memory-buffer-video-frames"
      #   "--ignore-gpu-blacklist "
      #   "--enable-gpu-rasterization "
      #   "--enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,RawDraw,CanvasOopRasterization,UseOzonePlatform "
      #   "--enable-gpu-rasterization "
      #   "--enable-zero-copy "
      #   "--enable-hardware-overlays "
      #   "--enable-native-gpu-memory-buffers "
      #   "--enable-webrtc-pipewire-capturer "
      # ];
    })
  ];
}
