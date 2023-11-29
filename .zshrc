#!/usr/bin/env zsh

DOTFILES="/usr/share/doc/fzf/examples"

# +---------+
# | HISTORY |
# +---------+
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

bindkey -v
bindkey "^R" history-incremental-pattern-search-backward

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/atmachine-prompt"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"

# +-----+
# | FZF |
# +-----+
if [ $(command -v "fzf") ]; then
    source "$DOTFILES/completion.zsh"
    source "$DOTFILES/key-bindings.zsh"
fi

# adding npm global installed programs to the path
path=('/usr/local/lib', $path)
export PATH
