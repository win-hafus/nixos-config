{ username, ... }:
{
  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "no";
      };
    };
  };
  users.users.${username}.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcBig1YZAltquSlEaPGX7ccoVhR4lel2hbfmD+Yvbym my-phone" ]
}
