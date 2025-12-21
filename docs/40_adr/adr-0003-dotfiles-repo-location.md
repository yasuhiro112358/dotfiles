# ADR-0003: dotfiles リポジトリは ~/github.com/yasuhiro112358/dotfiles に配置する

- Status: Accepted
- Date: 2025-12-21

## Context
- すべての GitHub リポジトリを同じ場所（`~/github.com/yasuhiro112358/`）にクローンする運用ルールがある。
- dotfiles だけ例外にすると、運用の一貫性が下がる。

## Decision
- dotfiles リポジトリは `~/github.com/yasuhiro112358/dotfiles` に配置する。
- これに伴い、手順・ドキュメント内のパスはすべてこの場所を前提とする。

## Alternatives
1. **~/dotfiles に配置する（従来）**
   - 長所: パスが短く、手順が簡潔
   - 短所: 他リポジトリとの配置ルールに反する

2. **任意の場所に配置する**
   - 長所: 自由度が高い
   - 短所: 手順やリンクの統一が難しい

## Consequences
- すべての GitHub リポジトリの配置ルールと整合する。
- 既存のシンボリックリンクは新しいパスに貼り直す必要がある。
