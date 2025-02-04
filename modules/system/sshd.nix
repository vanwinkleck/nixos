{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 2222 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "rip" ];
      PermitRootLogin = "no";
    };
  };
}
