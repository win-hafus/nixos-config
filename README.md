# NixOS Configuration

My personal NixOS configuration featuring:
- **Flakes** for reproducible builds
- **Home Manager** integration
- Modular structure with separate NixOS and Home Manager components
- Catppuccin theming (Macchiato Lavender variant)

## Repository Structure
```
├── hosts/           # Machine-specific configurations
├── modules/         # Reusable configuration modules
│   ├── nixos/       # System-level modules (for configuration.nix)
│   └── home-manager # User-level modules (for home.nix)
└── flake.nix        # Flake configuration
```

## Key Components
### System
- **Display Manager:** SDDM (with Catppuccin theme)
- **Wallpaper Engine:** HyprPaper
- **Theme:** Catppuccin Macchiato Lavender

### User Environment
- **Window Manager:** [Hyprland](https://github.com/hyprwm/Hyprland) (available through SDDM boot menu)
- **Application Launcher:** Rofi
- **Status Bar:** Waybar
- **Terminal:** Alacritty
- **Shell:** Zsh with Oh My Zsh framework
- **Icons:** Papirus-Dark
## Installation
### Option 1: Clean Install (Wipes existing configuration)
```bash
sudo rm -rf /etc/nixos
sudo git clone https://github.com/win-hafus/nixos-config /etc/nixos
# Edit configuration files:
#   - Set username in hosts/<your-host>.nix
#   - Configure options in modules/nixos/core.nix
sudo nixos-rebuild switch --flake /etc/nixos#hfv5
```

### Option 2: Integrate with Existing Configuration
1. Clone the repository:
```bash
git clone https://github.com/win-hafus/nixos-config
```
2. Import desired modules into your configuration
3. Ensure all inputs are declared in your `flake.nix`

## Features
- Automatic Home Manager build from system configuration
- Shared packages between NixOS and Home Manager
- Catppuccin theming for:
  - GTK applications
  - SDDM login manager
  - Terminal tools (via catppuccin-nix)
- Dual desktop environment support: Hyprland and Gnome

## References
- [Hyprland Compositor](https://github.com/hyprwm/Hyprland) 
- [Catppuccin Theme](https://github.com/catppuccin/nix)
- [Home Manager](https://github.com/nix-community/home-manager)
