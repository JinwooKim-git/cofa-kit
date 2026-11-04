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
for b in PLAN.md LOG.md VERIFY.md NOTES.md PROMPTS.md; do
  if [ -f "$KIT/templates/$b" ]; then src="$KIT/templates/$b"; else src="$KIT/$b"; fi
  if [ ! -f "$src" ]; then echo "$b 템플릿을 못 찾음"; continue; fi
  if [ -e "docs/$b" ]; then echo "docs/$b 이미 있음, 건너뜀"; else cp "$src" "docs/$b"; echo "docs/$b 생성"; fi
done
# Codex 스킬: skill-이름.md (또는 skills/이름/SKILL.md) -> .agents/skills/이름/SKILL.md
n=0
for f in "$KIT"/skill-*.md "$KIT"/skills/*/SKILL.md; do
  [ -f "$f" ] || continue
  case "$f" in
    */SKILL.md) name="$(basename "$(dirname "$f")")" ;;
    *) name="$(basename "$f" .md)"; name="${name#skill-}" ;;
  esac
  if [ -e ".agents/skills/$name/SKILL.md" ]; then echo "스킬 $name 이미 있음, 건너뜀"; continue; fi
  mkdir -p ".agents/skills/$name" && cp "$f" ".agents/skills/$name/SKILL.md" && n=$((n+1))
done
if [ "$n" -gt 0 ]; then echo "Codex 스킬 ${n}개 설치 (.agents/skills). codex는 이 다음에 켜야 인식해요"; fi
echo "지시문 모음: 왼쪽 docs/PROMPTS.md (또는 cat $KIT/PROMPTS.md)"
