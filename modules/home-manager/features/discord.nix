{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixcord.homeManagerModules.nixcord ];
  
  programs.nixcord = {
    enable = true;
     discord.enable = false;
      vesktop = {
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
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/KillYoy/DiscordNight/master/DiscordNight.theme.css"
     ];
     frameless = false;
      
      plugins = {
        alwaysTrust.enable = true;
        anonymiseFileNames = {
         enable = true;
         anonymiseByDefault = true;
        };
        betterRoleDot.enable = true;
        betterUploadButton.enable = true;
        # callTimer.enable = true; # THIS IS THE BROKEN PLUGIN? HOW THE ACTUAL HELL???
        clearURLs.enable = true;
        crashHandler.enable = true;
        dearrow.enable = true;
        emoteCloner.enable = true;
        fakeNitro.enable = true;
        favoriteGifSearch.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        fixCodeblockGap.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        memberCount.enable = true;
        moreCommands.enable = true;
        moreKaomoji.enable = true;
        newGuildSettings.enable = true;
        noBlockedMessages = {
         enable = true;
         ignoreBlockedMessages = true;
       };
        noF1.enable = true;
        openInApp.enable = true;
        permissionFreeWill.enable = true;
        pictureInPicture.enable = true;
        previewMessage.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        silentTyping.enable = true;
        translate.enable = true;
        typingIndicator.enable = true;
        userVoiceShow.enable = true;
        USRBG.enable = true;
        vencordToolbox.enable = true;
        viewIcons.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
  };
     };
  };
}
