---
name: reversion-web-platform-architect
description: Re:Version Music 웹 플랫폼 아키텍트 스킬. 사용자가 웹화면, 시스템 아키텍처, DB, UX/UI, 제작 대시보드, Song Workspace, OddEngine 모티브, Next.js/FastAPI/SQLite 설계, 에이전트 운영 화면을 요구할 때 사용한다. Obsidian 제작 볼트를 곡별 롱폼 MV 제작 웹앱으로 확장하는 설계를 만든다.
---

# Reversion Web Platform Architect

## Overview

이 스킬은 Re:Version Music을 문서 볼트에서 제작 운영 웹앱으로 확장할 때 사용한다. 기준은 `좋은 노래 우선`이고, OddEngine의 engine/cockpit/phase-gate 문법은 가져오되 곡별 롱폼 MV 제작에 맞게 변환한다.

## Core Rule

웹앱은 랜딩 페이지가 아니다. 첫 화면은 제작자가 오늘 해야 할 작업, 막힌 승인 게이트, 복사할 프롬프트, 업로드할 산출물을 바로 보여주는 `production cockpit`이어야 한다.

## OddEngine Motif

가져올 것:

- `1 track = 1 workspace`
- manifest / registry / outputs 기반 제작 추적
- phase gate와 승인/보류 상태
- prompt board와 원클릭 복사
- character / object / light continuity
- 외부 수동 도구는 paste pack + upload로 처리

바꿀 것:

- `track`을 `song`으로 바꾼다.
- `MV-first`를 `song-first longform MV`로 바꾼다.
- 짧은 컷 중심을 곡별 `Complete Production Bible` 중심으로 바꾼다.
- 세계관보다 후렴, 가사, Suno 생성 퀄리티를 먼저 통과시킨다.

## Output Order

1. 제품 정의: 이 웹앱이 누구의 어떤 반복 작업을 줄이는지.
2. 시스템 아키텍처: frontend, backend, DB, file storage, job queue, external handoff.
3. DB 모델: songs, lyrics, prompts, characters, storyboard cuts, assets, review gates, publish records.
4. UX/UI: Dashboard, New Song Intake, Song Workspace, Suno Desk, Character Sheet, Storyboard, Video, Review, Publish.
5. Phase gates: 어떤 단계가 승인되어야 다음 단계로 갈 수 있는지.
6. Model routing: 어떤 작업에 고급 모델/저렴한 모델/이미지/비디오 모델을 쓸지.
7. Implementation sequence: P0 문서형 MVP, P1 로컬 앱, P2 자동화.

## Required Screens

최소 화면:

| Screen | Purpose |
|---|---|
| Dashboard | 현재 곡, 보류 게이트, 최근 산출물 |
| New Song Intake | 유형, 영감 원천, 감정 원형 입력 |
| Song Workspace | 한 곡의 모든 phase와 산출물 |
| Orchestra Board | 전문가 상태, 실행 결과, 승인 판단 |
| Lyrics Editor | 후렴 pin, 가사 버전, Suno 발음 위험 |
| Suno Producer Desk | Title, Style, Lyrics, Negative, take log |
| Character Sheet Board | 화자/캐릭터/소품/금지 이미지 |
| Production Bible Builder | 곡별 통합 바이블 생성/파싱 |
| Storyboard Board | CUT/SHOT 표와 이미지 prompt |
| Video Prompt Board | 15초 클립 prompt, ref image, mp4 업로드 |
| Review Gate | 승인/조건부 승인/보류 |
| Publish Pack | 제목, 설명, 태그, 성과 기록 |

## Data Rules

P0는 하이브리드로 설계한다.

```text
SQLite = 상태, 관계, 검색, job history
Markdown/YAML = 제작자가 읽는 최종 문서와 바이블
Filesystem = mp3, png, mp4, pdf, docx
Git = 변경 기록과 푸시
```

모든 산출물은 provenance를 가진다.

```text
artifact -> source prompt -> model/engine -> song -> review gate
```

## UX Rules

- 다음 액션이 5초 안에 보여야 한다.
- 버튼은 실제 액션만 둔다: copy, generate, upload, approve, hold, export.
- 캐릭터 시트 없이 스토리보드 단계로 넘어가지 않는다.
- 안전 리뷰 없이 발행 단계로 넘어가지 않는다.
- 화면은 운영 도구처럼 조용하고 밀도 있게 만든다.
- 카드 중첩, 장식용 그라디언트, 마케팅형 hero는 피한다.

## Model Routing

| Task | Model tier |
|---|---|
| Orchestra approval | frontier high reasoning |
| Motif/composition | frontier creative |
| Lyrics revision | writing specialist |
| Suno prompt | music prompt specialist |
| Character/storyboard prompt | image/video prompt specialist |
| Safety review | strict review |
| Metadata/indexing | small fast model |

## Approval

웹 플랫폼 설계는 아래 기준을 통과해야 한다.

- 음악 제작 파이프라인을 흐리지 않는다.
- 곡별 Production Bible을 중심 산출물로 둔다.
- DB와 파일의 책임이 분리되어 있다.
- 외부 수동 생성 도구를 현실적으로 다룬다.
- 저작권/브랜드 위험을 UI에서 숨기지 않는다.
