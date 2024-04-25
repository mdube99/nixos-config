{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-a";
    mouse = true;

    plugins = [
      pkgs.tmuxPlugins.better-mouse-mode
      pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.vim-tmux-navigator
      pkgs.tmuxPlugins.gruvbox
    ];

    extraConfig = ''
# New window
      unbind '"'
      unbind %
      bind '"' split-window -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind-key b break-pane -d

      bind-key C-p previous-window
      bind-key C-n next-window

# Easy Config Reloads
      bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# Direction
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

# easy navigation if you're using vim
# See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
      bind-key -n 'C-Space' if-shell "$is_vim" 'send-keys C-Space' 'select-pane -t:.+'

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l
      bind-key -T copy-mode-vi 'C-Space' select-pane -t:.+

# Fine adjustment (1 or 2 cursor cells per bump)
      bind -n S-Left resize-pane -L 2
      bind -n S-Right resize-pane -R 2
      bind -n S-Down resize-pane -D 1
      bind -n S-Up resize-pane -U 1

# Coarse adjustment (5 or 10 cursor cells per bump)
      bind -n C-Left resize-pane -L 10
      bind -n C-Right resize-pane -R 10
      bind -n C-Down resize-pane -D 5
      bind -n C-Up resize-pane -U 5

# Vim selection:
      setw -g mode-keys vi

# unbind [
      bind Escape copy-mode
# unbind p
      bind p paste-buffer
      bind-key -Tcopy-mode-vi 'v' send -X begin-selection
# bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
# works way better for copying and pasting than xclip
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xsel -i --clipboard'

      bind-key C-o rotate-window
      bind-key + select-layout main-horizontal
      bind-key = select-layout main-vertical

      bind-key a last-pane
      bind-key q display-panes
    '';
  };
}
