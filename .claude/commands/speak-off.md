---
description: Turn off spoken (text-to-speech) replies for this project
---

Turn off the spoken-reply Stop hook for this project by setting `SPEAK_RESPONSES` to `"off"` under `env` in the untracked `.claude/settings.local.json` file (create the file with `{}` first if it doesn't exist yet; merge into any existing content rather than overwriting it). Do not touch the shared, committed `.claude/settings.json`.

Once done, confirm briefly that spoken replies are now off, and mention that `/speak-on` turns them back on.
