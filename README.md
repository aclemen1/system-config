# System Configuration

This repository contains the system configuration for a macOS setup using Nix and `darwin-rebuild`.

## Makefile

The `Makefile` in this repository provides convenient shortcuts for common operations:

1. `make` or `make switch`: This is the default target. It runs `darwin-rebuild switch --flake .`, which applies the current configuration to the system.

2. `make update`: This target does two things:
   - First, it runs `nix flake update` to update all flake inputs to their latest versions.
   - Then, it runs `darwin-rebuild switch --flake .` to apply the updated configuration to the system.

These commands simplify the process of managing and updating the system configuration. The `switch` command applies changes, while the `update` command ensures you're using the latest versions of all dependencies before applying changes.

To use these commands, navigate to the directory containing the Makefile in your terminal and run the desired `make` command.
