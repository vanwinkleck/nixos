{pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    neovim
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
  ];
}
