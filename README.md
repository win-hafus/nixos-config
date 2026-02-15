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

> *Screenshots coming soon*

## 🗂️ Project Structure

```
.
├── flake.nix              # Main entry point
├── flake.lock
├── hosts/                 # Host-specific configurations
│   └── hfv5/           # Default host configuration
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
| **Wallpaper Engine** | HyprPaper |
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

# Configure for your system
# 1. Edit hosts/default/configuration.nix
# 2. Set your username
# 3. Configure parameters in modules/nixos/core.nix

# Apply the configuration (replace 'hfv5' with your hostname)
sudo nixos-rebuild switch --flake /etc/nixos#hfv5
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

### Changing Username

Edit `hosts/default/configuration.nix`:

```nix
users.users.your-name = {
  isNormalUser = true;
  extraGroups = [ "wheel" "networkmanager" ];
};
```

### Changing Hostname

In `flake.nix`, replace `hfv5` with your desired hostname:

```nix
nixosConfigurations.your-hostname = nixpkgs.lib.nixosSystem {
  # ...
};
```


## 🔄 Updating

```bash
# Update flake inputs
nix flake update

# Apply updates
sudo nixos-rebuild switch --flake /etc/nixos#hfv5

# Clean old generations (optional)
sudo nix-collect-garbage -d
```
## 🎯 Roadmap

- [ ] Add desktop screenshots
- [ ] Set up CI/CD for automatic checks
- [ ] Add module documentation
- [ ] Create overlays for custom packages

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
