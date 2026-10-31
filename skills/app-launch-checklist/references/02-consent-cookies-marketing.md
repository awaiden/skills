# Part 2 — Consent, cookies and marketing

## 07 Cookie banner — *Depends on jurisdiction · Depends on your app*
EU/UK ePrivacy and PECR require consent for storing/reading non-essential information on a device (cookies, pixels, SDK identifiers, local storage) unless strictly necessary. The UK Data (Use and Access) Act 2025 added some exemptions (certain statistical and functionality purposes) — check current ICO guidance. Most US state laws instead require notice and an opt-out of sale/sharing/targeted ads, often honouring browser opt-out signals. **A "we use cookies" + OK banner is not valid consent in the EU/UK.** The banner is only the visible part — trackers must actually stay off (see 08).

**Prepare:** inventory every cookie, local-storage key, pixel and SDK ID with provider, purpose and lifetime; classify strictly necessary vs optional per market.
**Implement:** "Accept all" and "Reject all" with equal prominence on the first layer where EU/UK rules apply; granular per-purpose choices, optional ones off by default; link to a cookie notice naming providers, purposes, retention; persistent way to change/withdraw (footer link/settings); store each choice with banner version and timestamp; "Do Not Sell or Share"/targeted-ads opt-out and Global Privacy Control where US state laws require.
**Verify:** clean browser, reject all, confirm in dev tools no optional cookies or tracking requests fire; site/app still works normally when rejected.

## 08 Trackers off until consent — *Depends on jurisdiction · Depends on your app*
Where consent is required, optional trackers must not load, set identifiers or send data before a permitting choice. The prior-consent rule is EU/UK-specific (ePrivacy Art 5(3), PECR) and covers any device storage/access, not just cookies. Most US states require notice + opt-out (and GPC in some), not prior consent, for typical analytics; sensitive data (e.g. Washington My Health My Data Act) may need consent before collection. Essential functions (login, security, basket) must work regardless.

**Implement:** load optional scripts/SDKs only after the consent manager allows the purpose; tag managers and SDKs default off; on withdrawal stop tracking and delete/stop using identifiers; detect and honour GPC where required; keep core features independent of tracking.
**Verify:** fresh profile — no optional requests/cookies before a choice; repeat after reject and after withdrawal; repeat in the mobile app, checking advertising IDs and SDK traffic before consent.

## 09 Separate marketing consent — *Depends on jurisdiction*
Accepting terms must not auto-subscribe to marketing. EU/UK electronic marketing generally needs prior consent (ePrivacy/PECR) that's specific, unbundled and freely given, with a narrow **soft opt-in** for similar products to existing customers who were given a chance to refuse. Canada's CASL requires consent with limited exceptions. US CAN-SPAM is opt-out for email, but SMS and calls fall under stricter consent rules (TCPA).

**Design:** separate, unticked opt-in not required for account or purchase; plain explanation of what marketing and through which channels; separate choices per channel (email, SMS, push) where rules differ; soft opt-in only where conditions are met, with opt-out at collection and in every message.
**Implement:** store each consent with wording, source, date/time separately from terms acceptance; sync consent/withdrawal to every marketing tool before sending.
**Verify:** test account without opt-in never receives marketing.

## 10 Unsubscribe option in marketing emails — *Depends on jurisdiction*
CAN-SPAM: clear opt-out, processed within **10 business days**, mechanism working for at least **30 days** after sending, no fee or info beyond email + preferences, valid physical postal address. EU/UK: simple refusal in every message. Google and Yahoo require **one-click unsubscribe headers** for bulk senders. Transactional/account messages (receipts, security alerts) are separate.

**Implement:** visible unsubscribe link in every marketing email, separate from login/settings; works without login and without asking for more than email + preferences; List-Unsubscribe and one-click headers via the email provider; physical postal address for US recipients; preference centre plus a global "unsubscribe from all marketing".
**Make it work:** sync unsubscribes across email platform, CRM, in-app messaging; suppression list so addresses aren't re-imported; separate marketing and transactional sends.
**Verify:** unsubscribe a test address and confirm no further marketing from any tool; links still work on emails sent 30+ days ago.
