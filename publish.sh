#!/bin/zsh
# 천사데이 D-day 사이트 올리기 (GitHub 계정 yyc9920)
#   zsh publish.sh site     # 공개 저장소 만들기 + GitHub Pages 켜기
#   zsh publish.sh videos   # 영상 32개를 Releases(videos-v1)에 올리기 — 렌더링이 다 끝난 뒤
set -e
cd "$(dirname "$0")"
REPO=yyc9920/cheonsaday-dday
VIDS=../bazaar-motion/video/D-day/site
case "$1" in
  site)
    [ -d .git ] || git init -q -b main
    git add index.html motion.html README.md .nojekyll .gitignore publish.sh
    git commit -q -m "천사데이 D-day 영상 페이지" || true
    gh repo view $REPO >/dev/null 2>&1 || gh repo create cheonsaday-dday --public --source . --description "제14회 천사데이 찬스바자회 D-day 홍보 영상"
    git remote get-url origin >/dev/null 2>&1 || git remote add origin https://github.com/$REPO.git
    git push -u origin main
    gh api -X POST repos/$REPO/pages -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 || echo "(Pages는 이미 켜져 있음)"
    echo "페이지: https://yyc9920.github.io/cheonsaday-dday/  (처음 켜면 1~2분 걸림)"
    ;;
  videos)
    n=$(ls $VIDS/dday-*.mp4 | wc -l | tr -d ' ')
    [ "$n" = 32 ] || { echo "영상이 $n/32개뿐입니다. 렌더링이 끝난 뒤 다시 실행하세요."; exit 1; }
    gh release view videos-v1 --repo $REPO >/dev/null 2>&1 || gh release create videos-v1 --repo $REPO --title "D-day 영상 (D-15 ~ D-DAY)" --notes "dday-<숫자>-<story|poster>.mp4 · 숫자 0 = D-DAY · 18초 · 나레이션 포함"
    gh release upload videos-v1 --repo $REPO --clobber $VIDS/dday-*.mp4
    echo "올림: $n개 → https://github.com/$REPO/releases/tag/videos-v1"
    ;;
  *) echo "사용법: zsh publish.sh site | videos"; exit 1 ;;
esac
