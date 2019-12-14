#! /usr/bin/env bash

ln -s -f $PWD/.{aliases,profile,zshrc} ~/
ln -s -f $PWD/tmux/.{tmux,tmux.remote}.conf ~/

ln -s -f $PWD/{nvim,vifm,alacritty} ~/.config/
