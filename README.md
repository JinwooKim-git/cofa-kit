# cofa-kit

AI 코딩 에이전트(Codex)와 일할 때 쓰는 개인 작업 규칙, 문서 템플릿, 스킬입니다.
특정 과제의 답, 데이터, 코드는 들어 있지 않습니다.

## 사용법
```bash
git clone https://github.com/JinwooKim-git/cofa-kit /tmp/cofa-kit   # 작업 폴더 밖에 받기
bash /tmp/cofa-kit/setup.sh                                         # 과제 작업 폴더에서 실행 (기존 파일은 덮어쓰지 않음)
cat /tmp/cofa-kit/PROMPTS.md                                        # 지시문 모음 보기
```

## 구성
- `AGENTS.md` — Codex 작업 규칙 (단계 진행, 핵심 결정·지킬 항목, 실패 처리, AI 협업 기록, 서버 포트)
- `PLAN.md` — 목표·성공 기준·제약·핵심 결정·단계
- `LOG.md` — 업무 담당자 합의와 AI 협업 기록(발견·AI 진단·받아들임/고침/버림·확인)
- `VERIFY.md` — 검증 기록과 남은 한계
- `NOTES.md` — 내가 만든 것을 내 말로 정리 (후속 서술형 대비)
- `PROMPTS.md` — 단계별 지시문
- `skill-*.md` — Codex 스킬 5개 (setup.sh가 `.agents/skills/이름/SKILL.md`로 복사)

## 스킬
| 스킬 | 언제 | 하는 일 |
|---|---|---|
| `$kickoff` | 시작 직후 | README·데이터·요구 문서 파악, 핵심 계산 후보, 담당자 질문 5개 (코드 금지) |
| `$fixlog` | 오류·틀린 결과·방향 변경 | 원인 확인 후 그것만 고치고 전후 비교, AI 협업 기록 4칸, 커밋 |
| `$verify` | 결과가 나온 뒤 | 다른 방법으로 핵심 숫자 재계산, 요구사항별 상태, 깨질 곳 3개 (고치지 않음) |
| `$freeze` | 마감 전 | 기능 추가 중단, 결과 정리 문서, 서술형 대비 NOTES, 커밋 |
| `$mockq` | 제출 20~30분 전, 3번 탭 | 제출물로 서술형 6문항을 하나씩 묻고 채점 (파일 안 고침) |
