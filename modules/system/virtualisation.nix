{ pkgs, ... }: {

  virtualisation.docker.enable = true;
  #virtualisation.waydroid.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.rip.extraGroups = [ "libvirtd" ];

  virtualisation.podman = {
    enable = true;
    #dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    distrobox
    virtualbox
    docker
    docker-compose
    # waydroid
  ];


}
