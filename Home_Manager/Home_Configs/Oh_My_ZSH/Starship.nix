{
  pkgs,
  lib,
  ...
}: {
  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      scan_timeout = 10;
      # ignore_timeout = true;
      command_timeout = 3600000;
      # character = {
      #   success_symbol = "➜";
      #   error_symbol = "➜";
      # };
    };
  };
}
