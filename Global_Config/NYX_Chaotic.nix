{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.chaotic.nixosModules.default
  ];
}
