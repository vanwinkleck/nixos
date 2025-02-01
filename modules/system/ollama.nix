{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ollama
  ];


  services.ollama = {
    enable = true;
    # acceleration = "rocm";
    #environmentVariables = {
    #  HCC_AMDGPU_TARGET = "gfx1030";
    #};
    #rocmOverrideGfx = "10.3.0";
  };

  # might not need this, going to try default web ui first
  services.open-webui.enable = true; 
}
