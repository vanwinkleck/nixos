{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
  (retroarch.override {
      cores = with libretro; [
        mgba
        melonds
        dolphin
        citra
      ];
  };
  ]
}
