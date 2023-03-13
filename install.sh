#!/user/bin/env zsh

# Creates links to .zshrc .config/nvim  etc

if [[ -z $STOW_FOLDERS ]]; then
  STOW_FOLDERS="nvim-config-chris,lvim,cpp,ansible,zsh,yabai,skhd"
fi

# should automate this with vars.
if [[ -z $DOTFILES_DIR ]]; then
  DOTFILES_DIR=$HOME/Repos/Dotfiles
fi

# move to ~Repos/Dotfiles directory
pushd $DOTFILES_DIR

# convert list of folders separated with ,
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
  echo "FOLDER $folder"
  # remove the links
  stow -D $HOME folder
  # create the links
  stow -vt $HOME folder
done

popd

