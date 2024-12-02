{ pkgs, ... }:
let
  retroarchWithCores = (pkgs.retroarch.withCores (cores: with cores; [
    mgba
    melonds
    dolphin
    citra
    pcsx2
    swanstation
  ]));
in
{
  environment.systemPackages = [
    retroarchWithCores
  ];
}

