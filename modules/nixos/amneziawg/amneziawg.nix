{ config, lib, pkgs, ... }:

{
  environment.etc."amnezia/amneziawg/WARP.conf" = {
    source = ./warp/WARP.conf;
  };
}
