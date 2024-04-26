{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    history.size = 10000;
    history.save = 10000;
    history.expireDuplicatesFirst = true;
    history.ignoreDups = true;
    history.ignoreSpace = true;
    historySubstringSearch.enable = true;

    envExtra = ''
# Custom cd
      c() {
	  cd $1;
	  lsd;
      }

# Courtesy of Graham Helton
# e.g. cp `DL` .
      DL() {
	  variable1=$(echo ~/Downloads/$(/usr/bin/ls -ltr ~/Downloads | tail -n1 | awk {"print \$9"}));
	  echo $variable1;
      }
    '';

    initExtra = "source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh ";
    shellAliases = {
	cd = "c";
	g = "git";
#alias ls="ls -l"
# for simple edits, use small config
	thunar = "thunar . &";
	td = "tmux detach";
	tk = "tmux kill-session";
	tl = "tmux ls";
	zr = "zellij run -- ";
	zrf = "zellij run -f -- ";
	cat = "bat";
	clip = "xsel --clipboard";
	grep = "rg";

# script to copy nmap scripts
	nmapScripts = "ls /usr/share/nmap/scripts | fzf --reverse | xsel --clipboard";
	latexreload = "latexmk -pdf -pvc $1";
	notes = "cd ~/notes && vim -c ':Telescope live_grep' && cd -";
	#alias cpIP="tmux list-windows | grep '\*' | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}' | xsel --clipboard";
      };

    zplug = {
    enable = true;
    plugins = [
	{ name = "joshskidmore/zsh-fzf-history-search"; }
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "zsh-users/zsh-syntax-highlighting"; }
	{ name = "zsh-users/zsh-history-substring-search"; }
	{ name = "zap-zsh/completions"; }
	{ name = "mdube99/zsh-vi-mode"; }
	{ name = "zap-zsh/fzf"; }
	{ name = "zap-zsh/atmachine-prompt"; tags = [ as:theme depth:1 ]; }
      ];  
    };
  };
}