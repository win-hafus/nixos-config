{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [ 943 8000 17500 7070 50000 50001 ];
      allowedUDPPorts = [ 1194 8000 17500 7070 50000 50001 ];
    };
  };
}
