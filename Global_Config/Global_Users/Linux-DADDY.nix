{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.Linux-DADDY = {
    isNormalUser = true;
    description = "Linux DADDY";
    #hashedPassword = "$y$j9T$7cWC/yTak6HS4TJrx0c6L.$Ms3labejj3pcmu1wcC8JZ3jEiYLbhqsa3IHrxCg.sO2";
    # password = "13040011";
    extraGroups = ["wheel" "networkmanager" "video" "audio" "input" "plugdev" "kvm"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    #   packages = with pkgs; [
    #     firefox
    #     tree
    #   ];
  };

  #TODO MAKE OWN ZSH FILE In GLOBAL CONFIG
  programs.zsh.enable = true;
}
