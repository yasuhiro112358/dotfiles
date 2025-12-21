# Project Documentation Policy

## 目的
このリポジトリでは、要件・設計・意思決定・運用を **Git管理**し、生成AIを活用して
- 変更理由を追跡できる（Why）
- いまの仕様が分かる（What）
- 誰でも運用できる（How）
状態を維持する。

## 基本方針（原則）
- **Docs as Code**：ドキュメントはコードと同じくレビュー・履歴・差分で管理する
- **1ドキュメント1目的**：混ぜない（要件と運用、仕様とADRなど）
- **決定はADRに残す**：設計判断・採用理由・代替案・影響範囲を記録
- **最新は常に1箇所**：同じ情報を複数ファイルに重複させない（リンクで参照）
- **テンプレ駆動**：新規作成は templates から作る
- **小さく頻繁に更新**：大改修より、差分が追える粒度で更新

## ドキュメント体系（何をどこまで書くか）
### 1) 要件（Requirements）
- 対象：目的、スコープ、ユースケース、非機能（SLO/制約/セキュリティ）
- 成果：要件定義書（RD）
- 注意：実装詳細は書かない。仕様・設計に委譲する。

### 2) 機能仕様（Functional Spec）
- 対象：画面/IF/データ/処理の振る舞い、例外系、受入条件
- 成果：機能仕様書（FS）
- 注意：内部設計（クラス/モジュール構造）は書きすぎない。

### 3) 設計（Design）
- 対象：アーキテクチャ、構成、データモデル、IF設計、シーケンス
- 成果：設計書（DD）
- 注意：設計判断の「理由」はADRへ。

### 4) ADR（Architecture Decision Record）
- 対象：採用/不採用の理由がある判断すべて（技術選定、構成、運用方式、規約）
- 成果：ADR（番号付き）
- 注意：結論だけでなく「代替案」「トレードオフ」「影響範囲」を必ず残す。

### 5) Runbook / 運用手順（Operations）
- 対象：デプロイ、障害対応、バックアップ/リストア、監視、更新手順
- 成果：運用手順書（Runbook）
- 注意：オンコールが読んで動ける粒度。コマンド例と検証観点を含める。

### 6) 開発者向け（Developer Guide）
- 対象：ローカル起動、開発フロー、lint/test、ブランチ運用、リリース
- 成果：CONTRIBUTING / 開発ガイド

## AI活用ルール（生成AIを“記録の仕組み”に組み込む）
### AIに任せてよいもの
- 初期ドラフト、叩き台、チェックリスト化、文章の整形、差分要約
- 運用手順の安全なコマンド例の提案（要レビュー）

### 人が必ず確認するもの（特に重要）
- セキュリティ、鍵/秘密情報、ネットワーク公開範囲
- 本番の破壊的操作（削除、上書き、データ移行、証明書更新）
- コンプライアンス、契約、課金、法務

### プロンプトの残し方
- 重要な生成物は「生成に使った前提・入力・制約」を docs/prompts に残す
- ADRには「AIが提案した案」「採用しなかった理由」を短くでも残す

## 命名規則
- ファイル名は kebab-case（例：`mail-requirements.md`）
- 日付を付ける場合：`YYYY-MM-DD_` を先頭（例：`2025-12-16_release-note.md`）
- ADRは `adr-0001-<title>.md` 形式で連番

## レビュー運用（おすすめ）
- Docs変更もPR対象（軽微なら自己レビューでもよいが履歴は残す）
- “仕様変更”は必ず「関連ADR」または「変更理由」をPR本文に書く
- リリース単位で `docs/changelog/` にまとめる（任意）

---

# ディレクトリ構成（提案）

docs/
README.md # この方針ドキュメント（入口）
index.md # 目的別リンク集（任意）

00_overview/
project-charter.md # 目的/背景/成功条件/用語
glossary.md # 用語集（単一ソース）
context.md # 現状/前提/制約（AI入力にも使う）

10_requirements/
requirements.md # 要件定義（RD）
non-functional.md # 非機能（SLO/制約/セキュリティ/可用性）
acceptance-criteria.md # 受入条件（テスト観点の元）

20_specs/
functional-spec.md # 機能仕様（FS）
api-spec.md # API仕様（OpenAPI等に分けてもよい）
data-spec.md # データ仕様（スキーマ/制約/サンプル）

30_design/
architecture.md # 構成/アーキ概要
sequence.md # 主要フロー
deployment.md # デプロイ構成（Docker/Traefikなど）
security.md # セキュリティ設計（公開範囲/証明書/秘密管理）

40_adr/
adr-0001-template.md # ADRテンプレ
adr-0001-xxxx.md # ADR本体（連番）

50_runbook/
operations-overview.md # 運用全体像（監視・責務）
deploy.md # デプロイ手順
backup-restore.md # バックアップ/リストア手順
incident-response.md # 障害対応の手順
maintenance.md # 定期作業（証明書更新など）

60_dev/
developer-guide.md # 開発環境/起動/テスト
contributing.md # PR規約/ブランチ戦略/レビュー観点
coding-standards.md # コーディング規約（任意）

70_prompts/
prompt-library.md # 使えるプロンプト集（コピペ用）
rd-draft.md # 要件ドラフト生成用入力
adr-draft.md # ADR作成用入力
runbook-draft.md # 手順書作成用入力

templates/
requirements-template.md
functional-spec-template.md
runbook-template.md
decision-template-adr.md

changelog/
2025-12.md # 月次/リリースノート（任意）

## 最小セット（まずはこれだけで回る）
- `docs/README.md`
- `docs/10_requirements/requirements.md`
- `docs/20_specs/functional-spec.md`
- `docs/40_adr/adr-0001-xxxx.md`
- `docs/50_runbook/deploy.md`

## 追加ルール（重要）
- **秘密情報は絶対に置かない**：鍵・パスワード・トークン・実IP等
- 必要なら `env.example` と、秘密は Secret Manager / `.env`（gitignore）
- 図は `docs/assets/` に置く（Mermaid推奨：差分が追いやすい）