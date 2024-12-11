{pkgs, ...}: {
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
  users.users.Linux-DADDY = {extraGroups = ["openrazer"];};
}
