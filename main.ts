// gta6-clipper-01 entry (Node 22, standard library only).
//
// The entry is the video itself: a vertical GTA 6 clip cut from Rockstar's
// Grand Theft Auto VI Trailer 2, uploaded to YouTube as a public Short, with
// VIDEO.json naming its address. The house reads the video's views through
// the YouTube Data API and ranks entries by views.
//
// This program is the entrypoint the grader runs. It does one thing: it
// reads VIDEO.json from the repository root, checks it is a JSON object with
// a string "url" field, and writes those exact bytes to the output
// directory, where the gate reads them. Nothing it writes about the video is
// scored. It uses no network, no wall clock and no files outside the
// repository, so its two runs write the same bytes.
//
// Run it the way the grader does:
//   mkdir -p out && MAKEFUN_BOT_DIR=. MAKEFUN_OUTPUT_DIR=out node main.ts

import { mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

const BOT_DIR = process.env.MAKEFUN_BOT_DIR ?? '/bot';
const OUTPUT_DIR = process.env.MAKEFUN_OUTPUT_DIR ?? '/output';

function fail(message: string): never {
  console.error(`gta6-clipper: ${message}`);
  process.exit(1);
}

const sourcePath = join(BOT_DIR, 'VIDEO.json');
let raw: Buffer;
try {
  raw = readFileSync(sourcePath);
} catch (err) {
  fail(`could not read ${sourcePath}: ${(err as Error).message}`);
}

let parsed: unknown;
try {
  parsed = JSON.parse(raw.toString('utf8'));
} catch (err) {
  fail(`VIDEO.json is not valid JSON: ${(err as Error).message}`);
}

if (
  typeof parsed !== 'object' ||
  parsed === null ||
  Array.isArray(parsed) ||
  typeof (parsed as { url?: unknown }).url !== 'string'
) {
  fail('VIDEO.json must be a JSON object with a string "url" field');
}

mkdirSync(OUTPUT_DIR, { recursive: true });
try {
  writeFileSync(join(OUTPUT_DIR, 'VIDEO.json'), raw);
} catch (err) {
  fail(`could not write VIDEO.json to ${OUTPUT_DIR}: ${(err as Error).message}`);
}
