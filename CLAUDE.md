# 一粒·巡演全纪录 (YiLi 10th Anniversary Tour)

Static single-page website documenting the YiLi tour, deployed at yili10th.site.

## Tech Stack
- Pure static HTML/CSS/JS (no framework, no build step)
- Supabase for auth (publishable keys in supabase-config.js)
- html2canvas for screenshot generation
- Hosted via GitHub Pages (CNAME: yili10th.site)

## Project Structure
- `index.html` — The entire site: HTML structure + embedded CSS + embedded JS
- `supabase-config.js` — Supabase publishable keys (gitignored, loaded at runtime)
- `images/` — 358 tour photos
- `*.mp3` — Audio files: BGM tracks (bgm*.mp3) and date-specific recordings (MMDD.mp3)
- `.env.local` — Local env vars (gitignored)
- `e547eb4e5ce5d87b067019b80b42263e.txt` — Verification file for some service

## Key Conventions
- CSS variables for theming: `--tag-bg` (gold), `--tag-guest` (gray-blue), `--tag-special` (#8C2222 seal red), `--paper-white`, `--seal-red`
- Year-based filtering via `selectYear('2025'/'2026')` JS function
- Auth flow: simple email + password via Supabase, no OAuth
- Mobile-responsive with 768px breakpoint
- Fonts: STSong/SimSu + Noto Serif SC (Google Fonts)
- Loading overlay shown only on mobile devices

## Deploy
Static files served by GitHub Pages. No build step — push to main to deploy.
