{
  services.openvpn = {
    servers = {
      nl-1 = {
        config = ''config /etc/openvpn/proton-nl-1.ovpn '';
        autoStart = false;
        updateResolvConf = true;
      };
      nl-2 = {
        config = ''config /etc/openvpn/proton-nl-2.ovpn '';
        autoStart = false;
        updateResolvConf = true;
      };
      jp-1 = {
        config = ''config /etc/openvpn/proton-jp-1.ovpn '';
        autoStart = false;
        updateResolvConf = true;
      };
      jp-2 = {
        config = ''config /etc/openvpn/proton-jp-2.ovpn '';
        autoStart = false;
        updateResolvConf = true;
      };
      ro = {
        config = ''config /etc/openvpn/proton-ro.ovpn '';
        autoStart = false;
        updateResolvConf = true;
      };
      us = {
        config = ''config /etc/openvpn/proton-us.ovpn '';
        autoStart = false;
        updateResolvConf = true;
      };
    };
  };
}
