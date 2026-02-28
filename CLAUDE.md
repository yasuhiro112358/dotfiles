# CLAUDE.md

このファイルは、リポジトリで作業する Claude Code (claude.ai/code) へのガイダンスを提供します。

## リポジトリ概要

シンボリックリンク方式による dotfiles 管理。すべての dotfile は `home/` 以下に置かれ、ホームディレクトリへシンボリックリンクされる。ビルド手順やスクリプトは不要 — シンボリックリンク経由で変更が即座に反映される。

## セットアップ（初回デプロイ）

```bash
# この正確なパスにクローン（.zshrc が絶対パスで参照するため必須）
git clone https://github.com/yasuhiro112358/dotfiles.git ~/github.com/yasuhiro112358/dotfiles

# 既存ファイルをバックアップしてからシンボリックリンクを作成
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.zshrc ~/.zshrc
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.zprofile ~/.zprofile
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.bashrc ~/.bashrc
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.bash_profile ~/.bash_profile
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.aliases ~/.aliases
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.gitconfig ~/.gitconfig
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.gitignore_global ~/.gitignore_global
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.vimrc ~/.vimrc
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.p10k.zsh ~/.p10k.zsh
ln -s ~/github.com/yasuhiro112358/dotfiles/home/.claude/skills ~/.claude/skills
ln -s ~/github.com/yasuhiro112358/dotfiles/home/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

ロールバックを含む完全な手順は `docs/50_runbook/deploy.md` を参照。

## アーキテクチャ

```
home/          # 実際の dotfile（~/ にシンボリックリンクされる）
docs/          # ドキュメント（種別ごとに整理）
  10_requirements/   # 目的・スコープ
  20_specs/          # 機能仕様（シェル起動挙動など）
  40_adr/            # Architecture Decision Records（設計判断の記録）
  50_runbook/        # 運用手順（デプロイ・ロールバック）
```

**主要ファイル:**
- `home/.zshrc` — Zsh メイン設定（Oh My Zsh + Powerlevel10k、NVM、Pyenv、PATH 設定）
- `home/.zprofile` — Zsh ログインシェル（Homebrew、pipx PATH）
- `home/.p10k.zsh` — Powerlevel10k プロンプト設定（自動生成済み；変更は `p10k configure` で行う）
- `home/.aliases` — Bash/Zsh 共通エイリアス
- `home/Library/Application Support/Code/User/settings.json` — VS Code 設定
- `home/.claude/skills/commit/SKILL.md` — Conventional Commits 用 `/commit` スキル
- `home/.claude/skills/doc/SKILL.md` — ドキュメント自動生成オーケストレーター `/doc` スキル
- `home/.claude/skills/doc-{overview,req,spec,design,adr,runbook,dev}/SKILL.md` — 種別ごとの個別ドキュメント生成スキル
- `home/.claude/skills/doc-quality/SKILL.md` — ドキュメント品質レビュー `/doc-quality` スキル

## 規約

**コミット:** Conventional Commits 形式を使用（`feat:`, `fix:`, `docs:`, `refactor:`, `chore:` など）。`/commit` スキルで自動化できる。

**ドキュメント:** Docs as Code 原則に従う — 1ドキュメント1目的、設計判断は ADR に残す、運用手順はランブックに記載。詳細は `docs/README.md` を参照。

**リポジトリ配置場所:** `~/github.com/yasuhiro112358/dotfiles/` でなければならない — `.zshrc` がこの場所からの絶対パスで `.p10k.zsh` を参照している。
