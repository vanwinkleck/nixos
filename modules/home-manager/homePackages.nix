{ pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty
    librewolf
    qbittorrent
    htop
    #waydroid

    oh-my-zsh
    thefuck
    starship
    tldr

    anki
  ];
}
