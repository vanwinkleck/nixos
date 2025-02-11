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

    php
    phpunit

    typescript

    dbeaver-bin
    mysql_jdbc

    memtester

   # --Hyprland stuff--
    #waybar
    #dunst
    #swww
    #kitty
    #rofi-wayland

    kanagawa-icon-theme
  ];
}
