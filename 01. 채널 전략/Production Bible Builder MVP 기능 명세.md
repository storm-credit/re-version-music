---
type: feature-spec
status: active
created: 2026-05-14
source_template: 웹앱 기능 명세 템플릿
---

# Production Bible Builder MVP 기능 명세

## 기능명

Production Bible Builder MVP

## 목적

곡별로 흩어진 가사, Suno 프롬프트, 화자/캐릭터 시트, 영상 패키지, 썸네일, 발행 문구를 하나의 Complete Production Bible 초안으로 묶는다. 웹앱 구현 전 P0 단계에서는 Markdown 생성/파싱 규칙을 먼저 확정한다.

## 사용자

```text
주 사용자: 오케스트라 디렉터, 프로덕션 바이블 빌더
보조 사용자: Suno 음악감독, 캐릭터시트 디렉터, MV 디렉터, 안전 리뷰어
```

## 입력 데이터

| 필드 | 출처 | 필수 |
|---|---|---|
| 곡 ID/제목/유형 | 오케스트라 인테이크 | 필수 |
| 감정 원형/변환축 | 딥 오케스트라 회의록 | 필수 |
| 승인 가사 | 가사 디렉터 문서 | 필수 |
| Suno prompt | Suno 최종 프롬프트 패키지 | 필수 |
| 화자/캐릭터 시트 | 캐릭터시트 문서 | 필수 |
| 영상 장면표 | 롱폼 영상 패키지 | 필수 |
| 썸네일 기획 | 썸네일 문서 | 권장 |
| 안전 리뷰 | 업로드 초안 / 안전 보고 | 필수 |

## 출력 데이터

| 산출물 | 저장 위치 | 상태 |
|---|---|---|
| Production Bible Draft | `03. 제작/{유형}/{곡}/12. Complete Production Bible.md` | draft |
| CUT 목록 | Bible 내부 3부 | planned |
| 비디오 prompt 목록 | Bible 내부 4부 | planned |
| 편집 가이드 | Bible 내부 5부 | planned |
| 발행 패키지 | Bible 내부 6부 | conditional |

## 화면 구조

```text
상단: 곡 ID, 제목, 상태, 현재 게이트
좌측: 입력 문서 체크리스트
중앙: Production Bible preview
우측: 누락 항목, 안전 경고, 다음 액션
하단: Generate Draft / Parse Cuts / Export Markdown
```

## 주요 액션

| 버튼/액션 | API 또는 파일 작업 | 성공 결과 |
|---|---|---|
| Generate Bible Draft | 입력 Markdown 병합 | 0부-6부 초안 생성 |
| Parse Cuts | CUT/SHOT 표 파싱 | storyboard_cuts 후보 생성 |
| Export Markdown | 파일 저장 | Bible 문서 경로 기록 |
| Mark Ready For Storyboard | 승인 게이트 갱신 | MV 디렉터 작업 가능 |

## DB 테이블

```text
읽기:
- songs
- emotional_cores
- lyric_versions
- suno_prompts
- characters
- review_gates
- artifacts

쓰기:
- production_bibles
- storyboard_cuts
- storyboard_shots
- prompts
- artifacts

업데이트:
- songs.current_phase
- review_gates.verdict
```

## 승인 게이트

```text
통과 기준:
- 승인 가사와 Suno prompt가 있다.
- 화자/캐릭터 시트가 있다.
- 스토리보드로 변환할 영상 장면표가 있다.
- 공개 위험 문구가 제거되어 있다.

조건부 승인 기준:
- 최종 음원은 없지만 임시 타임코드로 컷 구조 설계 가능.
- 18-21점 Suno 후보로 롱폼 초안 제작 가능.

보류 기준:
- 캐릭터/화자 시트 없음.
- 안전 리뷰 없음.
- 참조곡/IP 복제 위험 문구가 공개 제목/설명에 남아 있음.
- prompt provenance를 기록하지 않음.
```

## 오류 상태

| 오류 | 사용자 메시지 | 복구 방법 |
|---|---|---|
| 승인 가사 없음 | 가사 디렉터 승인안이 없습니다. | 가사 문서 먼저 확정 |
| 캐릭터 시트 없음 | 화자/캐릭터 기준이 잠기지 않았습니다. | 캐릭터시트 디렉터 라운드 실행 |
| 안전 리뷰 없음 | 공개 위험 검토가 없습니다. | 안전 리뷰어 라운드 실행 |
| CUT 파싱 실패 | CUT/SHOT 표 구조가 부족합니다. | MV 디렉터가 표준 CUT 표로 재작성 |

## UX 체크

- [x] 다음 액션이 5초 안에 보인다.
- [x] 복사/업로드/승인 버튼의 결과가 명확하다.
- [x] 원곡/IP 복제 위험을 숨기지 않는다.
- [x] 생성물 경로와 prompt provenance가 남는다.
- [x] 모바일보다 데스크톱 제작 효율을 우선한다.

## 구현 순서

1. P0: Markdown 기반 수동 생성 규칙 확정.
2. P1: 로컬 script로 Bible Draft 생성.
3. P1: CUT/SHOT 파서 구현.
4. P2: 웹앱 버튼 연결.
5. P2: Prompt Board와 Video Clip Board로 확장.
