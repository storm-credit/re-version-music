---
name: "source-command-suno"
description: "곡 기획 파일에서 Suno 프롬프트만 빠르게 추출하여 복사 가능하게 출력"
---

# source-command-suno

Use this skill when the user asks to run the migrated source command `suno`.

## Command Template

# /suno — Suno 프롬프트 추출

사용법: `/suno [곡 이름 or 파일 경로]`

## 수행
1. 곡 기획 파일에서 **Style of Music**, **Title**, **Lyrics** 추출
2. Suno Custom Mode에 바로 붙여넣을 수 있는 포맷으로 출력:

```
━━━━━━━━━━━━━━━━━━━━
📋 SUNO에 복사하세요
━━━━━━━━━━━━━━━━━━━━

[Title]
(곡 제목)

[Style of Music]
(스타일 키워드)

[Lyrics]
(전체 가사 + 섹션 태그)
━━━━━━━━━━━━━━━━━━━━
```

3. 추가 팁 출력:
- 3~5회 생성 권장
- 선택 기준 (후렴 멜로디, 보컬 음색, 전환 드라마)
- Style 미세 조정 팁
