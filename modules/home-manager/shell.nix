{
  pkgs,
  ...
}: {
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

      # Courtesy of Graham Helton
      # e.g. cp `DL` .
        DL() {
      	  variable1=$(echo ~/Downloads/$(/usr/bin/ls -ltr ~/Downloads | tail -n1 | awk {"print \$9"}));
      	  echo $variable1;
        }
        eval "$(direnv hook zsh)"
    '';

    initExtra = "source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh && any-nix-shell zsh --info-right | source /dev/stdin";
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
      #grep = "rg";
      activate = "source env/bin/activate";
      IP = "tmux list-windows | grep \"\*\" | grep -E -o \"([0-9]{1,3}[\.]){3}[0-9]{1,3}\"";
      cpIP = "tmux list-windows | grep \"\*\" | grep -E -o \"([0-9]{1,3}[\.]){3}[0-9]{1,3}\" | xsel --clipboard";
      #dvd = "echo use flake \"github:the-nix-way/dev-templates?dir=$1\" >> .envrc && direnv allow";
      #alias cpIP="tmux list-windows | grep '\*' | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}' | xsel --clipboard";
    };

    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
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
        name = "completions";
        src = pkgs.fetchFromGitHub {
          owner = "zap-zsh";
          repo = "completions";
          rev = "e92051e99c5a0c29f40ceed33ade9a23096047c8";
          sha256 = "sha256-tvEpQb/p7d/puzwK6CI/HKcB0412BopNAX+fKNPX9JE=";
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
        name = "zsh-history-substring-search";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          rev = "87ce96b1862928d84b1afe7c173316614b30e301";
          sha256 = "sha256-1+w0AeVJtu1EK5iNVwk3loenFuIyVlQmlw8TWliHZGI=";
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
