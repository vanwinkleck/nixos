{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    ghostty
    qbittorrent
    nicotine-plus
    htop
    makemkv

    oh-my-zsh
    starship
    tldr

    anki

    komikku
    strawberry

    slack
    libreoffice
 
  ];
}
