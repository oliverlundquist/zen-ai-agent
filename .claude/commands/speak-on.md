---
description: Turn on spoken (text-to-speech) replies for this project
---

Turn on the spoken-reply Stop hook for this project by setting `SPEAK_RESPONSES` to `"on"` under `env` in the untracked `.claude/settings.local.json` file (create the file with `{}` first if it doesn't exist yet; merge into any existing content rather than overwriting it). Do not touch the shared, committed `.claude/settings.json`.

Once done, confirm briefly that spoken replies are now on, and mention that `/speak-off` turns them back off.
