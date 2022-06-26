# inspired by Chris@machine (ChristianChiarulli)
Be able to set up based for a given version of neovim

1. Get Neovim from Git and install and keep track of the version
	a. Uninstall old neovim (`brew uninstall neovime` or `sudo apt uninstall neovim`)
	b. clone/update from github, choose branch like `release-0.7`
	c. uninstall and install (with `make`)

2. Update `~/.config/nvim`
	* Cleanup with prepackaged `stow`, e.g., `nvim_config_swith chris`
	(So configuration is backed up )

3. Make sure to delete all your packages previously installed
  * `rm -rf ~/.local/share/nvim/site/pack/packer`

# Architecture
In `~/.config/nvim/init.lua`: all the starting configuration
In `~/.config/nvim/lua/user/`: all the specific configurations for that particular instance of `nvim`





