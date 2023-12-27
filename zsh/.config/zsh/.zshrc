# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# load aliasrc if it exist
[[ -f "${ZDOTDIR}/aliasrc" ]] && source "${ZDOTDIR}/aliasrc"  
# load optionrc if it exist
[[ -f "${ZDOTDIR}/optionrc" ]] && source "${ZDOTDIR}/optionrc"  
# #  Plugins
[[ ! -f "${ZDOTDIR}/plugins/powerlevel10k" ]] && source ${ZDOTDIR}/plugins/powerlevel10k/powerlevel10k.zsh-theme
# load pluginrc if it exist (will install/use powerleve10k and other plugins)
[[ -f "${ZDOTDIR}/pluginrc" ]] && source "${ZDOTDIR}/pluginrc"  
#
# # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f $ZDOTDIR/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh


#!/usr/bin/env zsh
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# use vi keybindings
bindkey -v


# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# zoxide 
# Check if zoxide is installed
if command -v zoxide >/dev/null 2>&1; then
    # Initialize zoxide for Zsh
    echo "zoxide is installed with bash. use z instead of cd."
    eval "$(zoxide init zsh)"
else
    # Print a message if zoxide is not installed
    echo "zoxide is not installed. Please install it to use its features."
fi


#   node version manager
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
if [[ -d ${NVM_DIR} ]]
then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
    echo "Node.js Version Manager `nvm` has not been installed, look up nvm. $NVM_DIR"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# (( ! ${+functions[p10k]} )) || p10k finalize

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
