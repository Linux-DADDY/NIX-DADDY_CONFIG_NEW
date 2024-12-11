{pkgs, ...}: {
  # Vulkan
  # hardware.amdgpu.amdvlk.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      # vulkan-loader
      # vulkan-validation-layers ## The reason behind this is to use will it work or not.
      # vulkan-extension-layer
      rocmPackages.clr.icd
      mesa.opencl
      # libvdpau-va-gl
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];
}
