# dotfiles
My dotfiles


## Command to create symbolic links
- 「~/github.com/yasuhiro112358/dotfiles/」でファイルをgit管理する
- 各ファイルはホームディレクトリ（本来の位置）にシンボリックリンクを作成することで有効にする

```bash
cd ~/github.com/yasuhiro112358/dotfiles
ln -s ./.bashrc ~/.bashrc
ln -s ./.bash_profile ~/.bash_profile

ln -s ./.zshrc ~/.zshrc
ln -s ./.zprofile ~/.zprofile

ln -s ./.aliases ~/.aliases

ln -s ./.gitconfig ~/.gitconfig
ln -s ./.gitignore_global ~/.gitignore_global

ln -s ./.vimrc ~/.vimrc

ln -s ./.p10k.zsh ~/.p10k.zsh
```

## How to clone this repository 
```bash
git clone https://github.com/yasuhiro112358/dotfiles.git ~/github.com/yasuhiro112358/dotfiles
```
