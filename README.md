# dotfiles
My dotfiles


## Command to create symbolic links
- 「~/dotfiles/」でファイルをgit管理する
- 各ファイルはホームディレクトリ（本来の位置）にシンボリックリンクを作成することで有効にする

```bash
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile

ln -s ~/dotfiles/.aliases ~/.aliases

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global

ln -s ~/dotfiles/.vimrc ~/.vimrc
```

## How to clone this repository 
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
```