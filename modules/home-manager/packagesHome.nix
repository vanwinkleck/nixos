{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    ghostty
    qbittorrent
    nicotine-plus
    btop

    floorp
    librewolf

    oh-my-zsh
    starship
    tldr

    anki
    gimp

    komikku
    strawberry

    slack
    libreoffice
    insomnia
    dbeaver-bin

    prismlauncher

    papirus-icon-theme
 
  ];
}
