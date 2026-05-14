---
name: reversion-mv-director
description: Re:Version Music MV 전문가 스킬. 최종 가사와 Suno 방향을 바탕으로 YouTube 롱폼 16:9 리릭 MV, 장면표, 썸네일, Veo/Higgsfield 영상 프롬프트, 자막 톤을 만들 때 사용한다. 짧은 컷다운보다 롱폼 감상용 영상이 우선일 때 특히 사용한다.
---

# Re:Version MV Director

## Priority

롱폼 MV는 노래를 돋보이게 해야 한다. 영상이 곡보다 앞서면 실패다.

우선순위:

1. 후렴 감정이 보인다.
2. 가사가 읽힌다.
3. 장면이 반복되어도 지루하지 않다.
4. 원곡/IP 영상처럼 보이지 않는다.
5. 썸네일이 오리지널 곡처럼 보인다.

## Longform Shape

기본은 16:9, 1920x1080, 풀버전 리릭 MV다.

| 구간 | 영상 기능 |
|---|---|
| Intro | 감정 장소를 고정 |
| Verse 1 | 사건의 흔적 |
| Pre-Chorus | 긴장 상승 |
| Chorus 1 | 대표 장면과 후렴 각인 |
| Verse 2 | 같은 감정의 다른 증거 |
| Bridge | 가장 낮거나 솔직한 장면 |
| Final Chorus | 화면 밀도 최고점 |
| Outro | 여운 |

## Storyboard Sheet

곡별 MV는 최소한 컷별 스토리보드 시트를 만든다. `Haechi's Wonderland`처럼 15초 단위 컷을 쓰면 제작과 검수가 가장 쉽다.

권장 구조:

```text
CUT01 0:00-0:15
CUT02 0:15-0:30
CUT03 0:30-0:45
...
```

각 CUT 스토리보드는 아래 컬럼을 반드시 갖는다.

```text
SHOT / TIME
START FRAME
END FRAME
CAMERA / MOVEMENT
ACTION / DIRECTION
DIALOGUE / LYRICS
SFX
MUSIC
DIRECTOR'S INTENT
TRANSITION
```

스토리보드 이미지 생성 프롬프트는 `table sheet`를 명시한다. 단일 파노라마로 나오지 않게 `exactly N separate rows`, `start/end thumbnail cells`, `visible grid lines`를 적는다.

## Scene Prompt Rules

프롬프트에는 반드시 넣는다.

- subject
- location
- emotional action
- color palette
- camera movement
- ratio `horizontal 16:9`
- duration
- negative safety: no logos, no celebrity likeness, no official MV reference

## Thumbnail Rules

롱폼 썸네일은 사물 1개, 감정 1개, 문구 1개로 좁힌다.

```text
Main object:
Emotion:
Text:
Empty space:
Color:
Risk to avoid:
```

## Subtitle Rules

- 한 화면 1-2줄.
- 후렴 첫 줄만 강조.
- 얼굴, 손, 핵심 사물을 가리지 않는다.
- 자막 효과보다 가독성이 우선이다.

## Output

```text
MV Format:
Visual Thesis:
Color Palette:
Scene Table:
Storyboard Sheet Prompts:
Veo/Higgsfield Prompts:
Subtitle Style:
Thumbnail Plan:
Safety Notes:
Edit Checklist:
```
