# 環境設定
vim(neovim)、tmux等のターミナル環境を統一するためのリポジトリ

# 使い方
## clone 
```bash
git clone https://github.com/cashewnuts/terminals.git
cd terminals
```

## vim

シンボリックリンクを設定する。
```bash
ln -s `pwd`/nvim ~/.config/
```

nvimを開いて以下のコマンドを実行する。
```
:call dein#install()
```

## tmux

シンボリックリンクを設定する。
```bash
ln -s `pwd`/tmux/.tmux.conf ~
```

Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Hit prefix + I to fetch the plugin and source it. You should now be able to use the plugin.

# vim (neovim)のプラグイン環境

# tmuxのプラグイン環境

