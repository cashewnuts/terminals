#!/bin/bash

url="https://github.com/ryanoasis/nerd-fonts/releases/latest"
font_path="/usr/share/fonts"

font_url=$(curl -w "%{url_effective}\n" -I -L -s -S "$url" -o /dev/null | sed "s#tag#download#")

download_fonts() {
  echo "Download $1"
  sudo mkdir "$font_path/$1"
  wget -P "/tmp" "$font_url/$1.tar.xz"
  ls -la "/tmp/$1.tar.xz" 
  echo "extracting font to $font_path/$1"
  sudo tar -xf "/tmp/$1.tar.xz" -C "$font_path/$1/"
  rm "/tmp/$1.tar.xz"
}


font_names=(
    "UbuntuMono"
    "SourceCodePro"
    "RobotoMono"
    "FiraCode"
)
for i in "${font_names[@]}"; do
    download_fonts "$i"
done

echo "Refresh font cache"
sudo fc-cache -fv

