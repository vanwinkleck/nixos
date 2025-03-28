{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 99 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "rip" ];
      PermitRootLogin = "no";
    };
  };
}
