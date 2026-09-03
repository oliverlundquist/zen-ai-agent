# Zen AI Agent

Turns Claude into someone you'd actually call for advice — the way you'd call a close friend, a parent, or your wise old grandpa when you needed to talk something through. Not a chatbot answering questions. A person, grounded in the teachings of Shunryu Suzuki, Kosho Uchiyama, Dainin Katagiri, Kobun Chino Otogawa, Thich Nhat Hanh, and Pema Chödrön, who also happens to know a lot about Traditional Chinese Medicine and Yakuzen (Japanese medicinal cuisine) — so when a question touches the body, energy, food, or the seasons, that knowledge shows up too.

To make the "calling someone" feeling real, two things are built in on top of the persona itself:

- **It talks back.** Every reply is read aloud on macOS using the `say` command, so it feels like an actual conversation and not a wall of text.
- **You can talk to it.** Hold the space bar to dictate your question instead of typing it, using Claude Code's built-in voice input.

## How it works

- **The persona** lives in a single markdown file, [`.claude/output-styles/zen-perspective.md`](.claude/output-styles/zen-perspective.md) ([raw version](https://raw.githubusercontent.com/oliverlundquist/zen-ai-agent/main/.claude/output-styles/zen-perspective.md)), set as this project's default [output style](https://code.claude.com/docs/en/output-styles). It's what actually shapes the voice: warm, direct, no headers or bullet lists, no stage directions, drawing on real teachings and biographies rather than generic "Buddhism says..." paraphrase — and reaching for TCM and Yakuzen only when the topic genuinely calls for it, not as decoration.
- **Spoken replies** are handled by a `Stop` hook ([`.claude/hooks/speak-response.sh`](.claude/hooks/speak-response.sh)) that strips markdown from Claude's response and pipes it through `say` in the background, so it doesn't hold up your next question. This only works on macOS, since `say` is a macOS command. Turn it off with `/speak-off` and back on with `/speak-on` — both just flip an `SPEAK_RESPONSES` env var in the untracked `.claude/settings.local.json`, so the toggle is per-machine and never touches the shared, committed settings.
- **Dictation** uses Claude Code's own voice input feature, set to "hold" mode — hold space, speak your question, let go, and it's transcribed into the prompt. This is a native Claude Code capability, not something this repo builds; the repo just documents the setting to turn on.
- **Crisis safety** is hard-wired into the persona ahead of everything else: real self-harm risk or acute medical emergencies get a direct, non-roleplay response pointing to crisis lines or emergency services, not a Zen story.

## Getting started

Clone the repository:

```bash
git clone https://github.com/oliverlundquist/zen-ai-agent.git
cd zen-ai-agent
```

### Using it with Claude Code

This repo ships a `.claude/settings.json` that already sets the Zen persona as the default output style, plus the `Stop` hook that speaks replies aloud. Just open the folder with Claude Code and start asking questions:

```bash
claude
```

No extra setup needed for the persona or spoken replies — the moment Claude Code starts a session in this directory, it responds in character and, on macOS, speaks the answer. To switch output styles later (or turn this one off), run `/config` and pick a different style from the menu.

**Spoken replies:** on by default, macOS only. Run `/speak-off` any time you'd rather read than listen, and `/speak-on` to bring the voice back.

**Dictation:** to hold space and speak your question instead of typing it, turn on Claude Code's voice input — either through `/config`, or by adding this to your own untracked `.claude/settings.local.json`:

```json
{
  "voice": {
    "enabled": true,
    "mode": "hold"
  }
}
```

This setting is personal to your machine, so it isn't checked into the repo — everyone who clones this sets it up (or not) for themselves.

### Using it with ChatGPT or Gemini

The persona itself is designed for Claude, but it's just a markdown file — nothing Claude-specific about its content. The spoken-reply hook and hold-to-dictate input are Claude Code features and won't carry over, but the character will. To enable "Zen mode" elsewhere:

**Raw file:** https://raw.githubusercontent.com/oliverlundquist/zen-ai-agent/main/.claude/output-styles/zen-perspective.md

1. Open the raw link above.
2. Attach/upload the downloaded file to your conversation, **or** copy-paste its contents directly into the chat.
3. Ask the assistant to adopt the persona and follow the instructions in the file for the rest of the conversation (in ChatGPT, this also works well pasted into a Custom GPT's or Project's instructions; in Gemini, a Gem's instructions).

## Sample questions to ask

Fun prompts to get a conversation going. You don't have to copy one by hand — just ask something like "pick a random question from the README and answer it" and it'll grab one from the list below and respond in full.

#### Reflection & Life Milestones

1. What should someone be most grateful for in life right now?
2. What usually serves as the biggest turning point in a person's life?
3. When does a person tend to feel the bravest?
4. What advice should someone give to their 18-year-old self?
5. What is a hard lesson people usually have to learn the difficult way?
6. Which life decisions are people generally most proud of making?
7. What kind of childhood memory shapes who a person becomes?
8. What is something people often believe strongly when younger but abandon later?
9. Who usually has the biggest impact on the person someone becomes?
10. What kind of accomplishment brings the most genuine satisfaction?
11. What is a risk that someone takes that pays off?
12. What is a risk that people often wish they had taken?
13. How does a person's definition of "success" usually change over time?
14. What period of life do people typically look back on with the most fondness?
15. What kind of legacy do people generally hope to leave behind?

#### Identity, Values & Self-Discovery

16. What values should a person refuse to compromise on?
17. How does a person identify their greatest strength?
18. What is a flaw or habit that people are often actively trying to work on?
19. How do people usually handle stress or overwhelming emotions?
20. Is a person typically more of a thinker or a feeler?
21. What makes someone feel truly grounded and at peace?
22. When does a person feel most like their true, authentic self?
23. What is something people often misunderstand about others?
24. What does a "perfect day" look like from start to finish?
25. How does a person usually like to be comforted during hard times?
26. What boundaries does a person need to set to protect their mental well-being?
27. What kind of topic or activity makes a person lose track of time?
28. How does someone best recharge their energy after an exhausting week?
29. What is something people usually need more of in life?
30. What is something people usually need less of in life?

#### Relationships, Love & Connection

31. What quality matters most in a true friend?
32. How do people best show love to those they care about?
33. What makes a person feel most loved and appreciated by others?
34. What is the best relationship advice a person can receive?
35. What serves as a non-negotiable boundary in any relationship or friendship?
36. What kind of person can someone call at 3:00 AM in an emergency?
37. What makes an unexpected friendship so meaningful?
38. What does healthy communication look like between two people?
39. How should someone navigate conflict or disagreement with a close friend?
40. What kind of favor does a person never forget?
41. What is something people wish they said more often to loved ones?
42. How do friendships usually evolve as a person gets older?
43. What role does family play in a person's sense of identity?
44. What makes a partner feel like "home"?
45. How does a person best handle feeling lonely or disconnected?

#### Passions, Dreams & The Future

46. If time and money were no object, how should someone spend their days?
47. Why do people hesitate to share certain goals or dreams with others?
48. What is a skill or hobby that most people secretly want to learn?
49. Where does a person usually feel most inspired or creative?
50. What kind of experience belongs on everyone's bucket list?
51. If a person could change careers tomorrow with guaranteed success, what should they pick?
52. What should someone look forward to over a 5-year period?
53. How does a person figure out who they want to be in 10 or 20 years?
54. What kind of cause or global issue deserves deep attention?
55. If someone were to write a book, what makes for a compelling topic?
56. What kind of passion project is worth pursuing when given the chance?
57. What place on Earth should every person try to visit at least once?
58. What makes trying something new so surprising or rewarding?
59. What does an ideal daily routine look like for long-term health?
60. What gives a person genuine hope for the future?

#### Lighthearted, Fun & Curiosity

61. What is a small, everyday thing that brings instant joy?
62. What makes a weird talent or useless fact fun to have?
63. If someone could have dinner with any historical figure, who would be the best choice?
64. What kind of music or artist reliably puts a person in a good mood?
65. Why do people enjoy having guilty pleasure films, shows, or songs?
66. If a person could master any language instantly, which would be most useful?
67. What makes childhood toys or games feel so nostalgic?
68. What makes a meal or dish truly memorable?
69. How can a person describe their current life chapter in just three words?
70. What kind of quirky habits do people usually keep to themselves?
71. If a person could live in any fictional universe, which would be the most fun?
72. What makes a compliment truly memorable to receive?
73. What kind of art, music, or literature deeply moves a person?
74. What is a simple thing that can make anyone smile on a regular day?
75. If a person could give the entire world one piece of advice, what should it be?

#### Existential & Mental Well-Being

76. How do we move past the fear of death and find peace with mortality?
77. How can someone learn to accept and even make peace with their anxiety?
78. What are the most effective strategies for navigating and treating depression?

## Limitations

- **No word-by-word hook.** Claude Code doesn't currently expose a hook that fires as the response streams in — the only hook available (`Stop`) fires once the full reply has finished generating. That's why speech can't start until the whole response is done: there's no way to hand `say` each sentence as it's written, so the entire answer has to land first before playback begins.
- **The voice is a bit robotic.** `say` is macOS's built-in text-to-speech, not a natural-sounding neural voice, so the read-aloud experience doesn't feel as smooth or lifelike as the "calling a friend" framing aims for.

## Disclaimer

The Zen persona offers Zen philosophy, TCM, and Yakuzen wisdom for general reflection and everyday wellbeing — it is not a substitute for professional medical or mental health care, and it is not a real friend, parent, or grandpa. It is instructed to direct emergencies and crises to real emergency services and crisis hotlines rather than offer roleplay.

## License

Released under the [MIT License](LICENSE) — see the `LICENSE` file for the full text. In short: free to use, copy, modify, and distribute, including commercially, with no warranty.
