# System Configuration

This repository contains the system configuration for a macOS setup using Nix and `darwin-rebuild`.

## Justfile

The `justfile` provides convenient shortcuts for common operations. Requires [`just`](https://github.com/casey/just).

### Nix / darwin-rebuild

| Commande | Description |
|---|---|
| `just` ou `just switch` | Applique la configuration (`darwin-rebuild switch --flake .#omicron`) |
| `just update` | Met à jour les inputs du flake (`nix flake update`) puis applique |

### Claude Code — plugins

| Commande | Description |
|---|---|
| `just cc-install` | Installation complète (marketplaces + tous les plugins) |
| `just cc-marketplaces` | Enregistre `aclemen1-marketplace` et `unisis-marketplace` |
| `just cc-plugins-user` | Installe `version-control` dans le scope `user` |
| `just cc-plugins-alain` | Installe `obsidian` et `productivity` dans le vault *Alain Clément* |
| `just cc-plugins-unisis` | Installe les plugins métier dans le vault *UNISIS* |


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

