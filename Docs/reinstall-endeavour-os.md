# Steps to Reset PC

- Use `F10` to go into the boot section. Move the USB to the top of the list. Restart PC (it may need to restart or something)
- Enter wifi password
- Start distro installer (steps will be for endeavouros)
- Settings: (see photo also)
  - online installation
  - british english locals + keyboard (UK, extended, Windows)
  - Plasma KDE (maybe i3 to get the scripts back)
  - Just use whatever apps you want (can leave defaults) including boot loader
  - Erase existing disk partitions
  - Enter personal details. Use regular password.
- Wait for a bit
- Restart pc
- Unplug USB
- Change boot menu options back to disk
- Start pc & log in
- Update mirrors & install packages
- Console: `sudo pacman -S bitwarden`
- Log into [GitHub](https://github.com/)
- Clone dotfiles
- Run install script `~/dotfiles/Scripts/install/endeavouros_install.sh`

## Firefox

Add extensions:

  - Tree Style Tab
  - uBlock Origin
  - Enhancer for YouTube™
  - Audio Equalizer
  - Video DownloadHelper
  - Dracula (Theme

Toggle:

- Ctrl+Tab cycles through tabs in recently used order
- Sponsored shortcuts
- Sponsored stories

