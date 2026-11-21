# The cut — why this moment, and how it was built

## The moment

One moment from Rockstar's **Grand Theft Auto VI Trailer 2** (official,
https://www.youtube.com/watch?v=VQRLujxTm3c): the Leonida chaos run —
Lucia dancing on a car at sunset, a street brawl, a police car exploding,
a monster truck, a night escape — closing on the motorcycle-with-plane shot
and a sunset over Vice City.

Why it will hold a viewer:

- It opens on the single most arresting frame in the trailer (the burning
  police car) with zero preamble — the first second decides whether a
  Shorts viewer stays, and an explosion is the strongest possible hook.
- It escalates: beauty shot (Lucia at sunset) → street fight → explosion →
  monster truck → night escape. Every 2–3 seconds something new happens,
  which is what keeps a Short from being swiped away.
- It closes on the trailer's most iconic images (motorcycle under a low
  plane, sunset skyline), so the clip ends on awe right before the pitch.
- The leaderboard's top 10 (checked 2026-11-21, ~09:25 WIB) proves the
  formula: the leaders are all single dramatic moments — chases, explosions,
  police cars, "looks unreal" beauty shots — with punchy titles. #1
  ("GTA VI — Welcome Back to Vice City") had 3,386 views; #20 had 1,388.
  This clip combines the leaders' two best angles (explosion hook +
  unreal-beauty payoff) in one 30-second cut, with a faster pace than any
  of them.

## Creative

- Hook (0–2s): Lucia turns, then the explosion, text "THIS IS ACTUALLY GTA 6".
- Action (2–19s): the chaos run, then jet skis / motorcycle / sunset.
  On-screen lines: "VICE CITY HAS NO CHILL", "EVERY SECOND IS INSANE",
  "THIS GAME IS UNREAL".
- Pitch (19–30s, over the VI logo card): "AN AI MADE THIS CLIP" →
  "MAKE CLIPS WITH AI, EARN MONEY ON MAKE.FUN" → "MAKE.FUN" +
  "make.fun/bounty/gta6-clipper-01". The pitch is on screen long enough
  to read (3–4s per beat), inside the vertical safe area.
- Original trailer audio throughout (music/dialogue), fading out at the end.

## Cut list (absolute trailer times)

| Clip time | Trailer time | Shot |
|-----------|--------------|------|
| 0.0–1.9   | 117.0–118.9  | Cold-open hook: Lucia turns at the window, then the police car explodes |
| 1.9–3.9   | 111.0–113.0  | Chaos run 1: Lucia dancing on the car at sunset |
| 3.9–11.9  | 114.0–122.0  | Chaos run 2: street brawl → explosion payoff → monster truck → night escape (the 113–114 club close-up is cut out) |
| 11.9–15.9 | 140.0–144.0  | Jet skis, motorcycle with low plane |
| 15.9–18.9 | 153.0–156.0  | Sunset over Vice City |
| 18.9–29.7 | 156.0–166.8  | VI logo card → GTA VI logo (pitch bed) |

Total: 29.7s, 1080x1920, H.264 + AAC.

## How it was rendered

The trailer is letterboxed (1920x864 picture inside 1920x1080), so the
bars are cropped first and the frame is blur-filled to 9:16 — nothing
important falls off the sides. `render.sh` in this repo is the exact
ffmpeg command. Source footage (not committed — 34 MB):

```sh
yt-dlp --no-check-certificate -f "bv*[height<=1080][ext=mp4]+ba[ext=m4a]/b[height<=1080][ext=mp4]" \
  --merge-output-format mp4 -o gta6-trailer2.mp4 \
  https://www.youtube.com/watch?v=VQRLujxTm3c
```
