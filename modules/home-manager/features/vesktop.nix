{ inputs, pkgs, ... }:
{
    vesktop.pkgs = {
      enable = true;
      package = pkgs.vesktop.overrideAttrs (oldAttrs: {
        desktopItems = [
         (pkgs.makeDesktopItem {
           name = "vesktop";
           desktopName = "Discord";
           exec = "vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
           icon = "discord";
            startupWMClass = "VencordDesktop";
           genericName = "Internet Messenger";
           keywords = [
               "discord"
             "vencord"
             "electron"
             "chat"
           ];
            categories = [
             "Network"
             "InstantMessaging"
             "Chat"
            ];
           })
        ];
      });
    };
}
