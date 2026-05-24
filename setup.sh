#!/usr/bin/env bash
# setup.sh — 新 clone 后执行一次，安装 pre-commit hook
set -e
cd "$(dirname "$0")"
cp hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
echo "Pre-commit hook 已安装。之后每次 git commit 都会自动扫描敏感信息。"
