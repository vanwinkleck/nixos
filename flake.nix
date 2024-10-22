{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     nix-colors.url = "github:misterio77/nix-colors";
     #hyprland.url = "github:hyprwm/Hyprland";
     #hyprland-plugins = {
     #	url = "github:hyprwm/hyprland-plugins";
	#inputs.hyprland.follows = "hyprland";
       #};
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
  };
}
