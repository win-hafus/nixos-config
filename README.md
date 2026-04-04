# NixOS Configuration

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat&logo=nixos&logoColor=white)](https://nixos.org)
[![Flakes](https://img.shields.io/badge/Nix-Flakes-informational.svg?style=flat&logo=nixos&logoColor=white)](https://nixos.wiki/wiki/Flakes)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

My personal NixOS configuration with a focus on modularity, reproducibility, and aesthetics.

## Features

- 🔄 **Flakes** — fully reproducible builds
- 🏠 **Home Manager** — declarative user environment management
- 🎨 **Catppuccin Macchiato** — consistent theming across the system
- 🪟 **Hyprland** — modern Wayland compositor
- 📦 **Modular Architecture** — easily extensible and maintainable configuration

## 📸 Screenshots
<p align="center">
  <img width="49%" src="https://github.com/user-attachments/assets/ac0eb7fa-43aa-411b-bab4-69d44e3c1fed" />
  <img width="49%" src="https://github.com/user-attachments/assets/7e74d589-a5ed-4cc5-8749-d3e7e5c69185" />
  <img width="99%" src="https://github.com/user-attachments/assets/fa6b06a9-3815-456e-b427-d3dfa721e8b1" />
  <img width="49%" src="https://github.com/user-attachments/assets/b69e06a1-f7e4-400b-8e96-14f594ade398" />
  <img width="49%" src="https://github.com/user-attachments/assets/0de250de-e210-42f2-8912-ef47dffc1195" />
</p>

## 🗂️ Project Structure

```
.
├── flake.nix              # Main entry point
├── flake.lock
├── hosts/                 # Host-specific configurations
│   └── default/           # Default host configuration
├── modules/               # Reusable modules
│   ├── nixos/            # System-level modules (NixOS)
│   └── home-manager/     # User-level modules (Home Manager)
├── LICENSE
└── README.md
```

## 🎨 System Components

### System Level

| Component | Value |
|-----------|-------|
| **Display Manager** | SDDM with Catppuccin theme |
| **Desktop Environment** | GNOME + Hyprland (your choice) |
| **Wallpaper Engine** | AWWW |
| **Theme** | Catppuccin Macchiato Lavender |

### User Environment

| Category | Applications |
|----------|--------------|
| **Window Manager** | [Hyprland](https://github.com/hyprwm/Hyprland) |
| **Terminal** | Alacritty |
| **Shell** | Zsh + Oh My Zsh |
| **Launcher** | Rofi |
| **Status Bar** | Waybar |
| **File Manager** | Nautilus |
| **Icons** | Papirus-Dark |

## 🚀 Installation

### Prerequisites

- NixOS installed
- Flakes enabled (add to `/etc/nixos/configuration.nix`):
  ```nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  ```

### Option 1: Full Configuration Replacement

> ⚠️ **Warning:** This method will delete your current configuration!

```bash
# Remove existing configuration
sudo rm -rf /etc/nixos

# Clone the repository
sudo git clone https://github.com/win-hafus/nixos-config /etc/nixos

# Navigate to the directory
cd /etc/nixos
make install

# Apply the configuration
make switch
```

### Option 2: Integration with Existing Configuration

```bash
# Clone to your home directory
git clone https://github.com/win-hafus/nixos-config ~/nixos-config

# Import desired modules into your configuration
# Add to your flake.nix:
inputs.my-config.url = "github:win-hafus/nixos-config";

# Then use the modules:
imports = [ inputs.my-config.nixosModules.default ];
```


## ⚙️ Configuration

### Changing Username and Hostname

Edit `flake.nix`:

```nix
...
let
      username = "hfv5";
      hostname = "nixos";
    in {
...
```

## 🔄 Updating

```bash
# Update flake inputs
make update-flake

# Apply updates
make switch

# Clean old generations (optional)
make gc-old
```

## 📚 Useful Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/) — official documentation
- [Home Manager Manual](https://nix-community.github.io/home-manager/) — Home Manager documentation
- [Nix Pills](https://nixos.org/guides/nix-pills/) — deep dive into Nix
- [MyNixOS](https://mynixos.com/) — search NixOS options
- [Hyprland Wiki](https://wiki.hyprland.org/) — Hyprland documentation
- [Catppuccin](https://github.com/catppuccin/catppuccin) — theme documentation

## 🤝 Contributing

Found a bug or have a suggestion? Feel free to open an issue or pull request!

## 📜 License

This project is licensed under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [NixOS](https://nixos.org/) — for the amazing operating system
- [Hyprland](https://github.com/hyprwm/Hyprland) — for the modern compositor
- [Catppuccin](https://github.com/catppuccin) — for the beautiful color scheme
- The NixOS community for continuous support and inspiration

---

<div align="center">
  Made with ❤️ and NixOS
</div>
