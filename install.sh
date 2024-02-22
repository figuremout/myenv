#!/bin/bash

# TMUX
# Install tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Alacritty
# Install themes
# We use Alacritty's default Linux config directory as our storage location here.
if [ ! -d ~/.config/alacritty/themes ]; then
    mkdir -p ~/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
fi

# Back up and replace
if [ -n "$1" ] && [ -d "$1" ]; then
    echo "Change to $1"
    cd $1 || exit
fi
backup_dir=backup_$(date +"%Y%m%d_%H%M%S")
echo "Back up location: ${backup_dir}"
mkdir ${backup_dir}

prefix="dot-"
for file in ${prefix}*; do
    in_place="${file/${prefix}/${HOME}\/.}"
    backup="${file/${prefix}/dot-}"
    # back up
    \cp -r ${in_place} ${backup_dir}/${backup}
    # overwrite
    \cp -rfT ${file} ${in_place}
done

