# ドキュメント自動生成（オーケストレーター）

現在の作業コンテキストを分析し、作成すべきドキュメント種別を特定して対応するスキルに委譲する。

## ステップ1: トリガー検出とドキュメント種別の判定

会話・変更内容から以下のトリガーを検出し、委譲先スキルを特定する。

| トリガー | 委譲先スキル |
|---------|------------|
| プロジェクト概要・用語集の追加・変更 | doc-overview |
| 要件・スコープ・制約の追加・変更 | doc-req |
| ユーザー向け機能の追加・変更 | doc-spec |
| アーキテクチャ変更（ネットワーク・ルーティング・認証等） | doc-adr + doc-design |
| 新ツール・サービス・ミドルウェアの採用 | doc-adr |
| Ansible・Compose 等の構造変更 | doc-adr または doc-runbook |
| デプロイ・運用手順の追加・変更 | doc-runbook |
| 開発環境・テスト・ブランチ戦略の変更 | doc-dev |
| プロジェクト構成・ディレクトリの変更 | CLAUDE.md 直接修正（委譲なし） |

複数トリガーに該当する場合は、すべての委譲先スキルを順に実行する。

## ステップ2: 個別スキルへの委譲

特定した各委譲先スキルに対して、以下の手順で委譲する。

1. `~/.claude/skills/<スキル名>/SKILL.md` を Read ツールで読み込む
2. そのファイルに記載された手順に従ってドキュメントを作成する

| 委譲先スキル | SKILL.md のパス |
|------------|--------------|
| doc-overview | `~/.claude/skills/doc-overview/SKILL.md` |
| doc-req | `~/.claude/skills/doc-req/SKILL.md` |
| doc-spec | `~/.claude/skills/doc-spec/SKILL.md` |
| doc-design | `~/.claude/skills/doc-design/SKILL.md` |
| doc-adr | `~/.claude/skills/doc-adr/SKILL.md` |
| doc-runbook | `~/.claude/skills/doc-runbook/SKILL.md` |
| doc-dev | `~/.claude/skills/doc-dev/SKILL.md` |

複数スキルに委譲する場合は、上の表の順（番号の小さいディレクトリ順）に実行する。

## ステップ3: 完了報告

すべての委譲が完了したら、以下を報告する。

1. 作成・更新したファイルのパス一覧
2. 各ドキュメントの品質チェック結果
3. セキュリティ関連・本番運用手順を作成した場合はユーザーへレビュー依頼

## 注意事項

- リポジトリへのシークレット記載は絶対に行わない
- `.gitignore` 対象ファイル（`.env`, `.vault_pass`, `docs/secrets/`）の内容は参照しない
