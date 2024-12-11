{config, ...}: {
  # Github Support
  programs.git = {
    enable = true;
    userName = "Linux-DADDY";
    userEmail = "nahianadnan1234@proton.me";

    signing.key = config.home.homeDirectory + "/.ssh/id_ed25519";
    signing.signByDefault = true;

    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos/";
      gpg.format = "ssh";
      pull.rebase = false;
      advice.addEmbeddedRepo = false;
    };
  };
}
