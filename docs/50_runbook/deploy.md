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
mv ~/.zshrc ~/.zprofile ~/.bashrc ~/.bash_profile ~/.aliases ~/.gitconfig ~/.gitignore_global ~/.vimrc ~/.p10k.zsh ~/.claude/skills ~/dotfiles_backup/ 2>/dev/null
```

3. シンボリックリンクを作成
```bash
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.bashrc ~/.bashrc
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.bash_profile ~/.bash_profile
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.zshrc ~/.zshrc
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.zprofile ~/.zprofile
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.aliases ~/.aliases
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.gitconfig ~/.gitconfig
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.gitignore_global ~/.gitignore_global
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.vimrc ~/.vimrc
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.p10k.zsh ~/.p10k.zsh

# Claude Code skills
mkdir -p ~/.claude
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.claude/skills ~/.claude/skills
```

4. 検証
```bash
ls -l ~/{.zshrc,.zprofile,.bashrc,.bash_profile,.aliases,.gitconfig,.gitignore_global,.vimrc,.p10k.zsh}
ls -l ~/.claude/skills
```
確認のポイント:
- `->` が表示され、シンボリックリンクであること
- リンク先が `~/github.com/yasuhiro112358/dotfiles/home` 配下であること

## 手順: 更新
1. `~/github.com/yasuhiro112358/dotfiles/home` 内のファイルを編集
2. 変更をコミット・プッシュ
```bash
git status
```

## 手順: 巻き戻し
1. 削除対象の確認
```bash
ls -l ~/{.zshrc,.zprofile,.bashrc,.bash_profile,.aliases,.gitconfig,.gitignore_global,.vimrc,.p10k.zsh}
ls -l ~/.claude/skills
```
確認のポイント:
- `->` が表示され、シンボリックリンクであること
- リンク先が `~/github.com/yasuhiro112358/dotfiles/home` 配下であること

2. シンボリックリンクを削除
```bash
rm ~/.zshrc ~/.zprofile ~/.bashrc ~/.bash_profile ~/.aliases ~/.gitconfig ~/.gitignore_global ~/.vimrc ~/.p10k.zsh
rm ~/.claude/skills
```

3. 退避ファイルを戻す
```bash
mv ~/dotfiles_backup/* ~/ 2>/dev/null
```

## 注意事項
- 退避先 `~/dotfiles_backup` の内容は確認してから削除すること。
- 秘密情報や端末固有の設定は管理対象に入れない。
