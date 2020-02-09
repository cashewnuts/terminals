#! /usr/bin/env bash

ln -s -f $PWD/.{aliases,zprofile,zshrc} ~/
ln -s -f $PWD/tmux/.{tmux,tmux.remote}.conf ~/

ln -s -f $PWD/{nvim,vifm,alacritty} ~/.config/
