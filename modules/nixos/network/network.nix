{ hostname, ... }:
{
  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [
        22
        24642
        44849
        1714
        1715
        1716
        44849
        943
        8000
        17500
        7070
        50000
        50001
      ];
      allowedUDPPorts = [
        24642
        44849
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
