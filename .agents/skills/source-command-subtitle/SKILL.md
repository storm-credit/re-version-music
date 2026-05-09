---
name: "source-command-subtitle"
description: "곡 가사에서 ASS 자막 파일을 자동 생성"
---

# source-command-subtitle

Use this skill when the user asks to run the migrated source command `subtitle`.

## Command Template

# /subtitle — ASS 자막 생성

사용법: `/subtitle [곡 이름 or 파일 경로]`

## 수행
1. 곡 기획 파일에서 가사 추출
2. 섹션 태그([Verse], [Chorus] 등) 기반으로 타이밍 추정:
   - BPM 정보 활용
   - Intro: 0~15초
   - 각 Verse: ~25초
   - Chorus: ~30초
   - Bridge: ~20초
   - Outro: ~15초
3. ASS 자막 파일 생성:

### ASS 스타일 설정
```
[Script Info]
Title: (곡 제목)
ScriptType: v4.00+
PlayResX: 1080
PlayResY: 1920

[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding
Style: Default,Pretendard,48,&H00FFFFFF,&H000000FF,&H00000000,&H80000000,1,0,0,0,100,100,0,0,1,2,1,2,30,30,120,1
Style: Highlight,Pretendard,72,&H00FFFFFF,&H000000FF,&H00BF599B,&H80000000,1,0,0,0,100,100,0,0,1,3,2,5,30,30,400,1
Style: Whisper,Pretendard,36,&H80FFFFFF,&H000000FF,&H00000000,&H80000000,0,1,0,0,100,100,0,0,1,1,1,2,30,30,120,1
```

### 자막 규칙
- 일반 가사: Default 스타일
- 후렴 킬링파트: Highlight 스타일 (크게, 보라 글로우)
- 위스퍼/아웃트로: Whisper 스타일 (작게, 반투명)
- 섹션 태그 [Verse] 등은 자막에 포함하지 않음
- 한 줄에 최대 15자, 넘으면 줄바꿈

4. 파일 저장: `결과물/YYYYMMDD-곡제목/subtitle/곡제목.ass`

5. 주의사항:
   - 타이밍은 예상값. Suno 생성 후 실제 mp3 들으면서 미세 조정 필요
   - 조정 방법: Aegisub(무료) or 텍스트 에디터에서 직접 수정
