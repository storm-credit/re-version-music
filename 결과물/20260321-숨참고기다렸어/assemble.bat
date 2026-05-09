@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "BASE=C:\Users\Storm Credit\Desktop\Music\re-version-music\결과물\20260321-숨참고기다렸어"
set "VID=%BASE%\video"
set "IMG=%BASE%\images"
set "AUDIO=C:\Users\Storm Credit\Desktop\Music\re-version-music\07. 음원\Held My Breath.mp3"
set "OUTPUT=%BASE%\Held_My_Breath_MV.mp4"
set "TEMP=%BASE%\temp"

if not exist "%TEMP%" mkdir "%TEMP%"

echo === Step 1: Preparing segments ===

REM Segment 1: Scene 1 video (0:00-0:11, 11s) - loop the 4s clip
ffmpeg -y -stream_loop 2 -i "%VID%\1.mp4" -t 11 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,zoompan=z='min(zoom+0.0005,1.05)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1920x1080:fps=24" -c:v libx264 -preset fast -an "%TEMP%\seg01.mp4"

REM Segment 2: Scene 2 video (0:11-0:17, 6s) - loop
ffmpeg -y -stream_loop 1 -i "%VID%\2.mp4" -t 6 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg02.mp4"

REM Segment 3: Scene 3 image (0:17-0:29, 12s) - Ken Burns zoom in
ffmpeg -y -loop 1 -i "%IMG%\3.png" -t 12 -vf "scale=2400:-1,zoompan=z='min(zoom+0.0008,1.15)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=288:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg03.mp4"

REM Segment 4: Scene 4 image (0:29-0:35, 6s) - Ken Burns slow zoom
ffmpeg -y -loop 1 -i "%IMG%\4.png" -t 6 -vf "scale=2400:-1,zoompan=z='min(zoom+0.001,1.1)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=144:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg04.mp4"

REM Segment 5: Scene 5 image (0:35-0:48, 13s) - Ken Burns slow pan
ffmpeg -y -loop 1 -i "%IMG%\5.png" -t 13 -vf "scale=2400:-1,zoompan=z='1.1':x='if(eq(on,1),0,x+0.5)':y='ih/2-(ih/zoom/2)':d=312:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg05.mp4"

REM Segment 6: Scene 6 video (0:48-1:03, 15s) - loop
ffmpeg -y -stream_loop 3 -i "%VID%\6.mp4" -t 15 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg06.mp4"

REM Segment 7: Scene 7 video (1:03-1:15, 12s) - use 8s clip + loop
ffmpeg -y -stream_loop 1 -i "%VID%\7.mp4" -t 12 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg07.mp4"

REM Segment 8: Scene 8 image (1:15-1:22, 7s) - Ken Burns
ffmpeg -y -loop 1 -i "%IMG%\8.png" -t 7 -vf "scale=2400:-1,zoompan=z='min(zoom+0.001,1.1)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=168:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg08.mp4"

REM Segment 9: Scene 9 video (1:22-1:35, 13s) - loop
ffmpeg -y -stream_loop 3 -i "%VID%\9.mp4" -t 13 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg09.mp4"

REM Segment 10: Scene 10 video (1:35-1:50, 15s) - loop
ffmpeg -y -stream_loop 3 -i "%VID%\10.mp4" -t 15 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg10.mp4"

REM Segment 11: Scene 7 reuse (1:50-2:00, 10s) - different portion
ffmpeg -y -stream_loop 1 -i "%VID%\7.mp4" -ss 2 -t 10 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg11.mp4"

REM Segment 12: Scene 11 video (2:00-2:08, 8s) - loop
ffmpeg -y -stream_loop 2 -i "%VID%\11.mp4" -t 8 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg12.mp4"

REM Segment 13: Scene 12 video (2:08-2:20, 12s) - loop
ffmpeg -y -stream_loop 2 -i "%VID%\12.mp4" -t 12 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg13.mp4"

REM Segment 14: Scene 13 image (2:20-2:27, 7s) - Ken Burns zoom
ffmpeg -y -loop 1 -i "%IMG%\13.png" -t 7 -vf "scale=2400:-1,zoompan=z='min(zoom+0.001,1.1)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=168:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg14.mp4"

REM Segment 15: Scene 14 video (2:27-2:31, 4s)
ffmpeg -y -i "%VID%\14.mp4" -t 4 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg15.mp4"

REM Segment 16: Scene 15 video (2:31-2:46, 15s) - loop
ffmpeg -y -stream_loop 3 -i "%VID%\15.mp4" -t 15 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg16.mp4"

REM Segment 17: Scene 16 image (2:46-2:54, 8s) - Ken Burns
ffmpeg -y -loop 1 -i "%IMG%\16.png" -t 8 -vf "scale=2400:-1,zoompan=z='min(zoom+0.0008,1.1)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=192:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg17.mp4"

REM Segment 18: Scene 17 video (2:54-3:08, 14s) - loop
ffmpeg -y -stream_loop 3 -i "%VID%\17.mp4" -t 14 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg18.mp4"

REM Segment 19: Scene 18 video (3:08-3:22, 14s) - loop
ffmpeg -y -stream_loop 3 -i "%VID%\18.mp4" -t 14 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg19.mp4"

REM Segment 20: Scene 19 image (3:22-3:30, 8s) - Ken Burns
ffmpeg -y -loop 1 -i "%IMG%\19.png" -t 8 -vf "scale=2400:-1,zoompan=z='if(eq(on,1),1.15,zoom-0.0008)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=192:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg20.mp4"

REM Segment 21: Scene 12 reuse (3:30-3:40, 10s)
ffmpeg -y -stream_loop 2 -i "%VID%\12.mp4" -ss 1 -t 10 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg21.mp4"

REM Segment 22: Scene 13 reuse image (3:40-3:47, 7s) - Ken Burns zoom out
ffmpeg -y -loop 1 -i "%IMG%\13.png" -t 7 -vf "scale=2400:-1,zoompan=z='if(eq(on,1),1.15,zoom-0.001)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=168:s=1920x1080:fps=24" -c:v libx264 -preset fast -pix_fmt yuv420p "%TEMP%\seg22.mp4"

REM Segment 23: Scene 15 reuse (3:47-3:55, 8s)
ffmpeg -y -stream_loop 1 -i "%VID%\15.mp4" -ss 1 -t 8 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg23.mp4"

REM Segment 24: Scene 17 reuse (3:55-4:03, 8s)
ffmpeg -y -stream_loop 1 -i "%VID%\17.mp4" -ss 1 -t 8 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset fast -an "%TEMP%\seg24.mp4"

REM Segment 25: Scene 20 video (4:03-4:13, 10s) - loop + fade out
ffmpeg -y -stream_loop 2 -i "%VID%\20.mp4" -t 10 -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,fade=t=out:st=8:d=2" -c:v libx264 -preset fast -an "%TEMP%\seg25.mp4"

echo === Step 2: Creating concat list ===

(
echo file 'seg01.mp4'
echo file 'seg02.mp4'
echo file 'seg03.mp4'
echo file 'seg04.mp4'
echo file 'seg05.mp4'
echo file 'seg06.mp4'
echo file 'seg07.mp4'
echo file 'seg08.mp4'
echo file 'seg09.mp4'
echo file 'seg10.mp4'
echo file 'seg11.mp4'
echo file 'seg12.mp4'
echo file 'seg13.mp4'
echo file 'seg14.mp4'
echo file 'seg15.mp4'
echo file 'seg16.mp4'
echo file 'seg17.mp4'
echo file 'seg18.mp4'
echo file 'seg19.mp4'
echo file 'seg20.mp4'
echo file 'seg21.mp4'
echo file 'seg22.mp4'
echo file 'seg23.mp4'
echo file 'seg24.mp4'
echo file 'seg25.mp4'
) > "%TEMP%\concat.txt"

echo === Step 3: Concatenating all segments ===

ffmpeg -y -f concat -safe 0 -i "%TEMP%\concat.txt" -c:v libx264 -preset fast -crf 18 "%TEMP%\video_only.mp4"

echo === Step 4: Adding audio ===

ffmpeg -y -i "%TEMP%\video_only.mp4" -i "%AUDIO%" -c:v copy -c:a aac -b:a 192k -shortest -map 0:v:0 -map 1:a:0 "%OUTPUT%"

echo === DONE ===
echo Output: %OUTPUT%

pause
