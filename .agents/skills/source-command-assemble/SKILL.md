---
name: "source-command-assemble"
description: "Veo 3 영상 클립 + Suno mp3 + ASS 자막을 ffmpeg로 합성하는 스크립트 생성 및 실행"
---

# source-command-assemble

Use this skill when the user asks to run the migrated source command `assemble`.

## Command Template

# /assemble — ffmpeg 영상 합성

사용법: `/assemble [곡 폴더 경로]`

## 수행
1. 결과물 폴더 구조 확인:
```
결과물/YYYYMMDD-곡제목/
├── music/곡제목_final.mp3
├── video/scene01.mp4, scene02.mp4, ...
├── subtitle/곡제목.ass
```

2. 영상 클립 concat 리스트 생성 (video/concat.txt)
3. ffmpeg 명령어 생성 및 실행:

### 롱폼 (4분 풀버전)
```bash
# 1. 영상 클립 연결
ffmpeg -f concat -safe 0 -i video/concat.txt -c:v libx264 -pix_fmt yuv420p video/combined.mp4

# 2. 오디오 합성
ffmpeg -i video/combined.mp4 -i music/곡제목_final.mp3 -c:v copy -c:a aac -shortest video/with_audio.mp4

# 3. 자막 입히기
ffmpeg -i video/with_audio.mp4 -vf "ass=subtitle/곡제목.ass" -c:a copy video/곡제목_longform_final.mp4
```

### 쇼츠 (50초 컷)
```bash
# 하이라이트 구간 추출 (Chorus 시작점 기준)
ffmpeg -i video/곡제목_longform_final.mp4 -ss [시작] -t 50 -c:v libx264 -c:a aac video/곡제목_shorts_final.mp4
```

4. 영상 클립 길이가 mp3보다 짧으면:
   - 마지막 클립을 루프하거나
   - 정지 프레임으로 연장
   - 또는 추가 Veo 3 클립 생성 안내

5. 최종 파일:
   - `video/곡제목_longform_final.mp4` (4분 풀버전)
   - `video/곡제목_shorts_final.mp4` (50초 쇼츠)
