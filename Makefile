.PHONY: help update rebuild switch clean check fmt dev test rollback

# Default target
.DEFAULT_GOAL := help

# Configuration
FLAKE := .
HOSTNAME := $(shell nix eval --raw .#lib.hostname 2>/dev/null || echo "nixos")

##@ General

install: ## Initial install (set hostname + username and apply config)
	@echo "🚀 NixOS bootstrap installer"
	@echo ""

	@read -p "Hostname: " NEW_HOST; \
	read -p "Username: " NEW_USER; \
	echo ""; \
	echo "Configuration:"; \
	echo "  Hostname: $$NEW_HOST"; \
	echo "  Username: $$NEW_USER"; \
	echo ""; \
	read -p "Apply? [y/N] " -n 1 -r; \
	echo; \
	if [[ ! $$REPLY =~ ^[Yy]$$ ]]; then \
		echo "❌ Cancelled"; \
		exit 1; \
	fi; \
	echo ""; \
	echo "🔧 Updating flake.nix..."; \
	sed -i -E 's/username = "[^"]+"/username = "'$$NEW_USER'"/' flake.nix; \
	sed -i -E 's/hostname = "[^"]+"/hostname = "'$$NEW_HOST'"/' flake.nix; \
	echo "✅ Updated flake.nix"; \
	echo ""; \
	echo "🔨 Building configuration..."; \
	sudo nixos-rebuild switch --flake .#$$NEW_HOST; \
	echo ""; \
	echo "🎉 Installation complete!"

help: ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\n\033[1mUsage:\033[0m\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Updates

update-flake: ## Update flake.lock only
	@echo "🔄 Updating flake inputs..."
	nix flake update

update-channels: ## Update nix-channels
	@echo "🔄 Updating nix-channels..."
	sudo nix-channel --update

update: update-flake update-channels ## Update both flake and channels
	@echo "✅ All updates completed!"

##@ Building & Switching

build: ## Build system configuration without switching
	@echo "🔨 Building system configuration..."
	sudo nixos-rebuild build --flake $(FLAKE)#$(HOSTNAME)

test: ## Test configuration (reverts on reboot)
	@echo "🧪 Testing configuration (will revert on reboot)..."
	sudo nixos-rebuild test --flake $(FLAKE)#$(HOSTNAME)

switch: ## Build and activate configuration
	@echo "🚀 Building and switching to new configuration..."
	sudo nixos-rebuild switch --flake $(FLAKE)#$(HOSTNAME)

boot: ## Build and set as boot default (requires reboot)
	@echo "⚙️  Building and setting boot configuration..."
	sudo nixos-rebuild boot --flake $(FLAKE)#$(HOSTNAME)
	@echo "⚠️  Reboot required to activate!"

rebuild: switch ## Alias for switch

##@ Combined Operations

full-update: update switch ## Update everything and rebuild
	@echo "✅ Full update completed successfully!"

quick-update: update-flake switch ## Quick update (flake only) and rebuild
	@echo "✅ Quick update completed!"

safe-update: update build ## Update and build without switching
	@echo "✅ Safe update completed. Run 'make switch' to apply."

##@ Cleanup

clean-result: ## Remove result symlinks
	@echo "🧹 Removing result symlinks..."
	@find . -maxdepth 1 -type l -name 'result*' -delete
	@echo "✅ Result symlinks removed"

gc: ## Run garbage collection (delete old generations)
	@echo "🗑️  Running garbage collection..."
	sudo nix-collect-garbage -d
	@echo "✅ Garbage collection completed"

gc-old: ## Delete generations older than 30 days
	@echo "🗑️  Removing generations older than 30 days..."
	sudo nix-collect-garbage --delete-older-than 30d
	@echo "✅ Old generations removed"

optimize: ## Optimize nix store
	@echo "⚡ Optimizing nix store..."
	sudo nix-store --optimize
	@echo "✅ Store optimization completed"

clean: clean-result gc optimize ## Full cleanup (GC + optimize + remove results)
	@echo "✅ Complete cleanup finished!"

##@ Rollback & Recovery

rollback: ## Rollback to previous generation
	@echo "⏮️  Rolling back to previous generation..."
	sudo nixos-rebuild switch --rollback
	@echo "✅ Rollback completed!"

rollback-boot: ## Set previous generation as boot default
	@echo "⏮️  Setting previous generation as boot default..."
	sudo nixos-rebuild boot --rollback
	@echo "⚠️  Reboot required to activate!"

##@ Advanced Debugging

repair: ## Repair store paths
	@echo "🔧 Repairing store paths..."
	sudo nix-store --verify --check-contents --repair

verify: ## Verify store integrity
	@echo "🔍 Verifying store integrity..."
	sudo nix-store --verify --check-contents

##@ Aliases

up: full-update ## Alias for full-update
qup: quick-update ## Alias for quick-update