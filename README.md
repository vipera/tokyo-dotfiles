# Introduction

*Note: These dotfiles are still a work in progress*

Tokyko dotfiles

So here are my dotfiles for a i3wm/polybar setup, nicknamed "Tokyo". I'm using
it on Debian Buster, but there's no reason it wouldn't work on Arch or whatever
with minimal tweaks.

These files are designed for a small 13" laptop screen with a 4K resolution
(such as a Dell XPS) so make sure to adjust DPI settings if you have a smaller
resolution.

A lot of these customizations were inspired by
[@adi1090x](https://github.com/adi1090x)'s project for a pentesting desktop. I
was looking for a slightly less tweaked desktop for coding, as I don't care
about moving windows around to make them look cool. But I do care that the
desktop doesn't look like it's from 1995. I also wanted to avoid bitmap fonts as
I would be running the config on a 13" 4K screen.

## Components

- **i3** - my favourite window manager, and the default look is pretty neat.
  However, it could be nicer. i3bar allows very little visual customization and
  always looks crude. This is why with these dotfiles, i3 is used for tiling
  windows and all of it's bars are hidden.
- **Polybar** - I've given polybar a spin for making my own desktop layout, and
  it's really something :)
- **GTK** - can't do without GTK, but styling it with the Adapta Nokto Eta
  widget theme really makes it shine.
- **Fonts** - nice fonts make all the difference. I've used:
  - Noto Sans Mono
  - Font Awesome
  - [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## Dependencies

Obviously, i3 is a dependency, so install that first and log in.

I compiled polybar from source, this required some extra source packages:

    apt install cmake pkg-config libcairo2-dev libxcb-composite0-dev \
      libxcb-randr0-dev xcb-proto libxcb-image0-dev libxcb-util0-dev \
      libxcb-ewmh-dev libxcb-icccm4-dev libiw-dev

To get Adapta GTK theme:

    apt install adapta-gtk-theme

And to change GTK settings, I use LXDE's awesome dependency-free package:

    apt install lxappearance

Font Awesome is already in the sources for Debian 10:

    apt install font-font-awesome

For wallpaper management:

    apt install nitrogen

For bluetooth support:

    apt install blueman

## Preview

![desktop preview][previews/preview_1.png]

## Stuff you might need to adjust

### Battery/adapter naming

In .config/polybar/config, the battery module uses battery/adapter uses a
battery and adapter setting that may vary between systems, which is why it's
configurable:

    battery = BAT0
    adapter = AC

Check your own system's naming by doing

    ls -l /sys/class/power_supply/

In general, reading the [Polybar wiki](https://github.com/polybar/polybar/wiki)
is a good idea.

### Interface naming

Likewise in .config/polybar/config, an interface name on my system is mentioned:

    [custom]
    wlan_iface = wlp2s0

I've put it in the "custom" config section and that value is referenced
elsewhere so it only needs to be set there.

This would need to be updated if it differs from how your system names them,
check with:

    ip a show
