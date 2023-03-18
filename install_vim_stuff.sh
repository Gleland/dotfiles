# first, ensure that neovim is install
brew install neovim

# now, let's get lazyvim setup
#
# https://github.com/LazyVim/lazyvim
#
mkdir -p ~/.config/nvim/
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bakmv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# clone latest version of stater
git clone https://github.com/LazyVim/starter ~/.config/nvim
# remove the git repo after cloning, we won't need it after
rm -rf ~/.config/nvim/.git

# symlink config files
ln -v autocmds.lua ~/.config/nvim/lua/config/autocmds.lua
ln -v keymaps.lua ~/.config/nvim/lua/config/keymaps.lua
ln -v options.lua ~/.config/nvim/lua/config/options.lua

# symlink plugin files
ln -v plugins.lua ~/.config/nvim/lua/plugins/plugins.lua
