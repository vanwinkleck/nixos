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
    user-themes
    toggle-headphone
    appindicator
    #disk-usage

    pkgs.gnome-tweaks
    pkgs.kanagawa-gtk-theme
    pkgs.kanagawa-icon-theme
    pkgs.tokyonight-gtk-theme
  ];

}
