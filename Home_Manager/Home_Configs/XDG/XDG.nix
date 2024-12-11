{config, ...}: {
  # xdg.userDirs = {
  #   enable = true;
  #   createDirectories = true;
  #   # FIXME: can't make this work as of now.
  #   # download = "${config.home.homeDirectory}/Downloads";
  #   # pictures = "${config.home.homeDirectory}/Pictures";
  #   # videos = "${config.home.homeDirectory}/Videos";
  #   # documents = "${config.home.homeDirectory}/Documents";
  #   # desktop = "${config.home.homeDirectory}/Desktop";
  # };
}
# {
#   xdg = {
#     enable = true;
#     userDirs = let
#       appendToHomeDir = path: "${config.home.homeDirectory}/${path}";
#     in {
#       enable = true;
#       desktop = appendToHomeDir "Desktop";
#       documents = appendToHomeDir "Documents";
#       download = appendToHomeDir "Downloads";
#       # music = appendToHomeDir "music";
#       pictures = appendToHomeDir "Pictures";
#       # publicShare = appendToHomeDir "Public";
#       # templates = appendToHomeDir "templates";
#       videos = appendToHomeDir "videos";
#     };
#   };
# }
