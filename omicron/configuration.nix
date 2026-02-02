{ inputs, ... }:

{
  imports = [

    ({pkgs, ...}: {

      nix.extraOptions = "experimental-features = nix-command flakes";

      ids.gids.nixbld = 30000;

      environment.shells = [ pkgs.bash pkgs.zsh ];

      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = false;
        };
        brews = import ./formulae.nix;
        casks = import ./casks.nix;
        taps = import ./taps.nix;
      };

      # security.pam.enableSudoTouchIdAuth = true;
      security.pam.services.sudo_local.touchIdAuth = true;

      # services.nix-daemon.enable = true;

      fonts.packages = import ./fonts.nix pkgs;

      system = {
        primaryUser = "aclemen1";
        defaults = {
          finder.AppleShowAllExtensions = true;
          NSGlobalDomain.AppleShowAllExtensions = true;
          finder._FXShowPosixPathInTitle = true;
          NSGlobalDomain.InitialKeyRepeat = 14;
          NSGlobalDomain.KeyRepeat = 1;
          NSGlobalDomain.NSWindowShouldDragOnGesture = true;
          NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;          
        };
        keyboard = {
          enableKeyMapping = true;
          # remapCapsLockToEscape = true;
          };
      };

      programs.zsh.enable = true; # IMPORTANT: This must be true for Home Manager to work
      
      environment.systemPackages = with pkgs; [ 
        coreutils
      ];

      users = import ./users.nix;

      system.stateVersion = 5;

    })

    inputs.nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = "aclemen1";
        autoMigrate = true;
      };
    }
    
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.aclemen1 = {
          home.stateVersion = "24.05";
          imports = [ ./aclemen1/programs.nix ];
        };
      };
    }

  ];
}
