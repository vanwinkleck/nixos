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

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

     nix-colors.url = "github:misterio77/nix-colors";
    #  hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins = {
    #	url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    #  };
    };

  outputs = { self, nixpkgs, ghostty, ... }@inputs: {
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
        {
          environment.systemPackages = [
            ghostty.packages.x86_64-linux.default
          ];
        }
     ];
    };

    nixosConfigurations.friday = nixpkgs.lib.nixosSystem {
    	specialArgs = {inherit inputs;};
	modules = [
	    ./hosts/friday/configuration.nix
        inputs.home-manager.nixosModules.default
        {
          environment.systemPackages = [
            ghostty.packages.x86_64-linux.default
          ];
        }
	];
       };
  };
}
