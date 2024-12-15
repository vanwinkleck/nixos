{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    alacritty
    librewolf
    qbittorrent
    nicotine-plus
    htop
    makemkv

    oh-my-zsh
    thefuck
    starship
    tldr

    anki

    komikku
    strawberry

    slack
 
  ];
}
