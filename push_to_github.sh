#!/bin/bash
# ============================================================
# Muchow Rise Estate — GitHub 初始化 & 推送脚本
# 在 Terminal 中 cd 到本文件夹后运行：bash push_to_github.sh
# ============================================================

REPO_NAME="Muchow-Rise-Estate"
ORG="fortune-forward"
FOLDER="Muchow Rise Estate, Logan Reserve_Estate"

echo "🚀 开始初始化 Git 仓库..."

# 清理可能存在的旧 .git
rm -rf .git

# 初始化
git init
git checkout -b main
git config user.name "Shaun Wang"
git config user.email "swangenterprises@gmail.com"

# 只添加网站文件（排除大型 PDF/PPTX）
git add index.html lot46.html lot58.html lot67.html README.md .gitignore

echo "📦 创建初始提交..."
git commit -m "Initial commit: Muchow Rise Estate website

- index.html: 8-slide Chinese presentation (Japandi design)
- lot46.html: Lot 46 Helena St — HERON MTR \$999,900
- lot58.html: Lot 58 Helena St — CRANE \$919,900
- lot67.html: Lot 67 Pieper Ct — CRANE \$919,900
- README.md: Project documentation"

echo "☁️  在 GitHub 创建仓库并推送..."
# 需要 GitHub CLI (gh)，如未安装：brew install gh
gh repo create "$ORG/$REPO_NAME" --public --source=. --remote=origin --push

echo ""
echo "✅ 完成！"
echo "🌐 仓库地址：https://github.com/$ORG/$REPO_NAME"
echo ""
echo "📡 启用 GitHub Pages："
echo "   gh api repos/$ORG/$REPO_NAME/pages -X POST -f source[branch]=main -f source[path]=/"
echo ""
echo "🔗 网站地址（Pages 启用后约1分钟生效）："
echo "   https://$ORG.github.io/$REPO_NAME/"
