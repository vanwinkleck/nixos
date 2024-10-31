{ config, pkgs, inputs, ... }:

{
 imports = [
 	inputs.nix-colors.homeManagerModules.default
	./features/alacritty.nix
	./features/mpv.nix
	#./features/zsh.nix
 	];


  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-terminal-dark;
  
  #wayland.windowManager.hyprland = {
  #	enable = true;

	#plugins = [
#		   inputs.hyprland.plugins.packages."${pkgs.system}".border-plus-plus
#		  ];

#	settings = {

#			general = with config.colorScheme.colors; {
#				"col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
#				"col.inactive_border" = "rgba($base00}ff";
#				};
#		"plugin:borders-plus-plus" = {
#			add_borders =  1;
#
#			"col.border_1" = "rgb(ffffff)";
#			"col.border_2" = "rgb(2222ff)";
#
#			border_size_1 = 10;
#			border_size_2 = -1;
#
#			natural_rounding = "yes";
		#};
#	};
#  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rip";
  home.homeDirectory = "/home/rip";

  programs.git = {
	enable = true;
	userName = "rip";
	userEmail = "test@test.com";
	extraConfig = {
	 init.defaultBranch = "main";

	};

  };

  programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

   shellAliases = {
    ll = "ls -l";
    ls = "ls -a --color=auto";

    update = "sudo nixos-rebuild switch --flake /home/rip/nixos/#friday";
    uflake = "sudo nix flake update";
    ncg = "sudo nix-collect-garbage";
    opt = "sudo nix store optimise";

    edits = "cd /mnt/makima/Edits/";
    gc = "git commit -m";
    gp = "git push";
    };

    history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
   };

   oh-my-zsh = {
    enable = true;
    theme = "steeef";
    plugins = ["git" "thefuck" "ufw" "starship" "tldr"];

   };  
 };
  
 # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    #hello
    alacritty
    librewolf
    vesktop
    oh-my-zsh
    qbittorrent
    thefuck
    starship
    tldr
    #pkgs.heroic
    #pkgs.lutris
    #pkgs.vscodium
    #pkgs.mangohud

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rip/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
