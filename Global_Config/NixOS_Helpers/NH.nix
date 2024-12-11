# {
#   programs.nh = {
#     enable = true;
#     clean.enable = true;
#     clean.extraArgs = "--keep-since 4d --keep 3";
#     # flake = "/etc/nixos/";
#   };
# }
{
  pkgs,
  username,
  ...
}: {
  programs.nh = {
    enable = true;
    # clean = {
    #   enable = true;
    #   extraArgs = "--keep-since 7d --keep 5";
    # };
    # flake = "/home/${username}/nixos-config";
    # flake = "/etc/nixos/";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
