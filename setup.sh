#!/usr/bin/env bash
# 사용법: 과제 작업 폴더(과제 README.md가 있는 곳)에서  bash /tmp/cofa-kit/setup.sh
KIT="$(cd "$(dirname "$0")" && pwd)"
if [ -e AGENTS.md ]; then
  cp "$KIT/AGENTS.md" AGENTS.kit.md
  echo "AGENTS.md가 이미 있어서 AGENTS.kit.md로 복사했어요. 기존 내용을 확인한 뒤 합치세요."
else
  cp "$KIT/AGENTS.md" AGENTS.md
  echo "AGENTS.md 생성"
fi
mkdir -p docs
for b in PLAN.md LOG.md VERIFY.md NOTES.md; do
  if [ -f "$KIT/templates/$b" ]; then src="$KIT/templates/$b"; else src="$KIT/$b"; fi
  if [ ! -f "$src" ]; then echo "$b 템플릿을 못 찾음"; continue; fi
  if [ -e "docs/$b" ]; then echo "docs/$b 이미 있음, 건너뜀"; else cp "$src" "docs/$b"; echo "docs/$b 생성"; fi
done
echo "지시문 모음: cat $KIT/PROMPTS.md"
