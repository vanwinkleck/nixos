{ ... }: {

  virtualisation.docker.enable = true;
  #virtualisation.waydroid.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "rip" ];

}
