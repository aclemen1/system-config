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


## Useful NixOS Resources

Here's a list of valuable NixOS resources available on the web:

1. **NixOS Packages Search**:
   - https://search.nixos.org/packages
   - Search for available packages in the Nixpkgs collection.

2. **NixOS Options Search**:
   - https://search.nixos.org/options
   - Search for configuration options available in NixOS.

3. **Home Manager Options**:
   - https://nix-community.github.io/home-manager/options.html
   - Comprehensive list of options available in Home Manager.

4. **NixOS Wiki**:
   - https://nixos.wiki/
   - Community-maintained wiki with various guides and information.

5. **Nix Package Manager Guide**:
   - https://nixos.org/manual/nix/stable/
   - Official documentation for the Nix package manager.

6. **NixOS Manual**:
   - https://nixos.org/manual/nixos/stable/
   - Official NixOS system configuration manual.

7. **Nixpkgs Manual**:
   - https://nixos.org/manual/nixpkgs/stable/
   - Guide to the Nix Packages collection.

8. **NixOS Discourse Forum**:
   - https://discourse.nixos.org/
   - Community forum for discussions, questions, and sharing.

9. **r/NixOS Subreddit**:
   - https://www.reddit.com/r/NixOS/
   - Reddit community for NixOS users and enthusiasts.

10. **NixOS GitHub Repository**:
    - https://github.com/NixOS/nixpkgs
    - Source code for Nixpkgs and place to report issues.

These resources should help you navigate the NixOS ecosystem, find packages, understand configuration options, and get community support when needed.


## Useful Homebrew Resources

Here's a list of valuable Homebrew resources:

1. **Homebrew Homepage**:
   - https://brew.sh/
   - Official website with installation instructions and basic usage.

2. **Homebrew Documentation**:
   - https://docs.brew.sh/
   - Comprehensive documentation covering all aspects of Homebrew.

3. **Homebrew Formulae**:
   - https://formulae.brew.sh/
   - Search for available Homebrew formulae (command line packages).

4. **Homebrew Casks**:
   - https://formulae.brew.sh/cask/
   - Search for available Homebrew casks (GUI applications).

5. **Homebrew Discussion Forum**:
   - https://discourse.brew.sh/
   - Community forum for discussions, questions, and sharing.

6. **Homebrew GitHub Repository**:
   - https://github.com/Homebrew/brew
   - Source code for Homebrew and place to report issues.

7. **Homebrew Blog**:
   - https://brew.sh/blog/
   - Official blog with news and updates about Homebrew.

8. **Homebrew Analytics**:
   - https://formulae.brew.sh/analytics/
   - Usage statistics for Homebrew packages.

9. **Homebrew on Stack Overflow**:
   - https://stackoverflow.com/questions/tagged/homebrew
   - Community Q&A for Homebrew-related issues.

10. **Homebrew Cheatsheet**:
    - https://devhints.io/homebrew
    - Quick reference guide for common Homebrew commands.

These resources should help you navigate the Homebrew ecosystem, find packages, understand usage, and get community support when needed.

