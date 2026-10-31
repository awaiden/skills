# Part 1 — Legal documents and disclosures

## 01 Privacy policy — *Depends on jurisdiction · Depends on your app*
Public explanation of what personal data is collected, why, on what legal basis, who receives it, how long it's kept, and how people exercise rights. Must be written from an inventory of **real data flows**, not a template. Required by EU/UK GDPR (Arts 13–14), CalOPPA (California residents), CCPA content rules (if thresholds met), and Apple/Google for most apps.

**Prepare:** list every category of personal data collected by app, site, backend, logs and third-party tools (incl. device IDs and IP addresses); purpose of each (+ lawful basis for EU/UK); every recipient (hosting, analytics, email, payment, support, AI providers); transfers outside EU/UK/source country and the safeguard for each.

**Core disclosures:** identity + contact of the responsible business (and privacy contact/DPO where required); data categories incl. automatically collected; plain-language purposes; recipients/categories; retention period or criteria per category; each applicable right and how to exercise it; any sale/sharing, targeted ads, profiling or automated decision-making actually performed; general security description without overstating (good practice); effective date and archived previous versions; how material changes are notified.

**If EU/UK GDPR applies:** lawful basis per purpose and legitimate interests pursued; right to withdraw consent; right to complain to a supervisory authority; international transfers + safeguard + how to get a copy; whether providing data is statutory/contractual and consequences of not providing; automated decisions with legal/similar effect and meaningful logic info; EU/UK representative if established outside and required; sources of data obtained from third parties.

**If US state laws apply:** CCPA content (categories collected, sources, purposes, categories sold/shared/disclosed); how to submit and verify requests and use authorised agents; "Do Not Sell or Share" and "Limit the Use of My Sensitive Personal Information" links where triggered; notice at collection; update at least every 12 months; how the app responds to Do Not Track (CalOPPA); extra items for other states whose thresholds you meet (e.g. appeals). COPPA notices if child-directed (see 14).

**Readable and available:** plain language, descriptive headings; each marketed language (good practice); linked from site footer, sign-up flow, app settings and both store listings; App Store privacy details and Google Play Data safety form consistent with the policy.

**Verify:** compare line by line against live data flows, SDK list and network traffic, and fix mismatches; policy loads without login, on mobile, and isn't blocked by the cookie banner; schedule review on every new vendor, feature, data category or market.

## 02 Terms of service — *Good practice · Get qualified advice*
The contract with users. No statute requires every app to have terms, but without them you have little protection, and app stores, payment providers and consumer laws expect certain terms. Consumer laws make unfair/hidden terms unenforceable and prevent excluding statutory rights.

**Draft:** service, eligibility (incl. minimum age) and account responsibilities; acceptable-use rules and enforcement steps; who owns user content, the licence users grant you, and ownership of generated outputs; pricing, billing, renewals, refunds, cancellation consistent with refund/subscription pages; liability limits, disclaimers and dispute clauses only after checking consumer enforceability per market; how changes are notified and take effect.
**Implement:** present at sign-up and purchase with a clear acceptance step; reachable from footer and settings; version terms and store which version each user accepted (see 04).
**Verify:** product, pricing and support actually match every promise; lawyer review for each consumer market.

## 03 Checkbox to accept the privacy policy and terms — *Good practice · Depends on jurisdiction · Get qualified advice*
Important qualification: terms are a contract the user **accepts**; a privacy policy is a notice that should usually be **acknowledged**, not "accepted", because under GDPR consent is only one lawful basis. Optional consents (e.g. marketing) must be separate, specific and not a condition of service. **Pre-ticked boxes are not valid GDPR consent** (Planet49, CJEU 2019). US courts enforce online terms where notice is reasonably conspicuous and assent is clear (Berman v. Freedom Financial Network, 9th Cir. 2022).

**Design:** terms link and acceptance control next to the account-creation/purchase button; unticked checkbox or clear "By creating an account you agree to…" right above the button, per legal advice; links visible, descriptive, openable before acceptance; privacy wording as acknowledgement ("I have read the Privacy Policy"); optional consents on separate, non-required controls (see 09).
**Implement:** block account creation until required acceptance is given and save the record (04); re-ask existing users on material changes.
**Verify:** on small screens the links and checkbox are visible without scrolling past them.

## 04 Terms acceptance records — *Good practice · Get qualified advice*
Evidence that a user agreed to a specific version at a specific time in a specific way. GDPR Art 7(1) requires demonstrating consent where relied on; E-SIGN recognises electronic records/signatures subject to conditions.

**Capture:** user/account ID, document name + version, date/time with time zone; how acceptance happened (checkbox, button text, screen); archived copy of every version exactly as shown; optional consents given/refused, recorded separately.
**Protect:** append-only records; include in retention schedule and backups.
**Verify:** for a test user, show the exact version accepted and when.

## 05 Refund policy — *Depends on jurisdiction · Depends on your app*
Must be consistent with statutory rights you usually can't remove. EU/UK consumers usually have a **14-day withdrawal right** for distance contracts; for digital content it can end once supply begins if the consumer gave prior express consent and acknowledged losing the right. EU traders must provide an **online withdrawal function** for online distance contracts from **19 June 2026** (Directive (EU) 2023/2673). In-app purchases are refunded via Apple/Google. US rules vary by state and sector.

**Write:** which products/plans are refundable, time limit, conditions; how to request and processing time; how statutory withdrawal rights work for your product incl. lawful exceptions; app-store customers request refunds from Apple/Google.
**Implement:** show policy/link before purchase and in confirmation; collect the express consent + acknowledgement if relying on the digital-supply exception; EU online withdrawal function + receipt confirmation where applicable; train support and configure payments to apply the policy consistently.
**Verify:** run a test refund end to end; timing and amount match the policy.

## 06 Business contact details — *Depends on jurisdiction*
EU e-Commerce Directive Art 5 requires name, geographic address, email and registration details; Germany requires an Impressum (DDG §5); DSA adds points of contact for intermediaries; UK has similar e-commerce and company disclosure rules; CAN-SPAM requires a postal address in commercial email; app stores show developer/trader details (incl. EU trader status).

**Publish:** legal entity name exactly as registered (not just brand); geographic address and working email/form; registration number, place of registration and VAT number where required; regulator/licence details for regulated activities; reachable from every page (footer) and in-app.
**Align:** same entity details in terms, privacy policy, invoices, emails and store listings.
**Verify:** send a test message through each contact route; someone receives and answers it.
