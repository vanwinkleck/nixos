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
    (import ../scripts/convert.nix { inherit pkgs; })
    (import ../scripts/webm.nix { inherit pkgs; })
    (import ../scripts/extract.nix { inherit pkgs; })

  ];
}
