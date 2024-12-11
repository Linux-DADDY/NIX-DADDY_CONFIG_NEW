{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.Linux-DADDY.extraGroups = ["libvirtd"];
}
