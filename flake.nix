{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };

     nixcord = {
     url = "github:kaylorben/nixcord";
    };

    #private_configs = {
    #  url = "path:/home/rip/.wireguard/tif.nix";
    #  flake = false;
    #};

     nix-colors.url = "github:misterio77/nix-colors";
    #  hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins = {
    #	url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    #  };
    };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.despe = nixpkgs.lib.nixosSystem {
     specialArgs = {inherit inputs;};
     modules = [
        ./hosts/despe/configuration.nix
        inputs.home-manager.nixosModules.default
     ];
    };

    nixosConfigurations.friday = nixpkgs.lib.nixosSystem {
    	specialArgs = {inherit inputs;};
	modules = [
	    ./hosts/friday/configuration.nix
        inputs.home-manager.nixosModules.default
	];
       };
  };
}
