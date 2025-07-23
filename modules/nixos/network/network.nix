{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [
        1714
        1715
        1716
        943
        8000
        17500
        7070
        50000
        50001
      ];
      allowedUDPPorts = [
        1714
        1715
        1716
        1194
        8000
        17500
        7070
        50000
        50001
      ];
    };
  };
}
