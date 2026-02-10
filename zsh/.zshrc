# --- 1. Core Zsh Settings ---
bindkey -e  # Use emacs keybindings

# Completion system (Intelligent tab-completion)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case-insensitive completion

# --- 2. History Configuration ---
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt APPEND_HISTORY       # Append to history file, don't overwrite
setopt SHARE_HISTORY        # Share history between terminal sessions
setopt HIST_IGNORE_DUPS     # Don't record duplicates
setopt HIST_IGNORE_SPACE    # Don't record lines starting with a space
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks

# --- 3. Shell Options ---
setopt AUTO_CD              # Just type a directory name to cd into it
setopt NO_BEEP              # Disable beep sounds
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt GLOB_STAR_SHORT      # Enables recursive globbing (**)

# Support for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# --- 4. The Prompt (Fallback) ---
# Note: This is overridden by Starship if installed
if [[ "$TERM" == (xterm-color|*-256color) ]]; then
    PROMPT='%F{green}%n@%m%f:%F{cyan}%~%f$ '
else
    PROMPT='%n@%m:%~$ '
fi

# Set window title
case "$TERM" in
    xterm*|rxvt*)
        precmd() { print -Pn "\e]0;%n@%m: %~\a" }
        ;;
esac

# --- 5. Aliases & Color Support ---
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias fd='fdfind'
alias v='nvim'
alias m='makers'

# Load external aliases if they exist
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# --- 6. Environment Variables & Paths ---

# CUDA
export PATH=/usr/local/cuda-13/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-13/lib64:$LD_LIBRARY_PATH

# Rust / Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Go Configuration (Fixed Pathing)
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOMODCACHE=$GOPATH/pkg/mod
export GOTOOLCHAIN=local
# Ensure both GOROOT and GOPATH bins are in the path
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Node / NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NPM Global
export PATH="$HOME/.npm-global/bin:$PATH"

# --- 7. Minimalist Plugins (Manual Loading) ---
# Syntax Highlighting
if [ -f ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestions
if [ -f ~/.zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# --- 8. Starship Prompt ---
export LS_COLORS="di=01;36:ex=00:fi=00:ow=01;36:ln=01;35:or=40;31;01:mi=00:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:su=37;41:sg=30;43:ca=30;41:tw=30;42"
export EZA_COLORS="da=37:sn=33:gm=38;5;208:ga=32:gd=31:xx=38;5;244"

if command -v eza > /dev/null; then
  alias ls='eza --group-directories-first'
  alias ll='eza -lh --group-directories-first --git'
  alias lt='eza --tree --level=2'
fi

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
