{ pkgs, lib, ... }:

{
  home.activation.unpackReaperConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/.config/REAPER" ]; then
      ${pkgs.gnutar}/bin/tar -xzf ${./reaper-config.tar.gz} -C "$HOME/.config/"
    fi
  '';
}
