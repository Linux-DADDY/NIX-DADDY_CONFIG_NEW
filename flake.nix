{
  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
  description = "Flake for global config, Home-Manager, Secureboot, Unstable packages, hyprland and SDDM and more.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # chaotic = {
    #   url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    #   inputs.nixpkgs.follows = "nixos-unstable";
    # };
    trustix = {
      url = "github:nix-community/trustix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.1";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland-contrib = {
    #   url = "github:hyprwm/contrib";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hycov = {
    #   url = "github:bighu630/hycov";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # split-monitor-workspaces = {
    #   url = "github:Duckonaut/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # Hyprsome = {
    #   url = "github:sopa0/hyprsome";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    # chaotic,
    trustix,
    home-manager,
    sddm-sugar-candy-nix,
    disko,
    sops-nix,
    hyprpanel,
    # nix-flatpak,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      NIX-DADDY = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          # Global Config
          ./Global_Config/Default.nix
          # Home manager on flakes
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.Linux-DADDY = {
                imports = [
                  ./Home_Manager/Default.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}
