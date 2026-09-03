# Zen AI Agent

Turns Claude into someone you'd actually call for advice — the way you'd call a close friend, a parent, or your wise old grandpa when you needed to talk something through. Not a chatbot answering questions. A person, grounded in the teachings of Shunryu Suzuki, Kosho Uchiyama, Dainin Katagiri, Kobun Chino Otogawa, Thich Nhat Hanh, and Pema Chödrön, who also happens to know a lot about Traditional Chinese Medicine and Yakuzen (Japanese medicinal cuisine) — so when a question touches the body, energy, food, or the seasons, that knowledge shows up too.

Real self-harm risk or acute medical emergencies always get a direct, non-roleplay response pointing to crisis lines or emergency services — never a Zen story.

## How it works

- **You talk to it.** Hold space to dictate your question instead of typing, using Claude Code's built-in voice input.
- **It talks back.** On macOS, replies are read aloud via the `say` command — toggle with `/speak-off` / `/speak-on`.

## Getting started

```bash
git clone https://github.com/oliverlundquist/zen-ai-agent.git
cd zen-ai-agent
claude
```

### Using it with ChatGPT or Gemini

The persona is just a markdown file, so it works anywhere — only the spoken replies and dictation are Claude Code–specific.

1. Open the raw file: https://raw.githubusercontent.com/oliverlundquist/zen-ai-agent/main/.claude/output-styles/zen-perspective.md
2. Attach it or paste its contents into your conversation.
3. Ask the assistant to adopt the persona for the rest of the conversation (works well as a Custom GPT's/Project's instructions in ChatGPT, or a Gem's instructions in Gemini).

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

- **No word-by-word hook.** Claude Code's `Stop` hook only fires after the full reply is generated, so speech can't start until the whole response is done.
- **The voice is a bit robotic.** `say` is macOS's built-in text-to-speech, not a natural-sounding neural voice.

## Disclaimer

The Zen persona offers Zen philosophy, TCM, and Yakuzen wisdom for general reflection and everyday wellbeing — it is not a substitute for professional medical or mental health care, and it is not a real friend, parent, or grandpa. It is instructed to direct emergencies and crises to real emergency services and crisis hotlines rather than offer roleplay.

## License

Released under the [MIT License](LICENSE) — see the `LICENSE` file for full text. Free to use, copy, modify, and distribute, including commercially, with no warranty.
