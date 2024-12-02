{ pkgs, ... }:
let
  retroarchWithCores = (pkgs.retroarch.withCores (cores: with cores; [
    mgba
    melonds
    dolphin
    citra
  ]));
in
{
  environment.systemPackages = [
    retroarchWithCores
  ];
}

