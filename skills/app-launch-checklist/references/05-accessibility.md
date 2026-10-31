# Part 5 — Accessibility

Legal context for 19–21: WCAG 2.2 AA is a technical standard, not a law, but it's the benchmark for many laws — the **European Accessibility Act** (applicable since **28 June 2025** to certain products/services incl. e-commerce; microenterprises providing services exempt), public-sector rules, and US ADA case law and DOJ guidance. Which applies depends on sector, customers and size.

## 19 Colour contrast — *Good practice · Depends on jurisdiction*
WCAG 2.2 AA: **4.5:1** normal text, **3:1** large text (1.4.3); **3:1** for meaningful UI components and graphics (1.4.11).
**Check:** body text, placeholders, labels, links and disabled-looking text against real backgrounds; text over images/gradients/video at the lowest-contrast point; focus indicators, input borders, icons, chart elements at 3:1; every state (hover, pressed, error, success, disabled, dark mode).
**Fix:** adjust design-system colour tokens rather than patching screens; don't use colour as the only signal — add text/icons to errors and statuses.
**Verify:** automated contrast checker on key flows + manual review of what it can't measure; recheck after brand/theme changes.

## 20 Alt text — *Good practice · Depends on jurisdiction*
WCAG 1.1.1 requires text alternatives for non-text content.
**Implement:** concise alt describing content or function of meaningful images; empty alt (or hidden from assistive tech in native apps) for decorative images; accessible names for image buttons/icon-only controls describing the action ("Search"); text alternatives for charts/infographics (summary or data table); require alt text or a decorative flag on user-uploaded images the app publishes.
**Verify:** navigate key screens with VoiceOver, TalkBack or NVDA; automated check for missing alt, then manual quality review.

## 21 Keyboard navigation — *Good practice · Depends on jurisdiction*
WCAG 2.1.1 Keyboard, 2.1.2 No Keyboard Trap, 2.4.3 Focus Order, 2.4.7 Focus Visible, 2.4.11 Focus Not Obscured.
**Implement:** native buttons/links/controls, or correct roles + keyboard handling for custom ones; visible focus indicator everywhere (never remove outlines without replacement); tab order follows visual/logical order; dialogs take focus, trap it while open, return it to the trigger on close; "skip to main content" on pages with long nav; sticky headers, cookie banners and chat widgets never hide the focused element.
**Verify:** complete sign-up, checkout, cancellation and settings using only Tab, Shift+Tab, Enter, Space, Escape, arrows; no traps; focus always clearly visible.
