# ZSH

## setup ZDOTDIR from /etc/zsh/zshenv

```
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

## From the DotFiles repo: `stow -nvSt ~ zsh`
