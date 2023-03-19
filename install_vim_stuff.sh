# first, ensure that neovim is install
brew install neovim

# now, let's get lazyvim setup
#
# https://github.com/LazyVim/lazyvim
#
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bakmv ~/.config/nvim ~/.config/nvim.bak

# clone latest version of stater
git clone https://github.com/LazyVim/starter ~/.config/nvim
# remove the git repo after cloning, we won't need it after
rm -rf ~/.config/nvim/.git

# remove empty templates from LazyVim and symlink local config files
rm ~/.config/nvim/lua/config/autocmds.lua
rm ~/.config/nvim/lua/config/keymaps.lua
rm ~/.config/nvim/lua/config/options.lua

ln -vf autocmds.lua ~/.config/nvim/lua/config/autocmds.lua
ln -vf keymaps.lua ~/.config/nvim/lua/config/keymaps.lua
ln -vf options.lua ~/.config/nvim/lua/config/options.lua

# symlink plugin files
ln -vf plugins.lua ~/.config/nvim/lua/plugins/plugins.lua
