{
  description = "grunisaurus nix flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";

    # hyprland and its according packages
    hyprland = {
	url = "git+https://github.com/hyprwm/Hyprland.git?submodules=1";
	inputs.nixpkgs.follows = "nixpkgs";
    }; 

   nvf = {
	url = "github:notashelf/nvf";
	inputs = {
			nixpkgs.follows = "hyprland/nixpkgs";
		};
	};

   hyprlock = {
	url = "github:hyprwm/hyprlock";
	inputs = {
		hyprlang.follows = "hyprland/hyprlang";
		hyprutils.follows = "hyprland/hyprutils";
		nixpkgs.follows = "hyprland/nixpkgs";
		systems.follows = "hyprland/systems";
	};
   };

   hyprpaper = {
	url = "github:hyprwm/hyprpaper";
	inputs = {
		hyprlang.follows = "hyprland/hyprlang";
		hyprutils.follows = "hyprland/hyprutils";
		nixpkgs.follows = "hyprland/nixpkgs";
		systems.follows = "hyprland/systems";
	};
   };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs system;};
        # > Our main nixos configuration file <
        modules = [
                        ./nixos/configuration.nix
                ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      grunisaurus = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        # > Our main home-manager configuration file <
        modules = [
		./home-manager/home.nix
		nvf.homeManagerModules.default
	];
      };
    };

    devShells = {
    zig = pkgs.mkShell {
          packages = with pkgs; [
              zig
            ];
          };
    };
      };
}
