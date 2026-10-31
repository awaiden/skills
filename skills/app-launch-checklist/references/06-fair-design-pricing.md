# Part 6 — Fair design and pricing

## 22 Dark patterns — *Depends on jurisdiction*
Interface choices that push people into decisions they wouldn't otherwise make: confirmshaming ("No thanks, I hate saving money"), pre-ticked add-ons, hidden decline options, nagging, disguised ads, making the privacy-friendly choice harder. Regulated by FTC Act §5, EU UCPD and DSA Art 25 (online platforms), UK DMCCA, and DPAs assessing whether consent was freely given.
**Audit:** sign-up, checkout, upgrade, cancellation, consent and notification-permission flows for pressure, trickery, asymmetry; list every pre-selected option (paid add-ons, marketing, data sharing); compare effort to accept vs decline.
**Fix:** comparable size/placement/wording for yes and no; neutral decline copy, no guilt; add-ons and optional permissions unselected by default; full price and key terms before commitment; label ads and sponsored content.
**Verify:** have someone unfamiliar complete each key flow and check they understood what they agreed to.

## 23 Fake countdown timers — *Depends on jurisdiction*
Falsely claiming a limited-time offer is an always-unfair practice under the EU UCPD and UK DMCCA; the FTC treats false scarcity/urgency as deceptive. Timers are fine when they reflect a real, honoured deadline.
**Audit:** find every countdown, "only X left", "Y people viewing" and limited-time message across app, site and emails; confirm each is driven by real data.
**Fix:** remove timers that reset on reload, restart per visitor or run past the deadline; ensure the offer really ends/price changes at zero; base scarcity/popularity messages on live data or remove them.
**Verify:** reload, private window, different device — same real deadline each time; after the deadline, old terms are gone.

## 24 Hidden fees — *Depends on jurisdiction*
Drip pricing adds mandatory fees late in checkout. FTC Rule on Unfair or Deceptive Fees (16 CFR Part 464, in force **12 May 2025**) requires total-price display for **live-event tickets and short-term lodging** (deceptive fees elsewhere can still breach the FTC Act). California bans advertising prices excluding most mandatory fees (Civ. Code §1770(a)(29), since **1 July 2024**). EU requires total price incl. taxes before purchase; UK DMCCA treats unavoidable fees left out of the headline price as misleading.
**Audit:** list every checkout fee as mandatory/optional; compare price on listing, product page, basket and payment screen.
**Fix:** include all mandatory fees in the first price shown (or follow each market's total-price rules); show taxes, shipping and genuinely optional extras clearly before payment; full breakdown and total before payment details; optional extras opt-in.
**Verify:** test purchase — amount charged matches the first total shown.

## 25 Auto-renewal disclosure — *Depends on jurisdiction · Depends on your app*
US ROSCA requires clear disclosure of material terms and express informed consent before charging for online negative-option offers. California's Automatic Renewal Law adds disclosure, consent, acknowledgement, reminder and price-change notice rules. EU/UK require total price and contract duration/renewal terms pre-purchase. Apple and Google have their own rules.
**Disclose:** next to the purchase button — renews automatically, renewal price, billing frequency, how to cancel; when a free trial converts and the amount; express agreement before charging.
**Confirm and remind:** post-purchase acknowledgement repeating renewal terms and how to cancel; renewal reminders and price-change notices where required.
**Verify:** as a new user, renewal terms visible on the purchase screen without opening other pages; in-app price/terms match store listing, website and confirmation email.

## 26 Easy subscription cancellation — *Depends on jurisdiction · Depends on your app*
Cancel as easily as sign-up. The FTC's 2024 "click-to-cancel" amendments to the Negative Option Rule were **vacated by the Eighth Circuit in July 2025**, but ROSCA still requires a simple way to stop recurring online charges, and states apply (California ARL, online cancellation as amended from **1 July 2025**). EU withdrawal-function rule and national laws (e.g. Germany's cancellation button) apply in Europe. The UK DMCCA subscription regime was reported in April 2026 as expected to start in **spring 2027**. App-store subscriptions are cancelled through the store.
**Design:** online sign-ups can cancel online in the same app/site without calling or chatting; clearly labelled option in account/billing settings; retention offers only as allowed, always letting the user continue; for store subscriptions, link directly to the platform's management page.
**Make it work:** stop future charges on confirmation and state when access ends; send confirmation; sync status across billing provider, app stores and your DB.
**Verify:** time the flow, count steps, compare with sign-up, confirm no further charge.
