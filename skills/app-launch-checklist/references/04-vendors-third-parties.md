# Part 4 — Vendors and third parties

## 16 Audit third-party SDKs, analytics and tracking — *Good practice · Depends on jurisdiction · Depends on your app*
You're responsible for what SDKs, pixels, session replay and widgets send. FTC has acted against health apps sharing sensitive data via ad pixels (e.g. GoodRx, 2023). Apple requires privacy manifests and accurate App Privacy details; Google Play requires an accurate Data safety form including SDK collection.

**Inventory:** every SDK, script, pixel and widget with version and owner; what each collects, where it sends it, why.
**Inspect:** capture real traffic with a proxy or dev tools; check whether URLs, page titles, form fields or event names leak sensitive data (health, financial, search); disable unneeded vendor features (ad IDs, session replay, auto-capture).
**Act:** remove unused/unjustifiable SDKs; update privacy policy, cookie notice, App Privacy and Data safety to match; contracts with each vendor receiving personal data (17).
**Verify:** re-run the traffic capture after each release that adds/updates SDKs.

## 17 Data processing agreements — *Depends on jurisdiction · Depends on your app · Get qualified advice*
GDPR Art 28(3) requires a written contract with specific terms whenever a processor acts for a controller; CCPA requires specified terms with service providers/contractors. Transfers may need SCCs or an adequacy decision (e.g. EU-US Data Privacy Framework for certified companies). If you're the vendor to businesses, offer your own DPA.

**Map:** each vendor processing personal data and its role (processor, service provider, independent controller); which transfer data abroad and the safeguard.
**Contract:** accept/sign each vendor's DPA and confirm required terms; keep copies with dates/versions in one place; prepare your own DPA + transfer terms if you process for business customers; ensure vendors can't use your users' data for their own purposes (ads, model training) unless agreed.
**Maintain:** review when vendors change terms, add sub-processors or move data.

## 18 Subprocessor list — *Good practice · Depends on jurisdiction · Depends on your app*
No general law requires every app to publish one. But under GDPR Art 28(2) and (4), a processor needs the controller's authorisation for sub-processors and must inform of changes so the controller can object — a maintained public list with change notifications is the usual way. Consumer apps acting as controllers instead disclose recipients in the privacy policy.

**Prepare:** decide whether you're a processor for business customers and what your DPA promises; list each sub-processor's name, service, data and location.
**Publish:** stable URL referenced in the DPA; change-notification subscription; advance notice of new sub-processors for the promised period and handle objections per the DPA.
**Maintain:** update the list in the same release process that adds/removes a vendor.
