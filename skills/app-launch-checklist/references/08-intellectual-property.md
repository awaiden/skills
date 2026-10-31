# Part 8 — Intellectual property

## 33 Image, font and code licences — *Good practice · Get qualified advice*
Every image, icon, font, sound, video and snippet has copyright and a licence; "found online" isn't one. Common problems: editorial-only stock images, desktop font licences used for web/app embedding, Creative Commons non-commercial assets in commercial products, forum code without attribution. For AI-generated assets check the tool's terms; the US Copyright Office's position is that material without sufficient human authorship isn't protected, which may limit your own rights.
**Inventory:** every image, icon set, illustration, font, audio, video and copied snippet in product and marketing; source, licence type, holder and proof for each.
**Check:** commercial use in your specific media (app, ads, merch); font licences cover web/app/logo/PDF embedding as used; CC attribution and share-alike terms, no non-commercial licences in commercial products; AI tool terms on ownership and permitted use.
**Fix:** replace assets whose licence can't be confirmed or doesn't cover the use; add attributions to a credits page.

## 34 Open-source licence obligations — *Good practice · Get qualified advice*
Permissive licences (MIT, BSD, Apache-2.0) mainly need notices and attribution; Apache-2.0 adds NOTICE-file and patent provisions. Copyleft (GPL, LGPL) can require source when distributing; **AGPL extends this to network use**. Obligations depend on how you use, modify and distribute — non-trivial cases need specialist review.
**Inventory:** generate an SBOM of all direct and transitive dependencies with versions and licences; flag copyleft/unclear licences before release.
**Comply:** include copyright notices and licence texts in the app (e.g. "Open-source licences" screen); include Apache NOTICE contents; decide with advice how copyleft applies to your distribution model and provide source/written offers where required; keep licence/notice requirements of copied and vendored code.
**Maintain:** automated licence checks in the build pipeline.

When you have access to a repo, actually run a licence scan (e.g. `npx license-checker`, `pip-licenses`, `cargo deny`, or an SBOM tool such as `syft`) rather than guessing from package names.

## 35 DMCA agent registration — *Depends on jurisdiction · Depends on your app*
Matters if the app hosts/stores user-uploaded content and wants US safe harbor under 17 U.S.C. §512(c): designate an agent, publish their contact details on the service, register in the Copyright Office's online directory. **Registrations expire after three years** unless renewed (37 CFR §201.38). Other conditions: repeat-infringer policy and expeditious takedown. Other countries have their own regimes (e.g. EU DSA notice-and-action). If users can't upload or share content, this may not apply.
**Decide:** does the app host, store or display user uploads; which safe-harbor and notice regimes apply.
**Implement:** register a designated agent in the DMCA Designated Agent Directory and pay the fee; publish agent name, address, phone, email on site and in terms; copyright policy for notices and counter-notices; repeat-infringer termination policy; internal workflow to remove/disable reported material quickly and notify the uploader.
**Maintain:** calendar reminder to renew before three-year expiry and whenever details change.
