# 機能仕様（FS）

## 概要
本リポジトリ内の設定ファイルを、ホームディレクトリへシンボリックリンクで反映する。

## 機能
### 1. 管理対象ファイル
- `~/github.com/yasuhiro112358/dotfiles/.zshrc`
- `~/github.com/yasuhiro112358/dotfiles/.zprofile`
- `~/github.com/yasuhiro112358/dotfiles/.bashrc`
- `~/github.com/yasuhiro112358/dotfiles/.bash_profile`
- `~/github.com/yasuhiro112358/dotfiles/.aliases`
- `~/github.com/yasuhiro112358/dotfiles/.gitconfig`
- `~/github.com/yasuhiro112358/dotfiles/.gitignore_global`
- `~/github.com/yasuhiro112358/dotfiles/.vimrc`
- `~/github.com/yasuhiro112358/dotfiles/.p10k.zsh` (Powerlevel10k設定)

#### 補足: `.zprofile` と `.zshrc` の役割
- `.zprofile`: **ログインシェル**で読み込まれる。PATH など環境変数系を置くのが一般的。
- `.zshrc`: **対話シェル**で読み込まれる。エイリアスや補完など操作性設定を置くのが一般的。

### 2. 適用（リンク作成）
- リポジトリを `~/github.com/yasuhiro112358/dotfiles` に配置する。
- ホームディレクトリの既存ファイルを退避したうえで、シンボリックリンクを作成する。

### 3. 更新
- 変更は `~/github.com/yasuhiro112358/dotfiles` 側のファイルに対して行い、Git で履歴管理する。
- 反映はリンクにより即時に有効化される。

### 4. 解除 / 巻き戻し
- シンボリックリンクを削除し、退避した元ファイルを戻す。

## 例外・注意
- 既存ファイルがある場合は上書きしない（退避が前提）。
- 秘密情報は追加しない。

## 受入条件（最小）
- `ls -l ~/{.zshrc,.zprofile,.bashrc,.bash_profile,.aliases,.gitconfig,.gitignore_global,.vimrc,.p10k.zsh}` で全て `dotfiles` 配下へのリンクであることが確認できる。
