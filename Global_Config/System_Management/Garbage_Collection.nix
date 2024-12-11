{
  # # Automation Garbage collection can be automated.
  # # Using NH for testing, let's see how it's works for me.
  # nix.gc = {
  #   automatic = true;
  #   dates = "weekly";
  #   options = "--delete-older-than 30d";
  # };

  # It is also possible to automatically run garbage collection whenever there is not enough space left, For example, to free up to 1GiB whenever there is less than 100MiB left:
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
  '';
}
