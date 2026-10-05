# 천사데이 포스터 모음

제14회 천사데이 찬스바자회(2026년 10월 17일 토요일, 홀리씨즈교회) 포스터 시안 모음 페이지입니다.

- 페이지: https://yyc9920.github.io/cheonsaday-dday/
- 맨 위 D-day는 접속한 날(한국 시간)에 맞춰 자동으로 바뀌고, 옆 영상도 그날의 D-day 영상으로 바뀝니다. `?today=2026-10-17`처럼 붙이면 그 날짜로 볼 수 있습니다.
- 포스터 55안(v1~v7, 스타일 8가지)은 마우스를 올리면 움직이고, 누르면 전체 화면으로 봅니다(←·→ 넘기기, Esc 닫기).
- 소리(BGM·효과음, 나레이션)는 위 막대에서 켭니다. 영상 파일은 무음이고, 소리는 따로 받아 영상 시각에 맞춰 재생합니다.

| 폴더 | 내용 |
|---|---|
| `v/` | 포스터 영상(1080×1512, 8초, 무음) · `dday-<숫자>.mp4` = D-day 영상(18초, 숫자 0 = D-DAY) |
| `s/` | 카드에 보이는 완성 화면(마지막 프레임) |
| `a/` | 소리 — `<id>.mp3` 고른 안의 BGM+효과음, `bgm-<스타일>.mp3` 나머지 안의 BGM, `narr8.mp3` 8초 나레이션, `dday-*.mp3` D-day 영상용 |

D-day 영상 원본 파일(나레이션 포함, 1080×1920/1080×1512)은 [Releases › videos-v1](https://github.com/yyc9920/cheonsaday-dday/releases/tag/videos-v1)에 있습니다.
`motion.html`은 D-day 영상의 원본 애니메이션입니다(`motion.html?v=1&ratio=poster&d=7`).

만드는 스크립트는 작업 폴더 `bazaar-motion/gallery/`에 있습니다(`catalog.py` → `render.py` · `audio.py` · `dday.sh` → `site.py --sync <이 저장소>`).
