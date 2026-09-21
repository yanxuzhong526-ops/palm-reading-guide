# Minimal luxury report specification

## Visual direction

Aim for a quiet editorial object: black ink, warm white paper, hairline rules, large margins, restrained serif display type, neutral sans-serif body type, and softly rounded cards. Avoid gradients, gold simulation, drop-shadow-heavy UI, mystical clichés, zodiac graphics, purple palettes, stock hand photos, and crowded labels.

### Design tokens

- Canvas: `#F7F6F2` or pure white for strict monochrome.
- Ink: `#111111`; secondary text `#5F5F5A`; faint rule `#D9D8D2`.
- Card: `#FFFFFF`; border 1 px; radius 18–24 px.
- Display font: `Cormorant Garamond`, `Bodoni Moda`, or a refined system serif fallback.
- Body font: `Inter`, `Noto Sans SC`, or a clean system sans-serif.
- Line artwork: 1.25–1.75 px, round caps and joins, no fill.
- Generous spacing: 48–72 px outer margins on screen; 14–18 mm in A4 print.

## Recommended sequence

1. Cover: title, short subtitle, subject profile, date, and a small folio.
2. Hero spread/card: palm contour artwork beside the executive reading.
3. Observation card: only visible facts, no symbolism.
4. Three major-line cards: heart, head, life.
5. Fate and secondary-line card when assessable.
6. Form card: hand shape, fingers/thumb, mounts.
7. Comparison card: primary versus comparative hand.
8. Synthesis card: strengths, tensions, reflection prompts.
9. Method note: mode, gender branch, confidence, and disclaimer.

Keep cards short enough that each has a clear visual hierarchy. Prefer 1–3 paragraphs and small metadata rows over dense bullet walls.

## Contour artwork

The artwork is a simplified trace of the supplied palm, not a generic icon. Include:

- Outer palm/finger silhouette when visible.
- Wrist crease only if present in the frame.
- Heart, head, and life lines.
- Fate line only when visible with at least medium confidence.
- Optional secondary lines in a lighter stroke.

Use no text inside the palm. If labels are needed, place them outside with short leader lines. Preserve the actual relative start points, endpoints, crossings, and curvature. Omit uncertain detail rather than inventing it.

## Writing style

- Elegant, calm, specific, and non-fatalistic.
- Lead with evidence: “可见…”, then interpretation: “在传统手相语境中…”.
- Use short section titles and a strong summary sentence.
- Avoid generic fortune-cookie claims and inflated certainty.
- Make gender handling explicit once in the method note, then focus on the palm.

## Deliverables

When file output is requested, prefer:

- `palm-reading-report.html`: editable and print-ready.
- `palm-contour.svg`: standalone artwork.
- Optional `palm-reading-report.pdf`: export from HTML with backgrounds enabled.

Before delivery, check A4 page breaks, font fallback, SVG visibility, contrast, overflow, and whether every interpretation is traceable to a visible observation.
