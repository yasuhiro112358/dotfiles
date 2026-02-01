# Git Commit

ステージされた変更に対してConventional Commits形式のコミットメッセージを生成し、コミットを作成します。

## 前提条件
- ユーザーが事前に `git add` でファイルをステージング済み

## Conventional Commits 形式

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### type（必須）
| type | 用途 |
|------|------|
| `feat` | 新機能の追加 |
| `fix` | バグ修正 |
| `docs` | ドキュメントのみの変更 |
| `style` | コードの意味に影響しない変更（空白、フォーマット等） |
| `refactor` | バグ修正でも機能追加でもないコード変更 |
| `perf` | パフォーマンス改善 |
| `test` | テストの追加・修正 |
| `build` | ビルドシステムや外部依存の変更 |
| `ci` | CI設定ファイルやスクリプトの変更 |
| `chore` | その他の変更（srcやtestに影響しない） |

### scope（任意）
変更の影響範囲を示す（例: `news`, `auth`, `api`）

### description（必須）
- 命令形で記述（"Add feature" not "Added feature"）
- 英語で記述
- 先頭は小文字
- 末尾にピリオドをつけない
- 50文字以内

### body（任意）
- 変更の動機や詳細を説明
- 72文字で折り返し

### 例
```
feat(news): add external URL extraction for Reddit posts

Extract external article URLs from Reddit RSS feed content
to enable fetching full article text from original sources.
```

```
fix(collector): handle SSL certificate errors gracefully
```

```
docs: update CLAUDE.md with new interests
```

## 実行手順

1. **ステージ状態の確認**
   ```bash
   git status
   ```
   - ステージされた変更がない場合は、ユーザーに通知して終了

2. **差分の確認**
   ```bash
   git diff --staged
   ```

3. **コミットメッセージの生成**
   - 変更内容を分析
   - 適切なtypeを選択
   - scopeがあれば付与
   - 簡潔なdescriptionを作成
   - 必要に応じてbodyを追加

4. **コミットの実行**
   ```bash
   git commit -m "$(cat <<'EOF'
   <type>(<scope>): <description>

   [body]

   Co-Authored-By: Claude <noreply@anthropic.com>
   EOF
   )"
   ```

5. **結果の確認**
   ```bash
   git status
   ```

## 注意事項
- `git add` は実行しない（ユーザーが手動でステージング）
- `git push` は実行しない（ユーザーが手動でプッシュ）
- pre-commit hookが失敗した場合は、問題を修正して新しいコミットを作成（--amendは使わない）
- Breaking Changeがある場合は type の後に `!` を付与（例: feat!: drop support for Node 12）
