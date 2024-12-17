{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    alacritty
    librewolf
    qbittorrent
    nicotine-plus
    htop
    makemkv
    libimobiledevice
    usbmuxd

    oh-my-zsh
    thefuck
    starship
    tldr

    anki
    newsboat

    komikku
    strawberry

    slack
 
  ];
}
