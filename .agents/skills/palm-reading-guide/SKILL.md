---
name: palm-reading-guide
description: "Analyze clear palm photos and create a complete Chinese or bilingual palm-reading guide with an explicit gender profile, evidence-based line observations, cautious traditional interpretations, and a refined black-on-white contour illustration. Use for 手相、掌纹、看手相、palmistry、掌纹报告或掌纹线稿 requests; do not use for medical diagnosis or biometric identification."
---

# Palm Reading Guide

Create a visually refined, culturally framed palm-reading report from the user's actual hand photos. Keep observation, traditional interpretation, and uncertainty visibly separate.

## How to invoke

When the user asks how to start or install this Skill, read [references/usage.md](references/usage.md). The distributable repository includes a Windows one-click launcher that selects palm images, collects the required profile fields, attaches the images, and starts Codex with an explicit `$palm-reading-guide` prompt.

## Intake gate

Before interpreting, establish these fields:

- `gender_profile`: 男性 / 女性 / 非二元或其他 / 不透露. This is required because the skill exposes gender branches; it must never be used to infer ability, temperament, sexuality, fertility, or social role.
- `dominant_hand`: 左 / 右 / 双手均衡 / 未知.
- `reading_mode`: `modern` by default, or `traditional-gendered` only when the user requests the traditional 男左女右 convention.
- `language`: follow the user's language; default to Chinese for Chinese requests.
- `photos`: ideally one straight-on image of each open palm, wrist included, fingers relaxed and separated, even diffuse light, no beauty filter, no severe perspective distortion.

If a required field or usable photo is missing, ask one concise combined question. Do not invent palm features from an absent, blurry, cropped, or hidden hand.

Read [references/intake-and-hand-selection.md](references/intake-and-hand-selection.md) whenever hand choice, photo quality, or the gender branch needs resolution.

## Analysis workflow

1. Inspect both palms when available. Record visible facts before assigning meaning: hand shape, finger proportions, thumb opening, mounts, line origin/end, depth, continuity, curvature, forks, crosses, islands, and asymmetry.
2. Select the primary hand using the chosen mode. In modern mode, the dominant hand represents developed/current patterns and the non-dominant hand baseline tendencies. In traditional-gendered mode, use left for the male branch and right for the female branch, while stating that this is a convention rather than an objective rule. For other or undisclosed gender profiles, use the dominant hand.
3. Interpret only features actually visible. Use calibrated language such as “在传统手相语境中，常被解读为…”, “这可能象征…”, and “此处清晰度有限”.
4. Cover the three major lines first, then secondary lines and mounts only when visible. Use [references/reading-framework.md](references/reading-framework.md) for the full evidence map and gender-safe branching.
5. Synthesize recurring themes across multiple features. Do not turn a single mark into a dramatic prediction.
6. Create a faithful black-on-white contour artwork of the analyzed hand. Trace the palm silhouette and only the observed major lines; simplify, but do not redesign their location or shape. Prefer editable SVG, 1.25–1.75 px black strokes, round caps/joins, no fill, generous whitespace. If a segment is uncertain, omit it or use a light dashed stroke and explain why.
7. Produce the report using [references/report-spec.md](references/report-spec.md). For an HTML deliverable, copy and fill [assets/report-template.html](assets/report-template.html); retain its restrained monochrome visual system unless the user requests another style.

## Required report content

- Cover/profile: gender profile, primary hand, reading mode, photo quality, and date.
- One-paragraph executive reading with 3–5 central themes.
- “What I can see” card containing neutral observations.
- Separate cards for heart, head, life, and fate lines; include Sun/Apollo, Mercury/health, relationship, or travel lines only when confidently visible.
- Hand shape, thumb/fingers, mounts, and left–right comparison when supported by the photos.
- Gender branch note explaining how gender changed hand selection or phrasing. If it changed nothing, say so.
- Strengths, tensions, and 3 grounded reflection prompts. These are reflective prompts, not predictions or instructions.
- Palm contour artwork as SVG or high-resolution PNG.
- Confidence labels for each section: high / medium / low.
- A short cultural-entertainment disclaimer.

## Safety and integrity

- Palmistry is a cultural/entertainment practice, not a validated diagnostic or predictive method. Say this clearly but briefly.
- Never predict death, lifespan, serious illness, pregnancy, fertility, criminality, mental disorder, financial windfalls, or inevitable relationship outcomes.
- Never provide medical, legal, or financial conclusions from palm features.
- Do not infer protected or sensitive traits from the image. Use only the gender profile the user supplies.
- Distinguish “not visible” from “absent”. Avoid false precision, exact dates, percentages, or guaranteed events.
- Keep the tone warm and elegant, not ominous, fatalistic, or manipulative.

## Completion check

The task is complete only when the report identifies the selected hand rule, separates observation from symbolism, includes gender handling, contains a faithful minimal line artwork, labels uncertainty, and includes the entertainment disclaimer. If the user supplied no usable palm image, deliver the intake instructions instead of a fabricated reading.
