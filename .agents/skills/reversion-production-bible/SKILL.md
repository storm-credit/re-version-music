---
name: reversion-production-bible
description: Re:Version Music 곡별 Complete Production Bible 제작 스킬. 사용자가 한 곡을 실제 제작 가능한 패키지로 만들고 싶을 때 사용한다. 캐릭터/화자 시트, Suno 음악 프롬프트, 컷별 스토리보드 시트 프롬프트, 비디오 생성 프롬프트, CapCut 편집 가이드, 업로드 메타데이터를 한 문서로 통합한다. Haechi's Wonderland 같은 9 CUT x 15초 MV 바이블 구조를 곡별 표준으로 만들 때 사용한다.
---

# ReVersion Production Bible

## Purpose

한 곡은 Suno 프롬프트 하나로 끝나지 않는다. 곡별 Production Bible은 음악, 화자/캐릭터, 이미지, 영상, 편집을 같은 감정 원형으로 묶는 제작 지휘서다.

## Required Order

1. 캐릭터/화자 시트를 먼저 만든다.
2. 음악 구조와 Suno 테이크를 확정한다.
3. 컷별 스토리보드 시트를 만든다.
4. 컷별 비디오 프롬프트를 만든다.
5. 편집 싱크와 렌더링 가이드를 만든다.

캐릭터/화자 일관성은 전체 MV 퀄리티의 기준이다. 팬픽OST형은 캐릭터 시트가 필수이고, 번안형/답가형도 최소한 화자 시트를 만든다.

## Bible Structure

```text
Title:
Subtitle:
Runtime:
Format:
Production Tools:
Workflow:

1부. 캐릭터/화자 시트
2부. 음악 프롬프트
3부. 스토리보드 이미지 프롬프트
4부. 비디오 프롬프트
5부. 편집 가이드
6부. 발행 패키지
```

## Character Sheet Standard

인물형:

```text
이름:
나이/역할:
감정 기능:
말하지 못한 문장:
외형 키:
의상:
컬러 팔레트:
표정 6개:
전신 3면:
포즈 5개:
소품:
보컬 톤:
금지 요소:
```

크리처/상징형:

```text
이름:
기원:
크기:
성격:
형태 변화:
능력:
주인공과의 관계:
컬러 팔레트:
표정/포즈:
금지 요소:
```

## Storyboard Sheet Standard

컷 하나당 스토리보드 시트 하나를 만든다.

권장:

```text
9 CUT x 15초 = 2:15
또는 곡 길이에 맞춰 6-10 CUT
```

각 CUT 시트는 아래 컬럼을 가진다.

| Column | Purpose |
|---|---|
| SHOT / TIME | 샷 번호와 타임코드 |
| START FRAME | 시작 썸네일 설명 |
| END FRAME | 종료 썸네일 설명 |
| CAMERA / MOVEMENT | 카메라 움직임 |
| ACTION / DIRECTION | 연기/장면 지시 |
| DIALOGUE / LYRICS | 가사 또는 무대사 |
| SFX | 영상 자체 효과음 |
| MUSIC | Suno 음악의 해당 구간 |

각 CUT에는 `DIRECTOR'S INTENT`와 `TRANSITION`을 붙인다.

## Video Prompt Standard

스토리보드 이미지 프롬프트와 비디오 프롬프트를 분리한다.

비디오 프롬프트는 반드시 포함한다.

```text
CUT number and time
style
colors
shot-by-shot timing
character lock
camera moves
SFX only / music in post
negative prompt
output format
```

원칙:
- 영상 생성 프롬프트에는 배경음악을 넣지 않는다.
- 영상은 SFX only로 만들고, Suno 음악은 편집 단계에서 붙인다.
- 가사 자막이 필요한 리릭 MV가 아니라면 비디오 자체에는 텍스트를 넣지 않는다.

## Music Section

Suno는 최소 2-3개 버전을 둔다.

```text
Master:
Variation A:
Variation B:
Negative Prompt:
Settings:
Selection Criteria:
```

참조곡이나 작곡가 이름을 복제 지시로 쓰지 않는다. 필요하면 내부 분석명으로만 두고, Suno 입력은 장르/악기/무드/구조로 바꾼다.

## Editing Guide

반드시 적는다.

```text
총 영상 길이:
음악 길이:
컷별 타임라인:
드롭/클라이맥스 싱크:
SFX와 음악 볼륨:
컬러 그레이딩:
최종 렌더링:
체크리스트:
```

## Output

```text
Production Bible Title:
Runtime Plan:
Character Sheet Plan:
Suno Plan:
Storyboard Cut List:
Video Prompt Plan:
Editing Sync:
Safety Notes:
Files To Create:
Next Action:
```
