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
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
      };
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
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
          "history-substring-search"
          "z"
        ];
        theme = "robbyrussell";
      };
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "eza";
        ll = "eza -l";
        la = "eza -la";
      };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    alacritty = {
      enable = true;
    };
  };
}