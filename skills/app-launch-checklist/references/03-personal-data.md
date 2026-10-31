# Part 3 — Handling personal data

## 11 Stop collecting unnecessary data — *Good practice · Depends on jurisdiction*
Data minimisation: core GDPR principle; CCPA requires collection reasonably necessary and proportionate. Less data also means less breach impact, request handling and store disclosure work.

**Review:** list every form field, permission request, SDK data point and log field with its purpose; mark required / optional / not needed.
**Reduce:** remove fields and permissions with no current purpose; mark optional fields clearly; request device permissions (location, contacts, camera) only when a feature needs them, with an explanation; use less precise data (approximate location, age range); stop logging passwords, tokens, payment data, health details; disable unused SDK/analytics collection.
**Verify:** inspect real network traffic and logs to confirm removed data is no longer collected or sent.

## 12 Data retention limits — *Good practice · Depends on jurisdiction*
GDPR storage limitation; CCPA requires disclosing retention per category. Other laws set *minimum* periods (tax, accounting, employment), so balance both.

**Decide:** retention schedule (category, purpose, period, reason); legal minimums for invoices/tax/accounting/disputes per country; what happens at expiry (delete, anonymise, restricted archive).
**Implement:** automated deletion/anonymisation for databases, file storage and search indexes; retention settings in analytics, logging, error tracking, support and email tools; include backups and document how deleted data ages out; disclose periods or criteria in the privacy policy.
**Verify:** run a test record through its lifecycle and confirm removal everywhere it was copied; review schedule at least annually and on new categories/vendors.

## 13 Data access and deletion requests — *Depends on jurisdiction · Depends on your app*
GDPR: access, rectification, erasure, portability; response normally within **one month**, extendable by up to two more. CCPA: know, delete, correct; generally **45 calendar days**, extendable once by 45. Other US states similar. **Apple and Google require in-app account deletion** for apps with account creation; **Google Play also requires a web deletion option**.

**Set up:** at least one easy request channel (in-app form or privacy email) plus any market-required methods; proportionate identity verification without excessive extra data; map where each user's data lives (DBs, storage, analytics, support, email, backups).
**Fulfil:** readable, common-format export; in-app deletion that removes/anonymises data, not just deactivates; pass deletions to processors/vendors; document legal exceptions (e.g. invoices) and tell the user what was kept and why; log each request, dates, verification, outcome.
**Verify:** full test request — export complete, deletion reaches every system.

## 14 Parental consent for children's data — *Depends on jurisdiction · Depends on your app · Get qualified advice*
US COPPA: services directed to under-13s or with actual knowledge; the amended COPPA Rule (incl. separate consent for most third-party disclosures) has applied since **22 April 2026**. GDPR Art 8: parental consent where relying on consent for children under 16 (or a national age not below 13). UK sets 13 and applies the Age Appropriate Design Code. Several US states add rules for minors.

**Assess:** decide with evidence whether the app is directed to or likely used by children in each market; proportionate age assurance that doesn't over-collect.
**Implement:** collect only what's needed to request parental consent until obtained; use a verifiable consent method recognised in the jurisdiction; direct notice to parents; separate parental consent for third-party disclosures (e.g. ads) where COPPA requires; high-privacy defaults (no geolocation, profiling, public profiles); parents can review, delete and withdraw.
**Verify:** no tracking, ads or analytics data about the child leaves the app before consent.

## 15 No unauthorized AI training on user data — *Depends on jurisdiction · Depends on your app · Get qualified advice*
Training/fine-tuning/improving models is a separate purpose from providing the service: needs its own lawful basis and compatibility with what people were told (EDPB Opinion 28/2024). The FTC has warned that quietly changing terms to allow training on previously collected data may be unfair or deceptive. DPAs with business customers usually forbid processors using data for their own purposes. Includes data sent to AI vendors who may train on it by default.

**Map:** every place user/customer data could reach training, fine-tuning, evaluation or prompt logs; each AI vendor's terms and settings for training, retention and human review.
**Control:** disable vendor training where possible and keep written confirmation; exclude business customers' data unless the contract permits; lawful basis + clear notice (+ opt-out/consent where required) before any first-party training; apply data-use changes going forward only unless users agree to new uses of past data; separate training datasets from production with documented sources and deletion handling.
**Verify:** confirm with vendors and internal teams no unauthorised training pipeline exists; record the check.
