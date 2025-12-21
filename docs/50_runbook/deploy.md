# 運用手順（Runbook）: セットアップ/更新

## 目的
新しい Mac への移行、または既存環境での反映手順を明確化する。

## 前提
- Git が利用できること
- `~/github.com/yasuhiro112358/dotfiles` にリポジトリを配置する
- 秘密情報はこのリポジトリに含めない

## 手順: 新規セットアップ
1. リポジトリを取得
```bash
git clone https://github.com/yasuhiro112358/dotfiles.git ~/github.com/yasuhiro112358/dotfiles
```

2. 既存ファイルを退避
```bash
mkdir -p ~/dotfiles_backup
mv ~/.zshrc ~/.zprofile ~/.bashrc ~/.bash_profile ~/.aliases ~/.gitconfig ~/.gitignore_global ~/.vimrc ~/dotfiles_backup/ 2>/dev/null
```

3. シンボリックリンクを作成
```bash
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.bashrc ~/.bashrc
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.bash_profile ~/.bash_profile
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.zshrc ~/.zshrc
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.zprofile ~/.zprofile
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.aliases ~/.aliases
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.gitconfig ~/.gitconfig
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.gitignore_global ~/.gitignore_global
ln -s /Users/yasuhiro/github.com/yasuhiro112358/dotfiles/.vimrc ~/.vimrc
```

4. 検証
```bash
ls -l ~/{.zshrc,.zprofile,.bashrc,.bash_profile,.aliases,.gitconfig,.gitignore_global,.vimrc}
```

## 手順: 更新
1. `~/github.com/yasuhiro112358/dotfiles` 内のファイルを編集
2. 変更をコミット・プッシュ
```bash
git status
```

## 手順: 巻き戻し
1. 削除対象の確認
```bash
ls -l ~/{.zshrc,.zprofile,.bashrc,.bash_profile,.aliases,.gitconfig,.gitignore_global,.vimrc}
```
確認のポイント:
- `->` が表示され、シンボリックリンクであること
- リンク先が `~/github.com/yasuhiro112358/dotfiles` 配下であること

2. シンボリックリンクを削除
```bash
rm ~/.zshrc ~/.zprofile ~/.bashrc ~/.bash_profile ~/.aliases ~/.gitconfig ~/.gitignore_global ~/.vimrc
```

3. 退避ファイルを戻す
```bash
mv ~/dotfiles_backup/* ~/ 2>/dev/null
```

## 注意事項
- 退避先 `~/dotfiles_backup` の内容は確認してから削除すること。
- 秘密情報や端末固有の設定は管理対象に入れない。
