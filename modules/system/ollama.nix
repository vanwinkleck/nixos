{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ollama-rocm
  ];


  services.ollama = {
    enable = true;
    loadModels = ["mistral" "deepseek-r1:14b"];
    acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1030";
      # At the moment, this allows GPU acceleration to work. May be able to remove this in the future, and have not tried to reboot yet. Rebooting/rebuilding seemed to cause GPU acceleration to break previously. 
      HSA_OVERRIDE_GFX_VERSION = "11.0.0";
      #OLLAMA_HOST = "0.0.0.0";
    };
    rocmOverrideGfx = "10.3.0"; 
  };

  # might not need this, going to try default web ui first
  services.open-webui.enable = true; 
}
