{
  # Microcode, It updates the AMD Microcode.
  hardware.cpu.amd.updateMicrocode = true;

  # Firmware updater, Also for the SSD and HDD firmware.
  services.fwupd = {
    enable = true;
  };
}
