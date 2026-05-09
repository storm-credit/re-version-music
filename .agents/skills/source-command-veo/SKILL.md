---
name: "source-command-veo"
description: "곡 기획 파일에서 힉스필드 Veo 3 영상 프롬프트를 생성"
---

# source-command-veo

Use this skill when the user asks to run the migrated source command `veo`.

## Command Template

# /veo — 힉스필드 Veo 3 프롬프트 생성

사용법: `/veo [곡 이름 or 파일 경로]`

## 수행
1. 곡 기획 파일의 이미지 프롬프트 or 영상 컨셉 섹션 읽기
2. 각 장면을 Veo 3 영상 프롬프트로 변환:
   - 4~6초 클립 기준
   - 카메라 움직임 추가 (slow zoom in, slow pan left to right, static, etc.)
   - 분위기/조명/색감 구체화
   - 9:16 세로 비율 명시

3. 출력 포맷:
```
━━━━━━━━━━━━━━━━━━━━
🎬 VEO 3 프롬프트 (힉스필드)
━━━━━━━━━━━━━━━━━━━━

[Scene 1 — Intro] (4초)
(프롬프트)

[Scene 2 — Verse 1] (6초)
(프롬프트)

...
━━━━━━━━━━━━━━━━━━━━
```

4. 각 프롬프트에 포함할 키워드:
   - 카메라: slow zoom in / slow pan / static / tracking shot / aerial
   - 비율: vertical 9:16, cinematic
   - 길이: 4 seconds / 6 seconds
   - 분위기: 곡의 감정에 맞게
   - 색감: 시리즈별 컬러 팔레트 적용
