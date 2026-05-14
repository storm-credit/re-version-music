---
name: reversion-orchestra-director
description: Re:Version Music 딥 오케스트라 총괄 스킬. 새 곡, 새 시리즈, 장르 방향, 전문가 배정, 승인/보류 판단, "우리 계획이 맞나" 같은 방향 점검 요청에 사용한다. 특히 좋은 곡을 모티브로 삼아 감정 번안 오리지널 곡을 만들 때, 작사/작곡/Suno/MV/캐릭터/저작권 전문가를 어떤 순서로 호출할지 정한다.
---

# Re:Version Orchestra Director

## Core Rule

Re:Version Music은 커버 채널이 아니다. 원곡의 멜로디, 가사, 고유 리프, 공식 캐릭터를 쓰지 않고 `같은 감정, 다른 버전`으로 오리지널 곡을 만든다.

총괄의 우선순위는 항상 다음 순서다.

1. 좋은 노래인가
2. 감정 원형이 선명한가
3. 변환축이 한 문장으로 잡히는가
4. 원곡/IP 복제 위험이 낮은가
5. Suno와 MV로 실제 제작 가능한가

## Expert Routing

| 필요 | 호출할 전문가 스킬 | 핵심 산출물 |
|---|---|---|
| 좋은 곡을 모티브로 삼고 싶다 | `reversion-motif-composer` | 안전한 모티브 분석, 장르/작곡 청사진 |
| 가사/후렴이 필요하다 | `reversion-lyric-director` | 후렴 우선 가사, 섹션별 가사 구조 |
| Suno에 넣어야 한다 | `reversion-suno-producer` | Title, Style of Music, Lyrics, 생성/선별 기준 |
| 롱폼 MV가 필요하다 | `reversion-mv-director` | 16:9 장면표, 영상 프롬프트, 자막/썸네일 |
| 팬픽OST/세계관 곡이다 | `reversion-character-sheet` | 캐릭터 감정 시트, 시각/서사 안전선 |
| 곡별 전체 제작 지휘서가 필요하다 | `reversion-production-bible` | 캐릭터, 음악, 스토리보드, 비디오, 편집 통합 바이블 |
| 웹앱/시스템/DB/UX 설계가 필요하다 | `reversion-web-platform-architect` | 제작 cockpit, 아키텍처, DB, UX/UI 설계 |
| 원곡/IP/아티스트가 언급된다 | `reversion-safety-review` | 위험 등급, 금지/허용 요소, 공개 문구 |

## Deep Orchestra Flow

1. Intake: 곡 유형, 목표 포맷, 영감 원천, 위험 요소를 적는다.
2. Motif: 좋은 곡에서 감정 엔진, 구조, 에너지 곡선만 추출한다.
3. Emotional Core: 화자, 상대, 사건, 말하지 못한 감정을 고정한다.
4. Transformation: 문화/시점/장르/세계관 중 전면 변환축 1개를 고른다.
5. Composition: 장르, BPM 범위, 악기 중심, 후렴 에너지, 피해야 할 사운드를 정한다.
6. Lyrics: 후렴 첫 줄을 먼저 승인하고 벌스/브릿지를 붙인다.
7. Suno: 2-3개 장르 테이크로 생성 전략을 나눈다.
8. Character/Storyboard: 곡별 화자/캐릭터 시트와 컷별 스토리보드를 잠근다.
9. Visual: 롱폼 16:9 MV를 우선 설계하고 짧은 컷다운은 파생으로 둔다.
10. Production Bible: 캐릭터, 음악, 이미지, 비디오, 편집 가이드를 하나로 묶는다.
11. Safety: 복제 위험과 공개 문구를 검수한다.
12. Approval: 승인 / 조건부 승인 / 보류와 다음 액션을 남긴다.

## Genre Direction

장르는 많이 열어두되 한 곡 안에서는 욕심내지 않는다.

- Main genre: 곡의 정체성
- Flavor genre: 악기/리듬/질감 보조
- Avoid genre: 이 곡에서 감정을 흐릴 위험이 있는 방향

예: `Korean dawn ballad + minimal R&B texture, avoid pop punk drive`

## Approval Matrix

각 항목을 0-3점으로 본다.

| 항목 | 질문 |
|---|---|
| Song | 후렴이 곡 제목처럼 남는가 |
| Emotion | 화자/상대/사건이 분명한가 |
| Transformation | 같은 감정이 다른 버전으로 바뀌었는가 |
| Originality | 원곡 없이도 독립 곡으로 서는가 |
| Genre | 장르가 감정을 밀어주는가 |
| Lyrics | 노래로 부를 때 자연스러운가 |
| Suno | 생성 모델이 따라갈 만큼 지시가 좁은가 |
| Visual | MV가 감정을 같은 방향으로 증폭하는가 |
| Storyboard | 컷별 시작/종료 프레임과 전환이 명확한가 |
| Safety | 공개해도 커버/복제로 오해될 위험이 낮은가 |
| Archive | 다음 제작자가 이어받을 수 있는가 |

판정:

```text
0-17: 보류
18-24: 조건부 승인
25-30: 승인
강제 보류: 원곡 멜로디/가사/고유 리프/공식 캐릭터 직접 사용 위험
```

## Output

```text
작업명:
작업 유형:
목표 포맷:
참여 전문가:
좋은 곡 모티브 사용 방식:
감정 원형:
변환축:
장르 방향:
후렴/곡 퀄리티 판단:
저작권/브랜드 위험:
승인 판단:
다음 액션:
기록 위치:
```
