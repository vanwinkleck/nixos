{ pkgs, inputs, ... }: {
programs.firefox = {
  enable = true;
  package = pkgs.librewolf;
  policies = {
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    Preferences = {
      "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
      "cookiebanners.service.mode" = 2; # Block cookie banners
      "privacy.donottrackheader.enabled" = true;
      "privacy.fingerprintingProtection" = true;
      "privacy.resistFingerprinting" = true;
      "privacy.trackingprotection.emailtracking.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.fingerprinting.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      };

      profiles.defaults.extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        darkreader
        keepassxc-browser
        localcdn
        violentmonkey
        privacy-badger
        sponsorblock
        decentraleyes
        return-youtube-dislikes
      ];

  };
  };
}
