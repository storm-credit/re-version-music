---
name: "source-command-produce"
description: "곡 기획 파일에서 Suno 프롬프트, 힉스필드 Veo3 프롬프트, ASS 자막, ffmpeg 명령을 자동 생성하는 프로덕션 커맨드"
---

# source-command-produce

Use this skill when the user asks to run the migrated source command `produce`.

## Command Template

# /produce — Re:Version Music 프로덕션 파이프라인

사용법: `/produce [곡 기획 파일 경로 or 곡 이름]`

## 수행 순서

### 1단계: 곡 기획 파일 읽기
- 인자로 받은 경로 or `02. 곡 기획/` 하위에서 곡 이름 검색
- frontmatter에서 type, original, concept 추출
- Suno 프롬프트, 가사, 영상 가이드 파싱

### 2단계: 결과물 폴더 생성
```
결과물/YYYYMMDD-곡제목/
├── music/
├── video/
├── subtitle/
└── metadata/
```

### 3단계: Suno 프롬프트 최종 정리
- Style of Music + Title + Lyrics를 **복사 가능한 블록**으로 출력
- 사용자가 바로 Suno에 붙여넣을 수 있게

### 4단계: 힉스필드 Veo 3 프롬프트 생성
곡 기획 파일의 이미지 프롬프트를 **Veo 3 영상 프롬프트**로 변환:
- 각 장면을 4~6초 영상 클립으로
- 카메라 움직임 지시 추가 (slow zoom in, pan left, etc.)
- 분위기/색감 키워드 추가
- 각 프롬프트를 복사 가능한 블록으로 출력

### 5단계: ASS 자막 파일 생성
- 가사를 ASS 자막 포맷으로 변환
- 각 구절의 시작/종료 시간은 Suno 생성 후 조정 필요 (일단 예상값)
- 자막 스타일: 흰색, Pretendard Bold, 하단 1/3
- 핵심 가사(후렴)는 크게 + 글로우
- `subtitle/` 폴더에 .ass 파일 저장

### 6단계: ffmpeg 합성 스크립트 생성
- Veo 3 영상 클립들 + Suno mp3 + ASS 자막 → 최종 영상
- ffmpeg 명령어를 실행 가능한 .sh 스크립트로 생성
- `scripts/` 폴더에 저장
- 쇼츠 버전(50초 컷) 명령어도 별도 생성

### 7단계: 업로드 메타데이터 생성
- YouTube 제목, 설명, 태그, 해시태그
- TikTok 캡션
- `metadata/upload_info.md`로 저장

## 출력
각 단계 결과를 사용자에게 보여주고, 파일로도 저장.
사용자는 Suno → 힉스필드 → ffmpeg 순서로 실행하면 됨.
