---
type: strategy
status: active
created: 2026-05-14
source_reference: storm-credit/oddengine
---

# ReVersion 웹앱 UX UI 설계

## 0. 화면 정체성

Re:Version 웹앱은 팬에게 보여주는 사이트가 아니라 제작자가 쓰는 운영 화면이다.

첫 화면은 랜딩 페이지가 아니다. `지금 어떤 곡이 어디서 막혔는지`, `어떤 프롬프트를 복사해야 하는지`, `무엇을 승인해야 하는지`가 바로 보여야 한다.

디자인 키워드:

```text
quiet cockpit
song-first
phase-gated
prompt-ready
artifact-aware
```

## 1. UI 톤

OddEngine motif를 유지하되 Re:Version의 감정 채널 톤으로 낮춘다.

| 요소 | 방향 |
|---|---|
| 배경 | 다크 네이비/블랙 계열 운영실 |
| 주요 강조 | 코랄, 스카이블루, 골드 |
| 텍스트 | 고대비, 작은 정보도 읽히는 밀도 |
| 카드 | 반복 항목에만 사용, 페이지 전체를 카드로 띄우지 않음 |
| 버튼 | 실제 액션 중심: 복사, 생성, 업로드, 승인, 보류 |
| 장식 | 오브/그라디언트 장식 금지 |
| 미디어 | 캐릭터 시트, 스토리보드, 오디오, 영상은 실제 미리보기 우선 |

권장 컬러:

```text
background: #070A12
panel: #0D1320
line: #263143
text: #F6F1E8
muted: #9DA8B7
sky: #5B9FD5
coral: #E85A5A
gold: #E8C766
safe: #69C18D
warning: #E8C766
blocked: #E85A5A
```

## 2. 전체 정보 구조

```text
Dashboard
  Song List
  New Song Intake
  Song Workspace
    Orchestra
    Lyrics
    Suno
    Characters
    Production Bible
    Storyboard
    Video
    Review
    Publish
  Settings
```

## 3. Dashboard

목표:

- 오늘 진행할 곡과 막힌 게이트를 보여준다.
- 최근 산출물을 다시 열 수 있게 한다.
- 새 곡을 빠르게 intake한다.

필수 영역:

| 영역 | 내용 |
|---|---|
| Active Songs | 현재 제작 중 곡 3-5개 |
| Gate Alerts | 보류/조건부 승인 항목 |
| Recent Artifacts | 최근 생성된 가사, 프롬프트, 이미지, 영상 |
| Next Actions | 각 곡 다음 액션 |
| Quick Create | 새 곡 intake 버튼 |

메인 CTA:

```text
+ New Song
Open Active Workspace
Review Blocked Gates
```

## 4. New Song Intake

3단계로 충분하다.

### Step 1. 곡 기본 정보

필드:

- 콘텐츠 유형: 번안형 / 답가형 / 팬픽OST형 / 오리지널형
- 목표 포맷: 롱폼 16:9 / 컷다운 파생 / 오디오 우선
- 내부 제목
- 공개 제목 후보
- 영감 원천
- 만들고 싶은 장르 후보

### Step 2. 감정 원형

필드:

- 화자
- 상대
- 사건
- 말하지 못한 문장
- 후렴에서 터질 말
- 절대 쓰면 안 되는 원곡/IP 요소

### Step 3. 생성될 산출물 확인

미리보기:

```text
03. 제작/{유형}/{곡 번호. 제목}/
04. 영상/스크립트/{곡 번호. 제목} 롱폼 영상 패키지.md
04. 영상/썸네일/{곡 번호. 제목} 썸네일 기획.md
05. 발행/업로드기록/{곡 번호. 제목} 업로드 초안.md
```

버튼:

```text
Create Song Workspace
```

## 5. Song Workspace

한 곡의 모든 작업이 모이는 핵심 화면이다.

상단 고정 헤더:

```text
[RV-KR-001] 새벽 세 시의 고백
type: 번안형 | target: longform 16:9 | status: character
current owner: Orchestra Director
[Open Folder] [Export Bible] [Review Gates] [Publish Pack]
```

Phase rail:

```text
A Intake
B Motif
C Emotion
D Lyrics
E Suno
F Character
G Bible
H Video
I Review
J Publish
```

색상:

- 회색: 미시작
- 노랑: 진행 중
- 초록: 승인
- 코랄: 보류
- 파랑: 다음 액션

## 6. Orchestra Board

전문가 상태를 보드로 보여준다.

| 전문가 | 상태 | 산출물 | 다음 액션 |
|---|---|---|---|
| 오케스트라 디렉터 | 진행 | 회의록 | 승인 판단 |
| 모티브 작곡가 | 승인 | 장르 청사진 | Suno로 전달 |
| 가사 디렉터 | 조건부 | 후렴/가사 | 2줄 수정 |
| Suno 음악감독 | 대기 | prompt pack | 가사 확정 후 |
| 캐릭터시트 디렉터 | 진행 | 화자 시트 | 시트 확정 |
| MV 디렉터 | 대기 | storyboard | 캐릭터 후 |
| 안전 리뷰어 | 대기 | risk report | 발행 전 |

버튼:

```text
Run Expert
Attach Output
Approve
Hold
```

## 7. Lyrics + Hook Editor

구성:

- 왼쪽: 가사 버전
- 오른쪽: 감정 원형 / 금지 요소 / 후렴 체크
- 하단: Suno 발음 위험 줄

중요 기능:

- 후렴 첫 줄 pin
- 버전 비교
- 원곡 닮음 위험 표시
- 한국어 발음 난도 체크
- Suno Lyrics 필드로 복사

## 8. Suno Producer Desk

Suno 자동 생성이 아니라 paste-ready desk다.

영역:

| 영역 | 기능 |
|---|---|
| Title | 복사 버튼 |
| Style of Music | 복사 버튼, 장르 키워드 체크 |
| Lyrics | 복사 버튼, 섹션 태그 표시 |
| Negative Prompt | 복사 버튼 |
| Settings | Weirdness / Style Influence 메모 |
| Take Log | mp3 업로드, 점수, 선택 여부 |

선택 체크:

- 후렴이 기억나는가
- 보컬이 과하게 특정 가수를 닮지 않았는가
- 원곡 멜로디가 떠오르지 않는가
- 롱폼 MV 감정곡선과 맞는가

## 9. Character / Speaker Sheet

Haechi Bible처럼 곡별 시각 기준을 잠그는 화면이다.

번안형/답가형:

- 화자 시트
- 부재한 상대 시트
- 반복 소품
- 컬러/조명
- 금지 이미지

팬픽OST형/오리지널형:

- 주인공 캐릭터 시트
- 상대/동반자 시트
- 세계관 소품
- 감정 표정
- 의상/포즈

화면 기능:

- 이미지 prompt 복사
- reference image 업로드
- 승인된 얼굴/의상 anchor 표시
- 스토리보드로 전달할 continuity note 생성

## 10. Production Bible Builder

구성:

```text
0부 제작 개요
1부 캐릭터/화자 시트
2부 Suno 음악 프롬프트
3부 스토리보드 이미지 프롬프트
4부 비디오 프롬프트
5부 편집 가이드
6부 발행 패키지
```

버튼:

```text
Generate Bible Draft
Parse Cuts
Export Markdown
Export PDF
```

## 11. Storyboard Board

Haechi 예시처럼 컷별 표를 생성하고 미리본다.

화면:

- CUT 카드 9개
- 각 CUT 내부 SHOT rows
- Start Frame / End Frame prompt
- Camera / Action / SFX / Music sync
- Director's Intent
- Transition

기능:

- CUT별 image prompt 복사
- storyboard sheet 이미지 업로드
- 누락된 CUT 경고
- 캐릭터 일관성 체크

## 12. Video Prompt Board

비디오 생성 도구용 15초 단위 프롬프트 보드.

필수 컬럼:

| CUT | Time | Engine | Prompt | Ref Image | Clip | Status |
|---|---|---|---|---|---|---|

기능:

- Morphic / Seedance / Veo prompt 복사
- SFX only 체크
- BGM 금지 문구 자동 삽입
- mp4 업로드
- 클립 길이 체크

## 13. Review Gate

보여줄 것:

- Song Quality
- Emotional Core
- Transformation
- Lyrics
- Suno
- Character
- Storyboard
- Safety
- Publish

각 게이트는 `승인 / 조건부 승인 / 보류`만 허용한다.

보류는 반드시 수정 지시를 가진다.

## 14. Publish

필드:

- YouTube 제목
- 설명 첫 문단
- 오리지널 제작 원칙 문구
- 태그
- 썸네일 문구
- 고정댓글
- 발행 후 측정 지표

버튼:

```text
Copy Title
Copy Description
Copy Hashtags
Mark Released
```

## 15. UX 승인 기준

웹 화면이 통과하려면:

- 곡 하나를 열면 다음 액션이 5초 안에 보인다.
- Suno/이미지/비디오 프롬프트가 한 번에 복사된다.
- 캐릭터 시트 없이 스토리보드 생성으로 넘어가지 않는다.
- 안전 리뷰 없이 발행으로 넘어가지 않는다.
- 모든 생성물은 파일 경로와 prompt provenance를 가진다.
- 화면이 예쁜 것보다 반복 제작이 빠르다.
