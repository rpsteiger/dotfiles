FZF_SCRIPTS="/usr/share/doc/fzf/examples"
if [[ "$(uname)" == "Darwin" ]]; then
	FZF_SCRIPTS="/opt/homebrew/opt/fzf/shell/"
fi

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

# +-----+
# | FZF |
# +-----+
if [ $(command -v "fzf") ]; then
	source "$FZF_SCRIPTS/completion.zsh"
	source "$FZF_SCRIPTS/key-bindings.zsh"
fi

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/atmachine-prompt"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
# plug "Aloxaf/fzf-tab"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Go environment variables
export GOROOT="/usr/local/go"
export PATH=$PATH:"/usr/local/go/bin"
export GOPATH="/home/ryan/go/"
export GOBIN="/home/ryan/go/bin"
export PATH=$PATH:"$GOPATH"/bin

# adding the folder ~/.bin for my shell scripts
export PATH=$PATH:"/home/ryan/.bin"
export PATH=$PATH:"/opt/jadx/bin"
export PATH=$PATH:"~/.local/bin"

# adding brew path for macOS
if [[ "$(uname)" == "Darwin" ]]; then
	export PATH=$PATH:"/opt/homebrew/bin"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ls aliases
alias ls='eza --icons --group-directories-first'

alias cat='bat --theme="Nord" --color=always --wrap=auto --style=plain'

# zoxide init
eval "$(zoxide init zsh)"

export TERM=screen-256color
