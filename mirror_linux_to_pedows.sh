# --- 8. COPY NEVIM and STARSHIP to WINDOWS ---
# Get the Windows AppData/Local path from WSL
if ! command -v cmd.exe &> /dev/null; then
	echo "Skipping copying config to WSL"
else
	WIN_USER=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
	WIN_CONF_DIR="/mnt/c/Users/$WIN_USER/.config"
	WIN_NVIM_DIR="/mnt/c/Users/$WIN_USER/AppData/Local/nvim"

	if [ -f ~/.config/starship.toml ]; then
		echo "Pushing Starship.toml config to Windows..."
		cmd.exe /c "if not exist \"$WIN_CONF_DIR\" mkdir -p \"$WIN_CONF_DIR\"" 2>/dev/null
		# Copy all lua files and subdirectories
		cp -p ~/.config/starship.toml "$WIN_CONF_DIR/starship.toml"
		echo "[OK] Neovim config pushed to $WIN_NVIM_DIR"
	fi

	if [ -d ~/.config/nvim ]; then
		echo "Pushing Neovim config to Windows..."
		cmd.exe /c "if not exist \"$WIN_NVIM_DIR\" mkdir -p \"$WIN_NVIM_DIR\"" 2>/dev/null
		# Copy all lua files and subdirectories
		cp -r ~/.config/nvim/* "$WIN_NVIM_DIR/"
		echo "[OK] Neovim config pushed to $WIN_NVIM_DIR"
	fi
fi

