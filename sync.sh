#!/usr/bin/env bash
# sync.sh — 一键提交推送，pre-commit hook 自动拦截敏感信息

set -e

cd "$(dirname "$0")"

echo ">>> 扫描变更..."
git add -A

echo ""
echo ">>> 将提交以下文件:"
git diff --cached --name-status
echo ""

if [ -z "$(git diff --cached --name-only)" ]; then
    echo "没有变更，跳过提交。"
    exit 0
fi

# 如果没有传参，则交互式输入 commit message
if [ $# -eq 0 ]; then
    echo -n "Commit message（留空则用默认）: "
    read -r msg
    if [ -z "$msg" ]; then
        msg="update $(date '+%Y-%m-%d %H:%M')"
    fi
else
    msg="$*"
fi

echo ""
echo ">>> git commit -m \"$msg\""
echo ""
git commit -m "$msg"

echo ""
echo ">>> git push origin master"
git push origin master

echo ""
echo "=== 同步完成 ==="
