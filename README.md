# cofa-kit

AI 코딩 에이전트(Codex)와 일할 때 쓰는 개인 작업 규칙과 문서 템플릿입니다.
특정 과제의 답, 데이터, 코드는 들어 있지 않습니다.

## 사용법
```bash
git clone https://github.com/<아이디>/cofa-kit ~/cofa-kit   # 작업 폴더 밖에 받기
cd ~/workspace                                               # 과제 작업 폴더로 이동
bash ~/cofa-kit/setup.sh                                     # 규칙·템플릿 복사 (기존 파일은 덮어쓰지 않음)
cat ~/cofa-kit/PROMPTS.md                                    # 지시문 모음 보기
```

## 구성
- `AGENTS.md` — Codex 작업 규칙
- `templates/PLAN.md` — 목표·성공 기준·제약·단계 (계획 문서)
- `templates/LOG.md` — 업무 담당자·AI와의 협업·결정 기록
- `templates/VERIFY.md` — 검증 기록과 남은 한계
- `templates/NOTES.md` — 내가 만든 것을 내 말로 정리
- `PROMPTS.md` — 단계별 지시문 틀
