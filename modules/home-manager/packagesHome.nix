{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    ghostty
    qbittorrent
    nicotine-plus
    btop
    makemkv

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

    shotcut

    openmw
    prismlauncher

    papirus-icon-theme
 
  ];
}
