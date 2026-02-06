{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "koala-clash";
  version = "0.2.10";

  src = pkgs.fetchurl {
    url = "https://github.com/coolcoala/clash-verge-rev-lite/releases/download/v${version}/Koala.Clash_amd64.deb";
    sha256 = "035s6scn1f5xg3v25r76llvlngvmxlwramw40pkfkwf9j0vp6czp";  # временный хеш
  };

  nativeBuildInputs = with pkgs; [
    dpkg
    autoPatchelfHook
    makeWrapper
    wrapGAppsHook
  ];

  buildInputs = with pkgs; [
    webkitgtk
    gtk3
    cairo
    gdk-pixbuf
    glib
    dbus
    openssl
    librsvg
    libsoup
    libayatana-appindicator
  ];

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    mkdir -p $out
    cp -r usr/* $out/
    
    if [ -d opt ]; then
      cp -r opt/* $out/
    fi
  '';

  meta = with pkgs.lib; {
    description = "A modern GUI client based on Tauri for Clash Meta";
    homepage = "https://github.com/coolcoala/koala-clash";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
