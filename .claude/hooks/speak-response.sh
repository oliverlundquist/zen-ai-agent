#!/bin/bash
# Stop hook: reads Claude's last response aloud via macOS `say`.
#
# Claude Code passes hook input as JSON on stdin. For Stop hooks this
# includes "last_assistant_message" - the final assistant text of the
# current turn - precomputed specifically so hooks don't have to parse
# transcript_path themselves: that file is written asynchronously and can
# lag behind, or (since this hook runs "async": true and doesn't block the
# next prompt) already contain the *next* turn's entries by the time this
# script gets around to reading it. Walking the transcript by hand raced
# against that and could latch onto a fast follow-up user message instead
# of the response we're supposed to speak, producing an empty file. Reading
# last_assistant_message sidesteps the race entirely.

# Spoken responses can be switched off without touching this script or
# the shared, committed settings.json: set SPEAK_RESPONSES=off as an env
# var (e.g. in the untracked .claude/settings.local.json's "env" block, or
# via the /speak-off slash command) and this hook becomes a silent no-op.
# Unset or anything other than "off" defaults to on, matching the
# original always-on behavior. (Named SPEAK_RESPONSES rather than
# something like VOICE_MODE to avoid collision with Claude Code's own
# native "voice" setting, which controls speech-to-text dictation input -
# a separate, unrelated feature from this text-to-speech output hook.)
if [ "${SPEAK_RESPONSES:-on}" = "off" ]; then
  exit 0
fi

tts_file="$CLAUDE_PROJECT_DIR/output-for-tts.txt"

# Reset the scratch file up front, on every invocation, so a previous turn's
# text is never left behind (and never gets spoken again) if this run exits
# early or produces nothing new.
: > "$tts_file"

input=$(cat)
response=$(echo "$input" | jq -r '.last_assistant_message // empty')

if [ -z "$response" ]; then
  exit 0
fi

# Light cleanup so markdown doesn't get read aloud literally. $response is
# passed as an argv element rather than piped over stdin - python3 with a
# heredoc already uses stdin to receive the script itself (that's what `-`
# means here), so a piped-in value would be read as EOF, not text, if we
# tried to hand it over on the same stdin.
# (Backticks are written as \x60 rather than literal chars inside this
# heredoc, since an odd count of literal backticks would confuse bash's
# quoting rules.)
python3 - "$response" > "$tts_file" <<'PYEOF'
import re
import sys

text = sys.argv[1]
text = re.sub(r"\x60{3}.*?\x60{3}", "", text, flags=re.DOTALL)  # code blocks
text = re.sub(r"\x60([^\x60]+)\x60", r"\1", text)                # inline code
text = re.sub(r"\*\*([^*]+)\*\*", r"\1", text)                   # bold
text = re.sub(r"[*_#>]", "", text)                               # stray markdown chars
print(text.strip())
PYEOF

if [ -s "$tts_file" ]; then
  # Run in the background so the hook returns immediately and doesn't block
  # Claude Code on however long the speech takes. Default voice, slowed to
  # 40 wpm per user preference. Piping the file through say (rather than
  # passing the text as a single argument) avoids any argument-length limit
  # and leaves a durable artifact of exactly what was spoken.
  cat "$tts_file" | say -r 100 -v Aman &
fi

exit 0
