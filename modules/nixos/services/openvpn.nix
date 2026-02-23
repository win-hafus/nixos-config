{
  networking.nat = {
    enable = true;
    externalInterface = "enp6s0";
    internalInterfaces = [ "tun0" ];
  };

  services.openvpn.servers = {
    homeVPN = {
      config = ''
        dev tun
        proto udp
        port 1194
        topology subnet

        server 10.8.0.0 255.255.255.0

        ca /var/shared/openvpn/ca.crt
        cert /var/shared/openvpn/server.crt
        key /var/shared/openvpn/server.key
        dh /var/shared/openvpn/dh.pem
        tls-auth /var/shared/openvpn/ta.key 0

        cipher AES-256-GCM
        auth SHA256

        push "redirect-gateway def1 bypass-dhcp"

        push "dhcp-option DNS 8.8.8.8"
        push "dhcp-option DNS 8.8.4.4"

        keepalive 10 120
        persist-key
        persist-tun
        user nobody
        group nogroup
        verb 3
      '';
    };
  };
}
