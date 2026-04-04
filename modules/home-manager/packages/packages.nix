{
  pkgs,
  inputs,
  ...
}:

# TODO: исправить ввод (сейчас не читаются hostkeys)

let

  python = pkgs.python313;

  pywm-atha-src = pkgs.fetchgit {
    url = "https://git.sr.ht/~atha/pywm-atha";
    rev = "f61b0271a550bc26969470c1c3cc04c2324369f3";
    hash = "sha256-r+kBT0seVUEZgJ76qAi/eCwc77UHHkub4rJOQ4oPk78=";
  };

  pywm-atha = pkgs.stdenv.mkDerivation {
    pname = "pywm-atha";
    version = "main";

    src = pywm-atha-src;

    NIX_CFLAGS_COMPILE = "-Wno-calloc-transposed-args";

    nativeBuildInputs = with pkgs; [
      pkg-config
      meson
      ninja
      cmake
      glslang
      wayland-scanner
      python
    ];

    buildInputs = with pkgs; [
      python
      mesa
      vulkan-loader
      vulkan-headers
      wlroots
      wayland
      wayland-protocols
      libinput
      libxkbcommon
      pixman
      libGL
      xwayland
      libdrm
      libgbm
      libxcb
      libxcb-util
      libxcb-wm
      libxcb-errors
      libxcb-render-util
      seatd
      python.pkgs.imageio
      python.pkgs.numpy
      python.pkgs.evdev
    ];

    postInstall = ''
      SP=$out/lib/python3.13/site-packages/pywm
      mkdir -p $SP

      # Копируем Python-файлы из исходников
      cp -r ${pywm-atha-src}/pywm/. $SP/

      # .so собирается но не устанавливается meson-ом — копируем из build
      find . -name "_pywm*.so" -exec cp {} $SP/ \;
    '';
  };

  newm-atha = python.pkgs.buildPythonPackage {
    pname = "newm-atha";
    version = "main";
    pyproject = true;

    src = pkgs.fetchgit {
      url = "https://git.sr.ht/~atha/newm-atha";
      rev = "20e86be145881becd53a73b7c2ff24fde3f7b87e";
      hash = "sha256-+5Dd4TJxLlIFJJuEPmbsmM+ZiFeaogDVWsBXvR3sV3M=";
    };

    build-system = [ python.pkgs.setuptools ];

    propagatedBuildInputs = with python.pkgs; [
      numpy
      imageio
      evdev
      pycairo
      psutil
      pyinotify
      python-pam
      pyfiglet
      dasbus
      thefuzz
    ];
  };

  newm-env = python.withPackages (ps: [
    newm-atha
  ]);

in
{
  environment.variables = {
    PYTHONPATH = "${pywm-atha}/lib/python3.13/site-packages";
  };
  environment.systemPackages = with pkgs; [
    newm-env
    pywm-atha # отдельно чтобы .so был в PATH

    wayland
    wayland-utils
    anydesk

    alacritty
    inputs.zen-browser.packages."${pkgs.system}".default

    helix
    wget
    git
    htop
    curl
    p7zip
    unzip
    zip
    jq
    ffmpeg
    gnumake
    gh
    cachix

    sops
    age

    (catppuccin-kvantum.override {
      accent = "lavender";
      variant = "macchiato";
    })
    (catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "lavender";
      font = "Casacdia Code";
      fontSize = "11";
    })

    openvpn
    networkmanager-openvpn

    nodejs

    libnotify
    libGL
    libGLU
    glfw
    mesa
  ];

  services.desktopManager.plasma6.enable = true;

  # в конце packages.nix, перед закрывающей }
  environment.etc."wayland-sessions/newm.desktop".text = ''
    [Desktop Entry]
    Name=newm
    Comment=newm Wayland compositor
    Exec=bash -c 'export PYTHONPATH=${pywm-atha}/lib/python3.13/site-packages; exec ${newm-env}/bin/start-newm /home/hfv5/.config/newm/config.py'
    Type=Application
  '';
  security.polkit.enable = true;
}
