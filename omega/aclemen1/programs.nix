{pkgs, ...}: 

{

  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    lazygit
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
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICOLOR = 1;
    EDITOR = "nvim";
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
        ];
        theme = "robbyrussell";
      };
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        cat = "bat";
        man = "batman";
        m = "make";
      };
      initExtra = ''
        neofetch
      '';
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
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