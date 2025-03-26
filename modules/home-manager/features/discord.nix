{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixcord.homeManagerModules.nixcord ];
  
  programs.nixcord = {
    enable = true;
    #discord.vencord.unstable = true;
      vesktop = {
      enable = true;
      package = pkgs.vesktop.overrideAttrs (oldAttrs: {
      desktopItems = [
        (pkgs.makeDesktopItem {
          name = "vesktop";
          desktopName = "Discord";
          exec = "vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
          icon = "discord";
          })
       ];
      });
      };
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/Dyzean/Tokyo-Night/main/themes/tokyo-night.theme.css"
      ];
      frameless = true;

      plugins = {
        betterUploadButton.enable = true;
        clearURLs.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        gifPaste.enable = true;
        translate.enable = true;
        typingIndicator.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
  };
     };
  };
}
