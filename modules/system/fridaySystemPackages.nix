{pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gamemode
    mangohud
    gamescope

    neovim

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

    # Remove this when i get neovim working in shells
    cmake
    glfw
    lua
    glm
    gcc

   # --Hyprland stuff--
    #waybar
    #dunst
    #swww
    #kitty
    #rofi-wayland

    kanagawa-icon-theme
  ];
}
