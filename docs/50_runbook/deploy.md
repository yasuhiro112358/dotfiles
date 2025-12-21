# 運用手順（Runbook）: セットアップ/更新

## 目的
新しい Mac への移行、または既存環境での反映手順を明確化する。

## 前提
- Git が利用できること
- `~/dotfiles` にリポジトリを配置する
- 秘密情報はこのリポジトリに含めない

## 手順: 新規セットアップ
1. リポジトリを取得
```bash
git clone <YOUR_REPO_URL> ~/dotfiles
```

2. 既存ファイルを退避
```bash
mkdir -p ~/dotfiles_backup
mv ~/.zshrc ~/.zprofile ~/.bashrc ~/.bash_profile ~/.aliases ~/.gitconfig ~/.gitignore_global ~/.vimrc ~/dotfiles_backup/ 2>/dev/null
```

3. シンボリックリンクを作成
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

4. 検証
```bash
ls -l ~/{.zshrc,.zprofile,.bashrc,.bash_profile,.aliases,.gitconfig,.gitignore_global,.vimrc}
```

## 手順: 更新
1. `~/dotfiles` 内のファイルを編集
2. 変更をコミット・プッシュ
```bash
git status
```

## 手順: 巻き戻し
1. シンボリックリンクを削除
```bash
rm ~/.zshrc ~/.zprofile ~/.bashrc ~/.bash_profile ~/.aliases ~/.gitconfig ~/.gitignore_global ~/.vimrc
```

2. 退避ファイルを戻す
```bash
mv ~/dotfiles_backup/* ~/ 2>/dev/null
```

## 注意事項
- 退避先 `~/dotfiles_backup` の内容は確認してから削除すること。
- 秘密情報や端末固有の設定は管理対象に入れない。
