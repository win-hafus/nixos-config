{
  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      hostKeys = [
        {
          path = "/etc/ssh/ssh_host_rsa_key";
          type = "rsa";
          bits = 4096;
        }
      ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = null;
        X11Forwarding = false;
        PermitRootLogin = "no";
      };
    };
  };

}
