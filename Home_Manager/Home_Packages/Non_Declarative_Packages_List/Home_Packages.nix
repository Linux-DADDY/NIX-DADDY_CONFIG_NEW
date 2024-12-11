{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #TODO SOPNiX
    # sop nix
    age

    #universal-android-debloater
    #android-tools

    bashmount
    qbittorrent
    gparted

    # Filesystems
    xfsprogs
    e2fsprogs
    btrfs-progs
    # ntfs3g

    # PDF
    # libsForQt5.okular # Buggy and glichy.
    xournalpp # Best IMO with Cattpuccin theme.

    # pavucontrol
    viewnior
    unzip
    ventoy-full

    # Messeging and Email clients
    beeper
    rambox

    # File Manager
    nemo
    nemo-fileroller
    # nemo-with-extensions

    # Wallpaper
    # wpaperd
    # mpvpaper
    # swaylock-effects

    # Remote access
    # rustdesk # Builds from rust which takes long to build and takes more recourses
    # rustdesk-flutter

    # Browsers
    # floorp
    inputs.zen-browser.packages."${system}".default

    # Note Taking software
    notesnook

    # Alternative Youtube client
    # freetube
    #Invidious ## In the Future with docker or something like nix contrainer.
  ];
}
