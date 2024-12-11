{
  pkgs,
  config,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "kardan";
        plugins = [
          # "git"
          "sudo"
          "copyfile"
        ];
      };
      # dirHashes = {
      #   docs = "$HOME/Documents";
      #   vids = "$HOME/Videos";
      #   pics = "$HOME/Picturs";
      #   dl = "$HOME/Downloads";
      # };
      # Some extra ZSH plugins.
      historySubstringSearch = {
        enable = true;
        searchDownKey = [
          "^[[B"
        ];
        searchUpKey = [
          "^[[A"
        ];
      };
      autosuggestion = {
        enable = true;
      };
      shellAliases = {
        # LSD
        ls = "lsd";
        ll = "lsd -l";

        ".." = "cd ..";

        # Useful NixOS commands.
        clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && nix-collect-garbage && nix-collect-garbage -d";
        optimize = "sudo nix-store --optimise && sudo nix-store --gc";
        # edit = "sudo -E lvim /etc/nixos/configuration.nix";
        # edit-unstable = "sudo -E lvim /etc/nixos/unstable.nix";
        # update = "sudo nix-channel --update && sudo nixos-rebuild switch --impure && home-manager switch --impure";

        # BashMount
        bm = "bashmount";

        # LunarVim
        vim = "sudo -E lvim";
        # delete-lvim = "sudo rm -rf .config/lvim && sudo rm -rf .local/share/lvim && sudo rm -rf .local/state/lvim && sudo rm -rf .cache/nvim && sudo rm -rf .local/share/nvim && sudo rm -rf .local/state/nvim";
      };
    };
    broot.enableZshIntegration = true;
    autojump.enableZshIntegration = true;
  };
}
