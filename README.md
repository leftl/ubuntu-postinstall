
# Ubuntu Post-Install
This repo serves to document and automate the configuration of Ubuntu Desktop. The script `postinstall.sh` is meant to be as hands-off and non-interactive as possible, and was created for my own personal use. Please review the file and edit it to your needs before running. What has not yet been automated in the setup process will be documented here.

>Note: only tested on Ubuntu 18.04 LTS and 19.04.

## Running
Clone this repository, then change to the appropriate directory:
``` bash 
$ git clone https://github.com/leftl/ubuntu-postinstall.git && cd ubuntu-postinstall
```
Then, change the permissions and run the script:
``` bash
$ chmod +x postinstall.sh
$ ./postinstall.sh
```

## Firefox Add-ons
[uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/) - Ad-blocker

[Decentraleyes](https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/) - Privacy

[ViolentMonkey](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) - UserScript Engine

[HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/) - Privacy + Security

[ClearUrls](https://addons.mozilla.org/en-US/firefox/addon/clearurls/) - Privacy

[Gnome Shell Integration](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/) - Install extensions from extensions.gnome.org

## Gnome Extensions
[Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/) - Highly customizable persistent dock

[User Themes](https://extensions.gnome.org/extension/19/user-themes/) - Enable custom shell themes

[NoAnnoyance](https://extensions.gnome.org/extension/1236/noannoyance/) - Better window focus settings

[Impatience](https://extensions.gnome.org/extension/277/impatience/) - Animation speed control

[Dynamic Panel Transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/) - Enable custom top panel transparency and more


## TODO
- [ ] Integrate dotfiles, possibly by creating dotfiles repo and using GNU Stow
- [ ] Use `$ gsettings` to configure gnome as preferred vs defaults
