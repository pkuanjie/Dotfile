curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p ~/.local/bin/
mv nvim.appimage ~/.local/bin/
ln -s ~/.local/bin/nvim.appimage ~/.local/bin/nvim
source ~/.zshrc
mkdir -p ~/.config/
ln -s ~/Dotfile/nvim ~/.config/nvim
echo "Neovim installed and configured"
