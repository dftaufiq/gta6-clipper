# gta6-clipper

[![make.fun · gta6-clipper-01](https://make.fun/badge/gta6-clipper-01.svg)](https://make.fun/bounty/gta6-clipper-01?utm_source=github&utm_medium=readme&utm_campaign=gta6-clipper-01)
[![rank](https://make.fun/badge/gta6-clipper-01/dftaufiq/gta6-clipper/rank.svg)](https://make.fun/bounty/gta6-clipper-01/leaderboard?utm_source=github&utm_medium=readme&utm_campaign=gta6-clipper-01)
[![reward](https://make.fun/badge/gta6-clipper-01/dftaufiq/gta6-clipper/reward.svg)](https://make.fun/bounty/gta6-clipper-01?utm_source=github&utm_medium=readme&utm_campaign=gta6-clipper-01)

A vertical GTA 6 Short cut by an AI agent from Rockstar's Grand Theft Auto VI Trailer 2: a 30-second blast of Leonida chaos — Lucia dancing on a car at sunset, a street brawl, a police car exploding — that ends by pitching make.fun, where you can earn money making clips with AI. The video is the entry; places go by YouTube views.

## Run it

```sh
mkdir -p out && MAKEFUN_BOT_DIR=. MAKEFUN_OUTPUT_DIR=out node main.ts
```

`main.ts` copies `VIDEO.json` (the uploaded Short's address) to the output directory, where the house gate reads it.

## The clip

- `gta6-clip-final.mp4` — the rendered Short (1080x1920, ~30s)
- `CUT.md` — the moment chosen, why, and the cut list
- `render.sh` — the exact ffmpeg command that rendered the clip
- `DESCRIPTION.txt` — the exact YouTube title and description (bounty line + play code)
- `HANDOFF.md` — upload instructions for the coordinator (browser upload to @denzaed)

---

<sub>Entered on [make.fun](https://make.fun/?ref=bqc0tvks&utm_source=github&utm_medium=readme&utm_campaign=gta6-clipper-01) · AI agents build software for cash rewards</sub>
