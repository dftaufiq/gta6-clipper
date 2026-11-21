#!/usr/bin/env bash
# Render the gta6-clipper-01 Short from Rockstar's GTA VI Trailer 2.
# Source: https://www.youtube.com/watch?v=VQRLujxTm3c (official Rockstar trailer,
# downloaded with yt-dlp in this session, footage/gta6-trailer2.mp4).
# Output: 1080x1920 vertical, ~30s, H.264 + AAC.
set -euo pipefail
cd "$(dirname "$0")"

SRC="footage/gta6-trailer2.mp4"
OUT="gta6-clip-final.mp4"
FONT="/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"

# Segments (absolute trailer times, verified frame by frame):
#   v0 117.0-118.9  cold-open hook: Lucia turns at the window, then the police
#                   car explodes (1.9s)
#   v1 111.0-113.0  chaos run 1: Lucia dancing on the car at sunset (2.0s)
#   v2 114.0-122.0  chaos run 2: street brawl -> explosion payoff -> monster
#                   truck -> night escape (8.0s; the 113-114 club close-up is
#                   cut out)
#   v3 140.0-144.0  jet skis + motorcycle with low plane (4.0s)
#   v4 153.0-156.0  sunset over Vice City (3.0s)
#   v5 156.0-166.8  VI logo card -> GTA VI logo (pitch bed, 10.8s)
# Total: 29.7s. Trailer is letterboxed 1920x864 inside 1920x1080, so we crop
# the bars, then blur-fill to 9:16 (nothing important falls off the sides).

ffmpeg -y -v error -i "$SRC" -filter_complex "\
[0:v]crop=1920:864:0:108,split=6[va][vb][vc][vd][ve][vf]; \
[va]trim=117.0:118.9,setpts=PTS-STARTPTS[h]; \
[vb]trim=111.0:113.0,setpts=PTS-STARTPTS[c1]; \
[vc]trim=114.0:122.0,setpts=PTS-STARTPTS[c2]; \
[vd]trim=140.0:144.0,setpts=PTS-STARTPTS[j]; \
[ve]trim=153.0:156.0,setpts=PTS-STARTPTS[s]; \
[vf]trim=156.0:166.8,setpts=PTS-STARTPTS[p]; \
[h][c1][c2][j][s][p]concat=n=6:v=1:a=0,format=yuv420p[cut]; \
[cut]split[fg][bg]; \
[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=45,eq=brightness=-0.22[blur]; \
[fg]scale=1080:-2[fg2]; \
[blur][fg2]overlay=(W-w)/2:(H-h)/2[base]; \
[base]drawtext=fontfile=$FONT:text='THIS IS ACTUALLY GTA 6':fontsize=66:fontcolor=white:borderw=3:bordercolor=black:shadowcolor=black:shadowx=3:shadowy=3:x=(w-text_w)/2:y=420:enable='between(t,0.2,1.9)'[t1]; \
[t1]drawtext=fontfile=$FONT:text='VICE CITY HAS NO CHILL':fontsize=60:fontcolor=white:borderw=3:bordercolor=black:shadowcolor=black:shadowx=3:shadowy=3:x=(w-text_w)/2:y=420:enable='between(t,2.2,6.0)'[t2]; \
[t2]drawtext=fontfile=$FONT:text='EVERY SECOND IS INSANE':fontsize=60:fontcolor=white:borderw=3:bordercolor=black:shadowcolor=black:shadowx=3:shadowy=3:x=(w-text_w)/2:y=420:enable='between(t,6.5,11.4)'[t3]; \
[t3]drawtext=fontfile=$FONT:text='THIS GAME IS UNREAL':fontsize=64:fontcolor=white:borderw=3:bordercolor=black:shadowcolor=black:shadowx=3:shadowy=3:x=(w-text_w)/2:y=420:enable='between(t,12.4,15.7)'[t4]; \
[t4]drawtext=fontfile=$FONT:text='AN AI MADE THIS CLIP':fontsize=68:fontcolor=white:borderw=3:bordercolor=black:box=1:boxcolor=black@0.55:boxborderw=18:x=(w-text_w)/2:y=430:enable='between(t,19.2,22.9)'[t5]; \
[t5]drawtext=fontfile=$FONT:text='MAKE CLIPS WITH AI,':fontsize=62:fontcolor=white:borderw=3:bordercolor=black:box=1:boxcolor=black@0.55:boxborderw=18:x=(w-text_w)/2:y=430:enable='between(t,23.2,26.7)'[t6]; \
[t6]drawtext=fontfile=$FONT:text='EARN MONEY ON MAKE.FUN':fontsize=62:fontcolor=white:borderw=3:bordercolor=black:box=1:boxcolor=black@0.55:boxborderw=18:x=(w-text_w)/2:y=540:enable='between(t,23.2,26.7)'[t7]; \
[t7]drawtext=fontfile=$FONT:text='MAKE.FUN':fontsize=96:fontcolor=white:borderw=4:bordercolor=black:box=1:boxcolor=black@0.55:boxborderw=22:x=(w-text_w)/2:y=400:enable='between(t,26.9,29.7)'[t8]; \
[t8]drawtext=fontfile=$FONT:text='make.fun/bounty/gta6-clipper-01':fontsize=40:fontcolor=white:borderw=2:bordercolor=black:box=1:boxcolor=black@0.55:boxborderw=14:x=(w-text_w)/2:y=1450:enable='between(t,26.9,29.7)'[vout]; \
[0:a]asplit=6[a0][a1][a2][a3][a4][a5]; \
[a0]atrim=117.0:118.9,asetpts=PTS-STARTPTS[aa]; \
[a1]atrim=111.0:113.0,asetpts=PTS-STARTPTS[ab]; \
[a2]atrim=114.0:122.0,asetpts=PTS-STARTPTS[ac]; \
[a3]atrim=140.0:144.0,asetpts=PTS-STARTPTS[ad]; \
[a4]atrim=153.0:156.0,asetpts=PTS-STARTPTS[ae]; \
[a5]atrim=156.0:166.8,asetpts=PTS-STARTPTS[af]; \
[aa][ab][ac][ad][ae][af]concat=n=6:v=0:a=1,afade=t=out:st=28.5:d=1.2[aout]" \
-map "[vout]" -map "[aout]" -c:v libx264 -crf 20 -preset medium -pix_fmt yuv420p \
-movflags +faststart -c:a aac -b:a 192k "$OUT"

ffprobe -v error -show_entries format=duration,size -show_entries stream=width,height,codec_name,r_frame_rate -of default=noprint_wrappers=1 "$OUT"
ls -la "$OUT"
