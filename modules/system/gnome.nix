{ pkgs, ... } :
{
  gtk = {
    enable = true;

  iconTheme = {
    name = "Tela-blue-dark";
    package = pkgs.tela-icon-theme;
  };

  theme = {
    name = "Tokyonight-dark";
    package = pkgs.tokyonight-gtk-theme;
  };


  cursorTheme = {
    name = "OpenZone_Black_Slim";
    package = pkgs.openzone-cursors;
    };

  gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };


  };

  dconf = {
    enable = true;
    dconf.settings = {
        "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
  };
  };
}
