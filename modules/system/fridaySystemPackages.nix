{pkgs, ... }: {

  environment.systemPackages = with pkgs; [

    gamemode
    mangohud
    gamescope


    gcc
    clang
    clang-tools

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


    #tokyonight-gtk-theme
    tela-circle-icon-theme
    nordzy-icon-theme
    kanagawa-icon-theme
    #kanagawa-gtk-theme
  ];
}
