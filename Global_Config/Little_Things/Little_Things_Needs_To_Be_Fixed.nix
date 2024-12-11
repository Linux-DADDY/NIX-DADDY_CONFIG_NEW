# Here is some Little things which needs to fixed or removed from the setup.
{
  # This willl remove the nano.
  programs.nano.enable = false;

  # Sandbox, By default it's enabled but it is good to enable it manually, IMO.
  nix.settings.sandbox = true;

  # Mouse support in virtual consoles, Sometimes it's helpful.
  services.gpm.enable = true;

  # This is needs to be enabled as some service failed because of this AVAHI.
  services.avahi = {
    enable = true;
  };
}
