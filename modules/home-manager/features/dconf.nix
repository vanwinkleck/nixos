{ pkgs, ...}: {
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false; 
      enabled-extensions = with pkgs.gnomeExtensions; [
        user-themes.extensionUuid
        removable-drive-menu.extensionUuid
      ];
    };

  };

}
