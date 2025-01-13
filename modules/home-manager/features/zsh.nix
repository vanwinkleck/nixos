{ config, ... }:
{
programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

   shellAliases = {
      # Misc
      ll = "ls -l";
      ls = "ls -a --color=auto";

      # Nix commands 
      fupdate = "sudo nixos-rebuild switch --flake /home/rip/nixos/#friday";
      dupdate = "sudo nixos-rebuild switch --flake /home/rip/nixos/#despe";
      uflake = "sudo nix flake update";
      ncg = "sudo nix-collect-garbage";
      opt = "sudo nix store optimise";


      # Navigation
      edits = "cd /mnt/makima/Edits/";
      record = "cd /mnt/makima/Recordings/";
      dot = "cd /home/rip/.config/";
      config = "cd /home/rip/nixos/";

      # Git commands
      gc = "git commit -m";
      gps = "git push";
      gpl = "git pull";

      # work
      tif = "sudo nmcli con import type wireguard file /home/rip/.wireguard/tif1.conf";
    };

      history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
   };

    oh-my-zsh = {
      enable = true;
      theme = "gallois";
      plugins = ["git" "starship" "ufw" "tldr"];

    };  
  };
}
