{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    history = {
      size = 10000;
      save = 10000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    historySubstringSearch.enable = true;

    envExtra = ''
      # Custom cd
        c() {
      	  cd $1;
      	  lsd;
        }
        dvd() {
          echo "use flake \"github:the-nix-way/dev-templates?dir=$1\"" >> .envrc;
          direnv allow;
        }
        eval "$(direnv hook zsh)"
    '';

    initContent = "source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh && any-nix-shell zsh --info-right | source /dev/stdin";
    shellAliases = {
      cd = "c";
      g = "git";
      #alias ls="ls -l"
      # for simple edits, use small config
      thunar = "thunar . &";
      td = "tmux detach";
      tk = "tmux kill-session";
      cat = "bat";
      clip = "xsel --clipboard";
      activate = "source env/bin/activate";
    };

    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
        };
      }
      {
        name = "zsh-fzf-history-search";
        src = pkgs.fetchFromGitHub {
          owner = "joshskidmore";
          repo = "zsh-fzf-history-search";
          rev = "d5a9730b5b4cb0b39959f7f1044f9c52743832ba";
          sha256 = "sha256-tQqIlkgIWPEdomofPlmWNEz/oNFA1qasILk4R5RWobY=";
        };
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.fetchFromGitHub {
          owner = "mdube99";
          repo = "zsh-vi-mode";
          rev = "c10d8f21ff4f17651c80c64a488785488f1cee71";
          sha256 = "sha256-7Ixv5afRow05GSHj7A+AgGnseuQaR8LpZVYC6jdl2ME=";
        };
      }
      {
        name = "atmachine-prompt";
        file = "atmachine-prompt.zsh-theme";
        src = pkgs.fetchFromGitHub {
          owner = "zap-zsh";
          repo = "atmachine-prompt";
          rev = "5e35ddc80960ff3b7ca5b2ee7476341366fc497b";
          sha256 = "12msgfqfnikny02sgiwkpr5jy7i8x9gyzyw5lcaii7kaqfjkxdbg";
        };
      }
    ];
  };
}
