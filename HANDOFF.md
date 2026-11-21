# HANDOFF — upload the clip (for the coordinator / main agent)

The build agent's job ends here. The clip is rendered and the entry repo is
ready; what remains is the upload, the URL, and the submission. The upload
is done by the main agent via the browser (YouTube Studio) — NOT by Dias.

## 1. Upload the clip

- File: `gta6-clip-final.mp4` in this repo (1080x1920 vertical, ~30s,
  H.264 + AAC). It is also at
  `~/workspace/makefun-kits/gta6-clipper-01-build/gta6-clip-final.mp4`.
- Channel: Dias's YouTube channel **@denzaed**.
- Upload via the browser in YouTube Studio (main agent handles the
  sign-in; never ask Dias for a password in chat — secure entry / OAuth
  flows only, plus a 2FA code from him at upload time if asked).
- Title (copy exactly): `GTA 6's most INSANE 30 seconds 🔥`
- Description: copy the exact text from `DESCRIPTION.txt` (the bounty's
  required line, word for word, plus the play code
  `makefun-omelet-sandbar-gem`). Do not reword the first line — the house
  checks it via the YouTube Data API for "$500 bounty", a make.fun link,
  and one of the entrant's play codes.
- Visibility: **Public** (not unlisted, not private). The video is a
  Short automatically (vertical, under 60s).
- Timing: upload ASAP — views accumulate until the deadline, and the
  leaders already have a day's head start. Hard deadline: the video must
  be public before **2026-11-23 08:00 WIB** (entries close), and it must
  stay public until the results are out (result due 2026-12-07).

## 2. After the upload

1. Copy the video's address (Share → Copy):
   `https://www.youtube.com/shorts/<id>`.
2. A follow-up recorded session replaces the placeholder in `VIDEO.json`
   with that URL, commits, and pushes. (Do NOT invent a URL; the video
   must be the real published Short.)
3. The coordinator submits the entry with the kit CLI (bundle required):
   `node cli/makefun.mjs submit --competition gta6-clipper-01 --repo-url
   https://github.com/dftaufiq/gta6-clipper --commit <sha> --title "GTA 6's
   most INSANE 30 seconds" --bundle transcripts.tar.gz --keypair
   ~/.makefun/keypairs/make.fun.json` — from inside the unpacked kit at
   `~/workspace/makefun-kits/gta6-clipper-01-build/gta6-clipper-01-kit/`.

## 3. Facts the follow-up needs

- Bounty: gta6-clipper-01, "Clip GTA 6 for the most YouTube views", $500
  (top 20 paid; 1st $100). Entries close 2026-11-23 08:00 WIB.
- Account: make.fun @dftaufiq-2, GitHub @dftaufiq, repo
  https://github.com/dftaufiq/gta6-clipper.
- Play code used: `makefun-omelet-sandbar-gem` (n=0 of 4).
- Referral code in README: `bqc0tvks` (Dias's).
- Signing wallet: 3S2JArSzsgB2aj3pSQMwdgAfiz9pwSpwJrbKaDCMk5yS
  (keypair `~/.makefun/keypairs/make.fun.json`).
- Leaderboard at build time (2026-11-21 ~09:25 WIB): #1 3,386 views,
  #10 1,571, #20 1,388 — the bar for a paid place is roughly 1,400+
  views and rising.
- No recording id exists for this bounty: `makefun record` refuses it
  ("does not take recorded transcripts") — entries upload a transcript
  bundle instead. The coordinator bundles this build session
  (c4324ca4-a6ce-47c1-b459-5fd5e8ce1876) plus the follow-up session.
