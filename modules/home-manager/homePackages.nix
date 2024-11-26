{ pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty
    librewolf
    qbittorrent
    htop

    oh-my-zsh
    thefuck
    starship
    tldr

    anki

  ];
}
