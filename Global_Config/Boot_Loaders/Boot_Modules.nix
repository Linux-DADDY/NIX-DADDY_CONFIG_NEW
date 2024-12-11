{
  boot = {
    kernelModules = [
      "fuse"
      "kvm-amd"
      "coretemp"
      "amdgpu"
    ];
    initrd = {
      kernelModules = []; # amdgpu, I used this before i think i do not need this now.
      availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod" "sdhci_pci"];
    };
    supportedFilesystems = [
      "btrfs"
      "xfs"
    ]; # "ntfs"
    kernelParams = [
      "video=eDP-1:1920x1080"
      # "video=HDMI-A-1:1920x1080"
      # "sysrq_always_enabled=1"
      "fbcon=nodefer"
      "vt.global_cursor_default=0"
      "kernel.modules_disabled=1"
      "usbcore.autosuspend=-1"
      "video4linux"
    ];
  };
}
