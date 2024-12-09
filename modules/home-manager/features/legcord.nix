{ pkgs, ... }: {
  programs.legcord = {
    enable = true;
    package = pkgs.legcord.overrideAttrs (oldAttrs: {
    desktopItems = [
      pkgs.makeDesktopItem{
        name = "legcord";
        desktopName = "Discord";
        exec = "legcord";
        icon = "discord";
      }
    ];
    });
  };
}
