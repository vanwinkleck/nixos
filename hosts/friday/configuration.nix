# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "friday"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  fileSystems."/mnt/makima" =
    { device = "/dev/disk/by-uuid/E6FB-AEB8";
      fsType = "exfat";
      options = ["nofail" "uid=1000" "gid=1000" "dmask=007" "fmask=117" ];
    };
  
  #fileSystems."/mnt/asa" = 
  #{
  # device= "/dev/disk/by-uuid/725b7ecc-220a-467f-a87b-980583709607";
  # fsType = "ext4";
   #options = [ "nofail" "uid=1000" "gid=1000" "dmask=007" "fmask=117" ];
  #};


  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

  # GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # KDE 
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # Hyprland
  #programs.hyprland.enable = true;
  #programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  fonts.packages = with pkgs; [
  	noto-fonts
  	noto-fonts-cjk
  	noto-fonts-emoji
  	liberation_ttf
  	fira-code
  	fira-code-symbols
  	mplus-outline-fonts.githubRelease
  	dina-font
  	proggyfonts
	cherry
  ];


  hardware.bluetooth.enable = true;

  hardware.graphics = {
	enable = true;
	#driSupport = true;
	#driSupport32Bit = true;
  };

  # services.xserver.videoDrivers = ["amdgpu"];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rip = {
    isNormalUser = true;
    description = "rip";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
       #thunderbird
       #librewolf
       #alacritty
       #vscodium
       lutris
       heroic
       mangohud 
       #vesktop
    ];
  };

  home-manager = {
  	extraSpecialArgs = { inherit inputs; };
	users = {
		"rip" = import ../../modules/home-manager/home.nix;
		};
	};

  # Install firefox.
  programs.firefox.enable = true;

  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  programs.steam = {
  	enable=true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
	localNetworkGameTransfers.openFirewall = true;
	};

  #programs.firefox = {
   # enable = true;
    #package = pkgs.librewolf;
    #policies.ExtensionSettings = {
     #   "uBlock0@raymondhill.net" = {
      #      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
       #     installation_mode = "force_installed";
        #};

    #};
#};
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   git
   keepassxc
   mpv
   ffmpeg
   yt-dlp
   #scrot
   neofetch
   flatpak
   pkgs.gnome-tweaks
   #waybar
   #dunst
   #swww
   #kitty
   #rofi-wayland
   tokyonight-gtk-theme
   tela-icon-theme
   tela-circle-icon-theme
   nordzy-icon-theme
   kanagawa-icon-theme
   kanagawa-gtk-theme
   openzone-cursors


  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
