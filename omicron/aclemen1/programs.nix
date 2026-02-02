{pkgs, ...}: 

let
  # src = pkgs.fetchFromGitLab {
  #   domain = "gitlab.com";
  #   owner = "lanastara_foss";
  #   repo = "starship-jj";
  #   rev = "0.3.2";
  #   hash = "sha256-+wATQ3uXxUFFQt/Fz8PKZ7NmPzaNPfjWH/gfMXHryO4=";
  #   fetchSubmodules = false;
  # };
  # starship-jj = pkgs.rustPlatform.buildRustPackage {
  #   pname = "starship-jj";
  #   version = "0.3.2";
  #   inherit src;
  #   cargoLock = {
  #     lockFile = "${src}/Cargo.lock";
  #   };
  #   nativeBuildInputs = with pkgs; [ pkg-config ];
  #   buildInputs = with pkgs; [ openssl ];
  # };
in
{
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    lazygit
    lazydocker
    gitui
    ast-grep
    lua
    luarocks
    wget
    nodejs
    tree-sitter
    ghc
    haskell-language-server
    kubectl
    kubecolor
    kubie
    kubeseal
    argocd
    argo
    kubernetes-helm
    jq
    mosh
    neofetch
    tig
    gitu
    devpod
    cmatrix
    # starship-jj
    cursor-cli
  ];
  home.language = {
    base = "en_US.UTF-8";
  };
  home.sessionVariables = {
    PAGER = "less";
    CLICOLOR = 1;
    EDITOR = "nvim";
    # LANG = "en_US.UTF-8";
    # LC_ALL = "en_US.UTF-8";
  };
  home.file = {
    ".aerospace.toml".source = ./files/aerospace.toml;
  };
  programs = {
    tmux = {
      enable = true;
      prefix = "C-b";
      clock24 = true;
      baseIndex = 1;
      plugins = with pkgs; [
        tmuxPlugins.sensible
      ];
    };
    atuin = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "5m";
        inline_height = 10;
        style = "compact";
        enter_accept = true;
        workspaces = true;
      };
    };
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
        pager = "less -FR";
        map-syntax = [ 
          "*.jenkinsfile:Groovy"
          "*.props:Java Properties"
        ];
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch  
      ];
    };
    fzf = {
      enableZshIntegration = true;
    };
    eza = {
      enable = true;
    };
    git = {
      enable = true;
      delta = {
        enable = true;
      };
      aliases = {
        co = "checkout";
        br = "branch";
        st = "status";
      };
      userName = "Alain Clément";
      userEmail = "alain@clement.aero";
    };
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "docker"
          "kubectl"
          "helm"
          "fzf"
          "history-substring-search"
          "z"
          "man"
          "jj"
        ];
        theme = "robbyrussell";
      };
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        cat = "bat";
        man = "batman";
        ds = "devspace";
        j = "just";
      };
      initContent = ''
        neofetch
      '';
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # custom.jj = {
        #   command = "starship-jj";
        #   when = "jj status";
        #   format = "on [$symbol$output]($style)\n";
        #   style = "bold purple";
        #   symbol = "jj\n";
        # };
      };
    };
#    nixvim = {
#      enable = true;
#      # globals = {
#      #   mapleader = ",";
#      # };
#      colorschemes.catppuccin.enable = true;
#      globals.mapleader = " ";
#      plugins = {
#        lualine.enable = true;
#        telescope.enable = true;
#        web-devicons.enable = true;
#        oil.enable = true;
#        treesitter.enable = true;
#        luasnip.enable = true;
#        lsp = {
#          enable = true;
#          servers = {
#            nixd.enable = true;
#          };
#        };
#      };
#
#      # plugins = {
#      #   web-devicons.enable = true;
#      #   lualine.enable = true;
#      #   lsp = {
#      #     enable = true;
#      #     servers = {
#      #       nixd.enable = true;
#      #     };
#      #   };
#      #   lsp-lines.enable = true;
#      #   lsp-format.enable = true;
#      #   nix.enable = true;
#      #   nix-develop.enable = true;
#      #   telescope.enable = true;
#      # };
#      viAlias = true;
#      vimAlias = true;
#    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        LazyVim
      ];
    };
  };
}
