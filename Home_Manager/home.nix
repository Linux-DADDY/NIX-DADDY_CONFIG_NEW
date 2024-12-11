{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./Home_Packages/Default.nix
    ./Home_Configs/Default.nix
    ./Desktop_Package_Configs/Default.nix
    # inputs.home-manager.nixosModules.home-manager
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "Linux-DADDY";
  home.homeDirectory = "/home/Linux-DADDY";

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  home.sessionVariables = {
    EDITOR = "vim";
  };
}
