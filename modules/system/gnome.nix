{ pkgs, ... }: {
  environment.gnome.excludePackages = with pkgs; [
    orca
    evince
    baobab
    epiphany
    totem
    yelp
    gnome-maps
    gnome-music
  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    wayland-or-x11
    user-themes
    toggle-headphone
    appindicator

    pkgs.gnome-tweaks
    pkgs.kanagawa-gtk-theme
    pkgs.kanagawa-icon-theme
  ];

}
