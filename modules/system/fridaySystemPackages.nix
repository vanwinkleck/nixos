{pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    neovim 
    wget
    git
    git-lfs
    keepassxc
    lm_sensors

    gamemode
    mangohud
    gamescope

    mpv
    ffmpeg
    yt-dlp

    zsh
    neofetch
    flatpak
    gnome-tweaks

    cmake
    gcc
    clang-tools
    clang

    zig
    zls

    lua
    luajit

    dbeaver-bin
    mysql_jdbc

    #openshot-qt
    #libsForQt5.libopenshot
    #libsForQt5.libopenshot-audio


   # --Hyprland stuff--
    #waybar
    #dunst
    #swww
    #kitty
    #rofi-wayland


    tokyonight-gtk-theme
    tela-circle-icon-theme
    nordzy-icon-theme
    kanagawa-icon-theme
    kanagawa-gtk-theme
  ];
}
