{
  # NIX store
  nix.optimise.automatic = true;
  nix.optimise.dates = ["08:45"]; # Optional; allows customizing optimisation schedule

  # Alternatively, the store can be optimised during every build. This may slow down builds,
  nix.settings.auto-optimise-store = true;
}
