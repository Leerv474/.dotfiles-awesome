#!/bin/sh

echo -e "--- MAKE SURE .config EXISTS ---"

read exitst

if [[ $exists = 'no' ]]; then
    exit
else
    ln ~/.dotfiles/.config/awesome ~/.config/awesome
    ln ~/.dotfiles/.config/JetBrains ~/.config/JetBrains
    ln ~/.dotfiles/.config/kitty ~/.config/kitty
    ln ~/.dotfiles/.config/lf ~/.config/lf
    ln ~/.dotfiles/.config/picom.conf ~/.config/picom.conf
    ln ~/.dotfiles/.config/rofi ~/.config/rofi
    ln ~/.dotfiles/.config/polybar ~/.config/polybar
fi

rm ~/.bashrc
ln ~/.dotfiles/.bash/.bashrc ~/.bashrc
rm ~/.xbindkeysrc
ln ~/.xbindkeysrc


