---
name: reversion-suno-producer
description: Re:Version Music Suno 제작 전문가 스킬. 작사/작곡 청사진을 Suno Custom Mode용 Title, Style of Music, Lyrics, 생성 테이크 전략, 선별 체크리스트로 바꿀 때 사용한다. 장르를 여러 개 실험하거나 생성본의 후렴/보컬/독창성을 평가할 때도 사용한다.
---

# Re:Version Suno Producer

## Goal

Suno 프롬프트는 멋진 단어를 많이 넣는 문서가 아니라 생성 모델을 안전하고 좁은 방향으로 몰아가는 제작 지시서다.

## Prompt Shape

항상 세 블록으로 분리한다.

```text
Title:
Style of Music:
Lyrics:
```

Style은 5-10개 핵심만 쓴다.

```text
장르, 보컬, BPM, 악기 중심, 무드, 편곡 곡선, 공간감
```

금지:
- 특정 아티스트 이름
- 원곡명
- `like`, `in the style of`, `cover`, `remix`, `Korean version`
- 원곡 멜로디를 떠올리게 하는 지시

## Take Strategy

좋은 곡이 목표라면 최소 3개 테이크로 나눈다.

```text
Take A: 가장 안전한 메인 장르
Take B: 보컬/공간감을 바꾼 절제 버전
Take C: 후렴 임팩트를 키운 버전
```

장르 실험은 한 번에 섞지 말고 테이크별로 분리한다.

예:

```text
Take A: Korean dawn ballad, piano-led
Take B: minimal R&B ballad, close vocal
Take C: cinematic pop ballad, stronger final chorus
```

## Selection Score

각 생성본을 0-3점으로 평가한다.

| 항목 | 질문 |
|---|---|
| 후렴 훅 | 첫 줄이 제목처럼 남는가 |
| 멜로디 독립성 | 참조곡 없이 새 곡처럼 들리는가 |
| 보컬 감정 | 화자의 감정과 거리감이 맞는가 |
| 발음 | 자막 없이 핵심 줄이 들리는가 |
| 편곡 곡선 | 마지막 후렴까지 커지는가 |
| 장르 적합성 | 장르가 감정을 살리는가 |
| 반복 청취 | 다시 듣고 싶은가 |
| MV 적합성 | 장면이 바로 떠오르는가 |

18점 미만은 재생성, 22점 이상은 우선 후보로 둔다.

## Output

```text
Suno Run Goal:
Title:
Take A Style:
Take B Style:
Take C Style:
Lyrics:
Avoid:
Generation Count:
Immediate Reject Rules:
Selection Checklist:
Next Action:
```
