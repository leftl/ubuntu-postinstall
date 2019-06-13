#!/usr/bin/env bash
# Author: Tyler Waters
#
# This script is intended for personal use only and may not behave as expected
# on your system. Critical system configs will be altered without creating backups 
# or confirmation. Use with caution.
set -e
hash sudo apt-get sed wget

fullpath=$(dirname $(realpath $0))

echo "== Starting Post-Install script at $fullpath =="

if (( ! $EUID )); then
	echo "$(basename $0) should NOT be ran as root, user specific changes will be made." 
	echo "You may be prompted for your password several times." 
	exit 1
fi

sudo apt-get update
sudo apt-get dist-upgrade -y

# Packages to be removed and installed via apt: edit as needed.
packageremove="gnome-shell-extension-ubuntu-dock gnome-shell-extension-ubuntu-dock"
packageinstall="tlp tlp-rdw gnome-tweaks gnome-calculator gnome-system-monitor gnome-logs gnome-characters youtube-dl chrome-gnome-shell ffmpeg 
mpv flatpak gnome-software-plugin-flatpak chromium-browser pepperflashplugin-nonfree gparted zsh zsh-syntax-highlighting tmux printer-driver-cups-pdf 
unrar htop curl git ubuntu-restricted-extras transmission neofetch fonts-noto-color-emoji fonts-font-awesome ttf-mscorefonts-installer 
apt-transport-https"
gnomeextension="gnome-shell-extension-impatience gnome-shell-extension-no-annoyance gnome-shell-extensions gnome-shell-extension-dashtodock"

echo "== Installing/Removing user specified Applications =="
sudo apt-get remove -y $packageremove
sudo apt-get install -y $packageinstall $gnomeextension

# Completely remove snap subsystem. This will remove some gnome applications from the system
# including: gnome-calculator gnome-characters gnome-logs gnome-system-monitor
sudo apt-get remove --purge snapd gnome-software-plugin-snap
rm -fr ~/snap

# add flathub and install the spotify client and gimp from flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.spotify.Client org.gimp.GIMP

# install Codium - a free & open source distribution of Microsoft's VSCode
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update
sudo apt install codium 

## fix scroll issue after resuming from suspend (Thinkpad T440s) with kerenel parameter
if grep -q psmouse.synaptics_intertouch /etc/default/grub; then
    echo "== Kernel parameter already present, skipping =="
else
    # sed seems to only work with double quotes in this call. possible bug?
    sudo sed -i "/GRUB_CMDLINE_LINUX_DEFAULT/ s/quiet/& psmouse.synaptics_intertouch=0/" /etc/default/grub 
    sudo update-grub
    echo "== Scroll fix applied via kernel parameter =="
fi

# install user.js located in same folder as script into all default firefox profile(s)
if [ -e user.js ]; then
    cp -r user.js $HOME/.mozilla/firefox/{*.default,*.default-release}
fi

# remove livepatch form applications launcher
sudo rm -f /usr/share/applications/software-properties-livepatch.desktop

# clean apt cache and orphans
sudo apt-get clean 
sudo apt-get autoclean
sudo apt-get autoremove

echo "== Set-up is complete =="
echo "== Please reboot the system by running 'reboot' =="
exit 0

##TODO
#integrate dotfiles, possibly pull from a seperate repo and use GNU Stow/bash script
#use gsettings to configure gnome as preferred vs defaults
#gsettings set org.gnome.desktop.interface clock-show-weekday true
#gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
#gsettings set org.gnome.shell enabled-extensions "['dash-to-dock@micxgx.gmail.com','impatience@gfxmonk.net','noannoyance@sindex.com','dynamic-panel-transparency@rockon999.github.io','ubuntu-appindicators@ubuntu.com','user-theme@gnome-shell-extensions.gcampax.github.com']"
#gsettings set org.gnome.system.location enabled false
#gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'dark'
#gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'code.desktop', 'com.spotify.Client.desktop', 'org.gnome.Terminal.desktop']""
#gsettings set org.gnome.shell enable-hot-corners true
#gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
#gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true 
#gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true 
#gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 5150