#!/usr/bin/env bash
# 현재 폴더(과제 작업 폴더)에 규칙·템플릿을 복사한다. 기존 파일은 덮어쓰지 않는다.
KIT="$(cd "$(dirname "$0")" && pwd)"
if [ -e AGENTS.md ]; then
  cp "$KIT/AGENTS.md" AGENTS.kit.md
  echo "AGENTS.md가 이미 있어서 AGENTS.kit.md로 복사했어요. 두 파일 내용을 합치세요."
else
  cp "$KIT/AGENTS.md" AGENTS.md
  echo "AGENTS.md 생성"
fi
mkdir -p docs
for f in "$KIT"/templates/*.md; do
  b=$(basename "$f")
  if [ -e "docs/$b" ]; then echo "docs/$b 이미 있음, 건너뜀"; else cp "$f" "docs/$b"; echo "docs/$b 생성"; fi
done
echo "지시문 모음: cat ~/cofa-kit/PROMPTS.md"
