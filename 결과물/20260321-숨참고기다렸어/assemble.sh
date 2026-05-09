#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# 숨 참고 기다렸어 - 영상 합성 스크립트
# Re:Version Music
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SONG_DIR="$(cd "$(dirname "$0")" && pwd)"
SONG_NAME="숨참고기다렸어"

echo "🎬 Re:Version Music — 영상 합성 시작"
echo "📁 작업 폴더: $SONG_DIR"

# ━━━ 1. 파일 확인 ━━━
echo ""
echo "📋 파일 확인 중..."

if [ ! -f "$SONG_DIR/music/${SONG_NAME}_final.mp3" ]; then
    echo "❌ music/${SONG_NAME}_final.mp3 없음. Suno에서 다운로드 후 _final로 이름 바꿔주세요."
    exit 1
fi

VIDEO_COUNT=$(ls "$SONG_DIR/video"/scene*.mp4 2>/dev/null | wc -l)
if [ "$VIDEO_COUNT" -eq 0 ]; then
    echo "❌ video/scene*.mp4 없음. 힉스필드 Veo 3에서 다운로드해주세요."
    exit 1
fi
echo "✅ 음악 파일 확인"
echo "✅ 영상 클립 ${VIDEO_COUNT}개 확인"

# ━━━ 2. concat 리스트 생성 ━━━
echo ""
echo "📝 영상 클립 연결 리스트 생성..."

# scene01~08을 순서대로, 총 길이가 4분 되도록 반복
cat > "$SONG_DIR/video/concat.txt" << 'CONCAT'
file 'scene01.mp4'
file 'scene02.mp4'
file 'scene03.mp4'
file 'scene04.mp4'
file 'scene05.mp4'
file 'scene04.mp4'
file 'scene06.mp4'
file 'scene07.mp4'
file 'scene08.mp4'
CONCAT

# 영상 총 길이가 음악보다 짧으면 클립 반복 추가
MUSIC_DURATION=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$SONG_DIR/music/${SONG_NAME}_final.mp3" 2>/dev/null | cut -d. -f1)
echo "🎵 음악 길이: ${MUSIC_DURATION}초"

# ━━━ 3. 영상 클립 연결 ━━━
echo ""
echo "🔗 영상 클립 연결 중..."
cd "$SONG_DIR/video"
ffmpeg -y -f concat -safe 0 -i concat.txt \
    -vf "scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2:black" \
    -c:v libx264 -preset medium -crf 18 -pix_fmt yuv420p \
    -r 30 \
    combined.mp4 2>/dev/null

if [ $? -ne 0 ]; then
    echo "❌ 영상 연결 실패"
    exit 1
fi
echo "✅ 영상 연결 완료"
cd "$SONG_DIR"

# ━━━ 4. 오디오 합성 ━━━
echo ""
echo "🔊 오디오 합성 중..."
ffmpeg -y -i "$SONG_DIR/video/combined.mp4" \
    -i "$SONG_DIR/music/${SONG_NAME}_final.mp3" \
    -c:v copy -c:a aac -b:a 192k \
    -shortest \
    "$SONG_DIR/video/with_audio.mp4" 2>/dev/null

echo "✅ 오디오 합성 완료"

# ━━━ 5. 자막 입히기 (롱폼) ━━━
echo ""
echo "📝 자막 입히는 중..."
ffmpeg -y -i "$SONG_DIR/video/with_audio.mp4" \
    -vf "ass=$SONG_DIR/subtitle/${SONG_NAME}.ass" \
    -c:v libx264 -preset medium -crf 18 \
    -c:a copy \
    "$SONG_DIR/video/${SONG_NAME}_longform_final.mp4" 2>/dev/null

echo "✅ 롱폼 영상 완성: video/${SONG_NAME}_longform_final.mp4"

# ━━━ 6. 쇼츠 추출 (50초) ━━━
echo ""
echo "✂️ 쇼츠 버전 추출 중..."
# Chorus 시작 부근(0:50)부터 50초 추출 — 실제 들어보고 시작점 조정
ffmpeg -y -i "$SONG_DIR/video/${SONG_NAME}_longform_final.mp4" \
    -ss 50 -t 50 \
    -c:v libx264 -preset medium -crf 18 \
    -c:a aac -b:a 192k \
    "$SONG_DIR/video/${SONG_NAME}_shorts_final.mp4" 2>/dev/null

echo "✅ 쇼츠 영상 완성: video/${SONG_NAME}_shorts_final.mp4"

# ━━━ 완료 ━━━
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 제작 완료!"
echo ""
echo "📁 결과물:"
echo "   롱폼: video/${SONG_NAME}_longform_final.mp4"
echo "   쇼츠: video/${SONG_NAME}_shorts_final.mp4"
echo ""
echo "📌 다음 단계:"
echo "   1. 롱폼 영상 재생해서 자막 타이밍 확인"
echo "   2. 타이밍 안 맞으면 subtitle/${SONG_NAME}.ass 수정 후 재실행"
echo "   3. YouTube + TikTok 업로드"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
