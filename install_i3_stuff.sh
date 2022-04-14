# install i3
mkdir -p ~/.config/i3
ln -v i3_config ~/.config/i3/config

# install i3 status bar
mkdir -p ~/.config/i3status
ln -v i3_status_config ~/.config/i3status/config

# install rofi config and themes
mkdir -p ~/.config/rofi
ln -v rofi_config.rasi ~/.config/rofi/config.rasi
ln -v rofi_ubuntu_theme.rasi ~/.config/rofi/ubuntu.rasi
