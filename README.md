## .dotfiles

### About configuration:

* WM: i3-gaps
* Panel: Polybar
* Launcher: Rofi with slightly modified blor.theme (check rofi website)
* Lockscreen: i3lock-color
* Terminal Emulator: xfce4-terminal (+tmux)
* Terminal font: DejaVu Sans Mono (previously Terminus, but it's too small for my display right now, and I don't like bigger versions of it)
* Panel fonts: Terminus, Font Awesome 4, Material Design Icons
* Terminal/NeoVim Colors: base16-tomorrow-night (previously Nord, previously gruvbox)
* GTK theme: Arc Dark
* Icon theme: Papirus

### Screenshots:

![clean](https://raw.githubusercontent.com/SuperPrower/dotfiles/master/screenshots/clean.png)
![tmux](https://raw.githubusercontent.com/SuperPrower/dotfiles/master/screenshots/tmux.png)
![fake busy](https://raw.githubusercontent.com/SuperPrower/dotfiles/master/screenshots/busy.png)

[Wallpapers source](https://imgur.com/gallery/hS40T)

Previous wallpaper sources:
 - Toradora! (Light Novel illustration)


### Why I ditched urxvt and went with xfce4-terminal
Now that I use tmux, there is no real need for me to quickly open-close terminal. And despite all features of urxvt, it's just too hard to add support for ALL features I sometimes want - you have to install patches, and patches may or may not work, and fonts not always recognized, etc.,etc.

So, xfce4-terminal. With scrollbar and menubar disabled, it behaves like any other terminal emulator, minimalistic or not. I sure miss `.Xresources`, but when your terminal automatically falls back on other fonts without having you to specify them all, when all glyphs work (and I use plenty of glyphs in my configuration files), well, it's only natural that you will use it.

### About Polybar theme
It uses underlines to indicate things you will be interested. So, if there is a Wi-Fi or LAN connection, it will highlight those. It will highlight battery if it is discharging or finished charging, and sound if there is any.

Polybar is wonderful, only shame is that it doesn't have taskbar (but now when I use i3, it's not a real shame, but polybar still needs some polish and bugfixes)

### About Conky
I once noticed that my polybar is overloaded with stuff. When I was connected to both LAN and Wi-Fi networks, some indicators were hidden because left side of panel was already full. And I don't always need things like CPU temperature. So, I decided to give Conky a shot.

I use ffmpeg to extract album art from current song, then I use [this](https://github.com/itszn/Image-To-Braille) script to convert it to Braille with irc color sequences, and then I use 16 consecutive sed commands to replace them with words that Conky can recognize. Why? Becasue.
