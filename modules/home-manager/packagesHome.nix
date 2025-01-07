{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    alacritty
    ghostty
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
    newsboat

    komikku
    strawberry

    slack
    libreoffice
 
  ];
}
