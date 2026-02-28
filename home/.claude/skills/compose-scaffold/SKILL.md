# compose-scaffold

[Docker Compose Standard 0001](https://knowledge.newtralize.com/standards/0001-docker-compose/) に従い、プロジェクトに必要な compose ファイル群を生成する。

## 生成するファイル

| ファイル | 役割 | 適用 |
|---------|------|------|
| `compose.yaml` | 環境非依存のベース構成（最小限） | 常時 |
| `compose.override.yaml` | ローカル開発用 | `docker compose up -d` で自動適用 |
| `compose.production.yaml` | 本番環境用（Traefik 等） | `-f` で明示指定 |

実行コマンド：
- ローカル: `docker compose up -d`
- 本番: `docker compose -f compose.yaml -f compose.production.yaml up -d`

## 各ファイルの設計方針

**compose.yaml（ベース）**
- `image` と名前付き `volumes` の定義のみ
- `environment` の必須変数は `${VAR:?}` 構文で列挙（値は持たせない。未設定時に起動前エラーになるため設定漏れを早期検知できる）
- `ports`・`labels`・`restart`・`networks` は持たせない

**compose.override.yaml（ローカル開発用）**
- `ports` の公開
- ローカルファイルの `volumes` マウント
- `restart` は記述しない
- `environment` の値は `.env` で管理するため記述しない

**compose.production.yaml（本番用）**
- `restart: unless-stopped`
- Traefik ラベル（`traefik.enable`, `router`, `service`, `tls` 等）
- 外部ネットワーク（`traefik`）への接続
- 本番用の `environment` 値（`.env` 参照）

## 手順

1. プロジェクト内に既存の compose ファイルがあれば読み込んで内容を把握する。なければユーザーにサービス構成をヒアリングする（サービス名・使用イメージ・公開ポート・必要な環境変数・ボリューム等）

2. 上記の設計方針に従って3ファイルの内容を作成する

3. 作成内容をユーザーに提示して確認を得る

4. 承認後にファイルを書き出す。既存の compose ファイル（`docker-compose.yml` 等）が残っている場合は削除してよいか確認する

5. `.env.example` が存在しない場合、本番用の環境変数テンプレートとして生成を提案する
