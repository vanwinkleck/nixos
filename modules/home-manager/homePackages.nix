{ pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty
    librewolf
    qbittorrent
    #waydroid

    oh-my-zsh
    thefuck
    starship
    tldr

    anki
  ];
}
