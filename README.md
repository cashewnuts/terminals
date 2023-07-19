# terminal environment setups

```bash

./link-files.sh
./install-command.sh
./install-oh-my-zsh.sh
./install-fonts.sh
./install-anyenv.sh


# install powerlevel manually
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```
