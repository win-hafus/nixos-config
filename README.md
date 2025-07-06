# NixOS Configuration

My personal NixOS configuration featuring:
- **Flakes** for reproducible builds
- **Home Manager** integration
- Modular structure with separate NixOS and Home Manager components
- Catppuccin theming (Macchiato Lavender variant)
- Dual desktop environment support (Niri WM + GNOME)

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
- **Wallpaper Engine:** SWWW
- **Theme:** Catppuccin Macchiato Lavender

### User Environment
- **Window Manager:** [Niri](https://github.com/YaLTeR/niri) (Wayland compositor)
- **Application Launcher:** Rofi (Wayland version)
- **Status Bar:** Waybar
- **Terminal:** Alacritty
- **Shell:** Zsh with Oh My Zsh framework
- **Icons:** Papirus-Dark
- **Alternative DE:** GNOME (available through SDDM boot menu)

## Installation
### Option 1: Clean Install (Wipes existing configuration)
```bash
sudo rm -rf /etc/nixos
sudo git clone https://github.com/win-hafus/nixos-config /etc/nixos
# Edit configuration files:
#   - Set username in hosts/<your-host>.nix
#   - Configure options in modules/nixos/core.nix
sudo nixos-rebuild switch --flake /etc/nixos
```

### Option 2: Integrate with Existing Configuration
1. Clone the repository:
```bash
git clone https://github.com/win-hafus/nixos-config
```
2. Import desired modules into your configuration
3. Ensure all inputs are declared in your `flake.nix`

## Flake Inputs
```nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

## Features
- Automatic Home Manager build from system configuration
- Shared packages between NixOS and Home Manager
- `${username}` variables for easy customization
- Catppuccin theming for:
  - GTK applications
  - SDDM login manager
  - Terminal tools (via catppuccin-nix)
- Dual desktop environment support:
  - Default: Niri (Wayland compositor)
  - Alternate: GNOME (select in SDDM)

## Notes
1. Replace all instances of `${username}` with your actual username
2. For GNOME session: Select "GNOME" in SDDM's desktop environment menu
3. Wallpapers are managed through SWWW - configure in `home.nix`

## References
- [Repository](https://github.com/win-hafus/nixos-config)
- [Niri Compositor](https://github.com/YaLTeR/niri)
- [Catppuccin Theme](https://github.com/catppuccin/nix)
- [Home Manager](https://github.com/nix-community/home-manager)
