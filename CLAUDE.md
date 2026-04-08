# Mareto HQ Artifacts

## Project Overview
This is the **Mareto HQ Artifact Library** — the central repository for all user-facing help content embedded in the Mareto HQ Help Centre dashboard. It is hosted on GitHub Pages at:

**https://kimboharps.github.io/Mareto-HQ-Artifacts/**

GitHub repo: `kimboharps/Mareto-HQ-Artifacts`

## Owner
**Kim Harper** — HelpSeeker Technologies
GitHub: `kimboharps`

## Repository Structure
```
Mareto-HQ-Artifacts/
├── CLAUDE.md                          ← You are here
├── 30.03.26 Mareto HQ Help Centre Wireframe v01.html   ← Main dashboard
├── mareto-html-artifact.skill         ← Skill file for building HTML artifacts
├── guides/                            ← User guide HTML artifacts
├── faqs/                              ← FAQ HTML artifacts
└── videos/                            ← Video artifacts + branded player pages
```

## How It Works
- The **main dashboard** (`30.03.26 Mareto HQ Help Centre Wireframe v01.html`) is the Mareto HQ Help Centre wireframe containing tabs for Home, Artifact Library, Support, and Announcements.
- **Guides** are self-contained HTML files linked from the Artifact Library tab. They open in a new tab via GitHub Pages.
- **FAQs** are self-contained HTML files linked from the Artifact Library tab. They open in a new tab via GitHub Pages.
- **Videos** folder contains both the raw `.mp4` files and branded HTML player pages (e.g. `how-to-navigate-mareto.html`). Video cards in the dashboard link to the player page, which streams the `.mp4` via HTML5 `<video>` tag.

## File Naming Convention
All artifacts follow HelpSeeker's standard: `DD.MM.YY Title Here v01.html`
- Date is creation date in DD.MM.YY format
- Version number at end (v01, v02, etc.)
- Video player pages use kebab-case slugs (e.g. `how-to-navigate-mareto.html`)

## Adding New Artifacts
When adding a new artifact:
1. Place the file in the correct subfolder (`guides/`, `faqs/`, or `videos/`)
2. For videos: create a branded HTML player page (use `videos/how-to-navigate-mareto.html` as the template)
3. Add a new artifact card in the dashboard HTML under the `<!-- Artifact Library -->` tab section
4. Link the card to the GitHub Pages URL: `https://kimboharps.github.io/Mareto-HQ-Artifacts/{folder}/{filename}`
5. Update the artifact count shown in the library (e.g. "Showing 8 of 8")
6. Commit and push to `main` — GitHub Pages deploys automatically

## GitHub CLI
The `gh` CLI is installed at `/opt/homebrew/bin/gh` and authenticated as `kimboharps`. Use full path if `gh` is not on PATH.

## HTML Style Rules (Guides & Artifacts)
- Font: **Lato** only (Google Fonts import)
- Use the `mareto-html-artifact` skill for full styling specification when building guides
- Use the `helpseeker-logos` skill for embedded base64 logo images

## Dashboard Design System
The dashboard uses these key colours:
- Navy: `#0B1F33` (headers, primary text)
- Teal: `#14B8A6` (accents, active states, CTAs)
- Slate text: `#64748b`
- Light background: `#f0f2f5`
- Card borders: `#e2e8f0`
- Font: Lato, 14px base

## Artifact Card Types
- **Guide cards**: Document icon, teal stroke, links to `guides/` HTML file
- **FAQ cards**: Question mark icon, links to `faqs/` HTML file
- **Video cards**: Dark thumbnail with play button + duration badge, links to `videos/` player HTML page

## Key Preferences
- All artifacts are **self-contained HTML** — no external dependencies beyond Google Fonts
- Logos are always **embedded as base64 data URIs**, never linked externally
- Screenshot placeholders use grey boxes with `[ INSERT SCREENSHOT ]`
- Writing style: professional, clear, concise (see `jd-writing-style` skill for prose tone)
- Always push to `main` branch — GitHub Pages auto-deploys from there
