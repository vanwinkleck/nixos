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

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    nvf.url = "github:notashelf/nvf";
    
    # hyprland.url = "github:hyprwm/Hyprland";
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    # inputs.hyprland.follows = "hyprland";
    # };
  };

  outputs = { self, nixpkgs, nvf, ... }@inputs: {

    packages."x86_64-linux".mynvf = 
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./modules/packages/nvf-configuration.nix ];
      }).neovim;


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
        nvf.nixosModules.default
        ({pkgs, ...}: {
            environment.systemPackages = [self.packages.${pkgs.stdenv.system}.mynvf];
        })
     ];
    };

    nixosConfigurations.friday = nixpkgs.lib.nixosSystem {
     specialArgs = {inherit inputs;};
	 modules = [
	    ./hosts/friday/configuration.nix
        inputs.home-manager.nixosModules.default
        nvf.nixosModules.default
        ({pkgs, ...}: {
            environment.systemPackages = [self.packages.${pkgs.stdenv.system}.mynvf];
        })
	];
       };
  };
}
