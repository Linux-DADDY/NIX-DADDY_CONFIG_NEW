{pkgs, ...}: {
  # USB Automounting
  services = {
    gvfs.enable = true;
    # udisks2.enable = true;
    # devmon.enable = true;
  };

  # # Enable USB Guard
  # services.usbguard = {
  #   enable = true;
  #   dbus.enable = true;
  #   implicitPolicyTarget = "block";
  #   # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
  #   rules = ''
  #     allow id {320f:5055} # Evision Striker Keyboard
  #     # allow id {id} # device 2
  #   '';
  # };

  # Enable USB-specific packages
  environment.systemPackages = with pkgs; [
    usbutils
  ];
}
