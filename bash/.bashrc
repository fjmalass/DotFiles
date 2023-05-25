
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash
