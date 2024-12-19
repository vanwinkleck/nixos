{pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    git
    git-lfs
    keepassxc
    mpv
    ffmpeg
    yt-dlp
    neofetch
    flatpak
    wget
    lm_sensors

    (import ../scripts/trim.nix { inherit pkgs; })
  ];
}
