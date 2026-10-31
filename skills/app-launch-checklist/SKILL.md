---
name: app-launch-checklist
description: Run a pre-launch legal, privacy, accessibility and trust review of an app, website or SaaS product using a 35-item checklist covering privacy policy, terms, cookies and consent, marketing email, data rights, children's data, AI training, vendors and DPAs, WCAG accessibility, dark patterns, pricing and subscriptions, marketing claims, reviews, SOC 2, uptime, customer logos, AI labels, licences and DMCA. Make sure to use this skill whenever the user is about to ship or launch something, asks what they need before going live, or wants a GDPR, CCPA, cookie banner, accessibility, dark-pattern, checkout, subscription or cancellation audit of their product, codebase or landing page, even if they don't say "checklist".
---

# App Launch Checklist

A skill for reviewing an app before it ships, against 35 legal, privacy, accessibility and trust checks grouped into eight themes.

At a high level, a review goes like this:

- Figure out what the product is and who it's for (markets, users, features, data)
- Decide which of the 35 items apply, and note why the others don't
- Work through the applicable items, testing real behaviour wherever you can
- Rank what you found and write it up
- Close with the final pre-launch review and what needs a qualified professional

Your job is to figure out where the user is and help from there. Someone asking "what do I need before I launch my app?" needs the whole review. Someone asking "is my cookie banner OK?" needs one item in depth, so go straight to that section and skip the rest.

The research behind this checklist is current to **October 2026**. Laws, regulator guidance and app-store rules change often, so if web search is available and a finding depends on a date, threshold or rule that may have moved, look it up before presenting it as current.

## Ground rules

These shape every review, so keep them in mind throughout.

**It's general information, not legal advice.** Say so once, plainly, near the top. The user needs to know that, but piling on disclaimers makes the review harder to use, so don't repeat it.

**Policies and buttons aren't the same as behaviour.** A privacy policy, cookie banner or cancel button can exist while the product does something else. The most valuable part of a review is checking what actually happens: trackers firing before consent, an unsubscribe link that doesn't work, a cancel flow that takes nine steps. If you can reach the code or the live site, test it and report what you saw, not just what the copy says.

**Applicability comes first.** Many items depend on where users are, what data is processed, the business model, and whether the company is a controller or a processor for business customers. Marking an item "doesn't apply, because…" is a real result, not a gap, and it's part of what the user gets.

**It isn't exhaustive.** Regulated sectors (health, finance, education, gambling, employment, products for children) have extra requirements this checklist doesn't cover. If the product is in one of them, say so.

**Completing it doesn't guarantee anything:** not compliance, not app-store approval, not immunity from complaints.

### Applicability labels

Every item carries one or more of these labels. Use them in the write-up so the user can tell a legal requirement from a recommendation.

| Label | Meaning |
|---|---|
| Good practice | Sensible for most apps whatever the law says |
| Depends on jurisdiction | Requirements differ by country, region or state |
| Depends on your app | Applies according to features, users, data, business model or role |
| Get qualified advice | Usually needs review by a lawyer or specialist |

---

## Running a review

### Step 1: Scope the product

Before checking anything, work out the facts that decide which items apply. Get them from the code, the site or earlier messages first, and ask the user only for what you can't find:

- Target markets and where users are (EU/UK, California or other US states, Canada, elsewhere)
- Consumers, businesses or both
- Account creation, payments, subscriptions, free trials, in-app purchases
- Marketing by email, SMS or push
- Analytics, advertising, third-party SDKs, session replay
- User uploads or other user-generated content
- AI features: generated content, chatbots, any training on user data
- Whether children may use it
- Whether the company processes personal data on behalf of business customers (the processor role)

### Step 2: Triage all 35 items

Sort each item into: **applies**, **doesn't apply** (with the reason) or **unclear** (needs more information or advice). The index below tells you which reference file covers each one.

### Step 3: Work the applicable items

Read the reference file for each part you need. Every item there has the same shape: what it is, when it applies (with the relevant laws and dates), then actions grouped into stages such as Prepare, Implement and Verify. Do the Verify steps yourself wherever you have access.

| Part | Items | Reference |
|---|---|---|
| 1. Legal documents and disclosures | 01 Privacy policy · 02 Terms of service · 03 Checkbox to accept the privacy policy and terms · 04 Terms acceptance records · 05 Refund policy · 06 Business contact details | `references/01-legal-documents.md` |
| 2. Consent, cookies and marketing | 07 Cookie banner · 08 Trackers off until consent · 09 Separate marketing consent · 10 Unsubscribe option in marketing emails | `references/02-consent-cookies-marketing.md` |
| 3. Handling personal data | 11 Stop collecting unnecessary data · 12 Data retention limits · 13 Data access and deletion requests · 14 Parental consent for children's data · 15 No unauthorized AI training on user data | `references/03-personal-data.md` |
| 4. Vendors and third parties | 16 Audit third-party SDKs, analytics and tracking · 17 Data processing agreements · 18 Subprocessor list | `references/04-vendors-third-parties.md` |
| 5. Accessibility | 19 Colour contrast · 20 Alt text · 21 Keyboard navigation | `references/05-accessibility.md` |
| 6. Fair design and pricing | 22 Dark patterns · 23 Fake countdown timers · 24 Hidden fees · 25 Auto-renewal disclosure · 26 Easy subscription cancellation | `references/06-fair-design-pricing.md` |
| 7. Honest claims and transparency | 27 Unsupported claims · 28 Fake reviews · 29 False SOC 2 claims · 30 Realistic uptime commitments · 31 Customer logos only with permission · 32 AI-generated content labels | `references/07-honest-claims.md` |
| 8. Intellectual property | 33 Image, font and code licences · 34 Open-source licence obligations · 35 DMCA agent registration | `references/08-intellectual-property.md` |

The items cross-reference each other (for example 03 points to 04 and 09, and 07 depends on 08), so when you're in one, follow the pointer instead of re-deriving it.

Some behaviour checks you can usually run yourself when you have access:

- **Trackers and SDKs (07, 08, 16):** load the site with Playwright in a clean profile, reject optional cookies, and list every network request and cookie set before and after the choice.
- **Accessibility (19–21):** run an automated checker such as axe-core over key pages, then tab through sign-up, checkout and cancellation by keyboard. Automated tools miss a lot, so say what still needs manual or assistive-technology testing.
- **Open-source licences (34):** run a licence scanner (`npx license-checker`, `pip-licenses`, `cargo deny`, or an SBOM tool such as `syft`) instead of guessing from package names.
- **Claims (27–31):** search the site and repo for "SOC 2", "certified", "100%", "guarantee", "trusted by" and review/testimonial markup.

### Step 4: Prioritise the findings

Not every gap is equally urgent. Lead with problems that are likely unlawful or deceptive *and* visible to users, because those cause complaints and enforcement action: trackers firing before consent, pre-ticked marketing boxes, hard-to-cancel subscriptions, fake timers or reviews, hidden fees, false SOC 2 claims. Missing documents come next, then good-practice gaps.

### Step 5: Final review

Finish with `references/final-review.md`: what needs a lawyer or accessibility specialist, what to re-test on the final release build, and who owns each section going forward. For citations, `references/sources.md` lists the laws, regulator guidance and standards behind each part. Point the user to the official text instead of presenting a summary as authoritative.

---

## Report structure

Unless the user asks for something else, use this structure for a full review:

```markdown
# Launch review: [product]
One-line note that this is general information, not legal advice, plus the assumptions you made about markets and users.

## Top issues to fix before launch
A ranked list: the issue → why it matters (the law or rule) → the concrete fix.

## Checklist status
Grouped by the eight parts. For each item: ✅ done / ⚠️ gap / ❌ missing / — N/A (reason) / ❓ unclear,
with a one-line note, plus evidence wherever you verified behaviour.

## Needs qualified advice

## Re-test before release
```

For a single-item question, skip the template and answer that item in depth: what applies to their product, what's wrong or missing, and how to fix and verify it.

---

## Reference files

- `references/01-legal-documents.md` to `references/08-intellectual-property.md`: the 35 items, one file per part. Read only the parts that apply.
- `references/final-review.md`: the closing pre-launch review.
- `references/sources.md`: the laws, regulator guidance, standards and court decisions behind each part.
