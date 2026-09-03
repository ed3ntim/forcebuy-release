# Changelog

## 0.1.10 - account standing, trade maths, and the catalogue by float

### Account standing

- **ForceBuy now reads whether an account may trade at all**, with every
  inventory sync and without an API key: a VAC ban on record, a trade ban, trade
  probation, a limited account. It comes off the public profile, so it works for
  any inventory you can see.
- **Items that cannot be sold are framed in red** in the trade lock column, and
  the inventory says so above the table. This is the number it qualifies: a
  banned account's portfolio value is theoretical, and a ledger should not print
  it as if it could be cashed.
- **One question is yours to answer.** Steam states that an account has a VAC
  ban but never which game it was issued in - and a ban only blocks the items of
  that game. The Inventories page asks once; until it is answered, affected
  items are framed in amber and read "maybe blocked" rather than claiming
  either way.
- A trade lock timer stays amber. It expires on a known day and is part of
  normal trading; a ban is not the same kind of fact.

### Currency

- **Trade maths**, on the Currency page: gross for a quantity, the marketplace's
  cut, what actually arrives, the price to ask to break even, and the price to
  ask for a wanted margin - plus all of it in a second currency at the stored
  rate, with the rate and its date shown. The fee arithmetic is the same code
  the ledger values holdings with, so the calculator cannot disagree with the
  portfolio.

### Catalogue

- **Filter by the float range a skin can exist in**, matching on overlap: a skin
  that runs 0.00 to 0.80 answers "can this be had below 0.07" with yes.
- **Filter by release window.** A definition with no stated release date is in
  no window - putting it in one would be an invented date.

### Prices

- **esportfire is gone.** It publishes no API: no documented endpoint, no
  developer docs, a client-rendered page. Reading its internal endpoint would be
  a promise nobody made and would break on their next deploy. Two sources that
  do document public access - cs2.sh and CSMarketCap - take its place as index
  sources, registered and reporting themselves as not configured until a key is
  set.

## 0.1.9 - the round of small things that were wrong

### Fixed

- **Widget menus are no longer cut off.** The three-dot menu was drawn inside
  the widget, and a widget hides its overflow - so a small one showed two of
  five options with nothing to suggest the rest existed. It is now placed
  against the window, opens upwards when there is more room there, and scrolls
  inside the space it gets.
- **Portfolio value over time counted the wrong thing.** Each day only counted
  items that happened to be repriced that day, and the price job deliberately
  skips names it refreshed recently - so the line measured refresh activity
  rather than value, and would have dropped by half on a day when half the
  ledger was skipped. Each day now values the whole ledger with the last price
  known at that point. (With one day of price history there is still only one
  point; the series grows with each refresh.)
- **The quantity column said the same thing twice** ("16 ×16"). The copy count
  now appears only when it differs from the item count.
- **History says which account each entry belongs to**, on the timeline and as
  a column on the transactions tab. With two inventories the item name alone
  did not say whose trade it was.
- **esportfire is no longer presented as a marketplace** on the prices page. It
  reads the market as a whole; a row next to ask and bid looked like a price you
  could trade at.

### Holdings

- **Filter by origin** - Steam Market, in-game store, trade, drop, unboxed,
  crafted, or a marketplace. Only origins that occur in your ledger are offered,
  and the filter runs in SQL so counts and paging stay right.
- **Filter by whether the float is known**, now that float arrives with the
  inventory.

### Catalogue

- **Filter by what you own**, or by what you do not. Answered in the database
  rather than over the fetched page, so it is a real answer for sixteen thousand
  definitions and not for the sixty on screen.

### Inventories

- **The sync buttons say what they do.** Four buttons across two rows read as
  the same pair twice; "full market backfill" in particular said nothing about
  what it fetches. They are now grouped per data set - inventory history, market
  history - each with "Sync new" and "Sync all", and a line explaining that one
  reads what has appeared since the last run and the other re-reads everything.

### Demo mode

- **Demo rows carry provenance the way real ones do.** They used to put a
  marketplace name in the field that ranks how trustworthy a number is, which
  made every demo row overwritable by anything. Items now arrive by market
  purchase, in-game store, drop, mission reward, trade, trade-up, unboxing or a
  marketplace receipt - and only the ones with a receipt have a price, which is
  what a real ledger looks like and the most common question about it.

## 0.1.8 - float and pattern, from Steam itself

### Float and pattern

- **Every skin now shows its float and pattern.** They were in the inventory
  answer all along - it just has to be asked for, with a parameter Steam's own
  inventory page passes and this app did not (`raw_asset_properties=1`). The
  previous release listed them as a known limit that needed a third-party
  inspect service; that was wrong, and the correction cost one request.
  Verified against a real account: 40 of 40 skins, and it works for public
  inventories too, with no account connected.
- Paint index arrives with them. The property ids are read from Steam's own
  schema rather than assumed.
- **Inspect links work again.** Steam hands out a link template whose missing
  piece is one of those same per-item properties. Without it, the link was
  stored with the placeholder still in it - looking real, inspecting nothing.

### Holdings

- **Origin on the item page**, next to what the item is worth, with the raw
  fields behind it as a hint - so "why does it say Steam Market" has an answer
  without opening the database. The pattern is shown under the float, and a sold
  item says which marketplace it went through.
- **A marketplace can be an origin.** When a Steam trade is reconciled against a
  purchase on CSFloat or Buff163, the origin is that marketplace: Steam only saw
  an item arrive, the marketplace knows what was paid, and tying the two
  together is the point of the reconciliation. That case used to read "unknown".

### Prices

- **esportfire is no longer listed as a marketplace.** It reads the market as a
  whole - indices and trends - and a row for it next to the marketplaces looked
  like a price you could trade at.

### Still open

- StatTrak kill counts and per-sticker scrape levels are not among the item
  properties, and neither are items outside your own inventory. Those still need
  an inspect service, and the public one currently refuses automated requests.

## 0.1.7 - where an item came from, and what it costs elsewhere

### Holdings

- **An "Origin" column**, shown by default: Steam Market, in-game store, trade,
  drop, unboxed, crafted, storage unit, or the marketplace that sold it. The
  ledger already stored both halves of that answer - what happened, and who
  reported it - but never put them together into the one word someone actually
  asks for.
- **Prices by marketplace**, on the item page. One row per marketplace with its
  ask, bid and how old the number is, and a button that asks every configured
  source about this one item. The scheduled refresh walks the whole ledger
  through a single source; this is the opposite, and it is what you want before
  deciding where to sell.
- A marketplace with nothing to show says why - "not set up" for a source that
  needs a key or is not implemented, "not asked yet" otherwise. An empty row is
  not the same as a cheap item.

### Fixes

- **Unusable inspect links are no longer stored.** Steam hands some inventories
  a link template it fills in itself (`%propid:6%`) rather than one that names
  the item. Substituting nothing into it produced a link that looked real,
  inspected nothing, and cost inspect budget on every sync.

### Known limits

- **Float and pattern stay empty for most items.** ~~They are not in the
  inventory JSON.~~ This was wrong: they are, and 0.1.8 shows them. The
  inventory request simply never asked for them.
- **A purchase price only exists where a receipt does.** Steam's market history
  is the only source that says what was paid, so an item that arrived by drop,
  trade, unboxing or from the in-game store has a date but no price until you
  enter one. Prices from other marketplaces need that marketplace connected.

## 0.1.6 - purchase dates, and every copy on its own row

The first release where the Steam history actually reaches the ledger. It was
verified against a real account: 731 events going back to 2014, and after the
sync every one of the 75 items held carries a purchase date.

### Inventory history

- **History syncs now store anything at all.** Four separate faults each broke
  it on their own. The event key was built from timestamp, wording and items -
  but Steam only renders minutes, so listing two identical cases in the same
  minute produced one key for both rows, the batch insert hit the unique index,
  and the whole page was lost with it. Steam's own row id is the key now.
- **Events point at a specific copy.** Each incoming item links to its inventory
  anchor, and that anchor is an asset id - present on all 529 incoming lines in
  the sample. Tying an event to a copy is a fact now, not a guess.
- **Five phrasings Steam really writes** were being filed as "other", and
  "other" is not an acquisition: "Purchased from the store" (the in-game store,
  52 times in the sample), "Mission reward", "Leveled up a challenge coin",
  "Sticker applied/removed" and "Name Tag applied". The first three now count as
  acquisitions; sticker work and support corrections deliberately do not,
  because they move items without saying anything about a purchase.
- **One acquisition per copy.** Sixteen sticker capsules and seven events that
  brought capsules in all resolved to the same row, leaving fifteen copies
  undated. Where the source cannot name the copy, the one still in the account
  is now preferred over an older row that has long since been sold.

### Holdings

- **Every copy is stored under its own asset id.** Steam marks capsules, cases
  and graffiti `commodity: true`, which means fungible on the market - not that
  the account holds them as one stack. Sixteen capsules are sixteen assets.
  Rows written the old way are taken over rather than abandoned, so a cost basis
  you typed in survives the change.
- The acquisition date is shown by default in the holdings table.

### Market history

- **Only CS2 rows are imported.** Steam's market history covers the whole
  account: 189 of 423 rows on the test account were trading cards, emoticons and
  profile backgrounds that no CS2 ledger can ever match against an item.

### Pictures

- **Items you own are fetched before items you are only browsing.** Both draw
  from the same throttled Steam CDN, and opening the catalogue used to put
  hundreds of pictures of items nobody owns ahead of the handful in the ledger.
- An inventory sync warms the picture cache for what it just synced, so the
  holdings table opens as a table of items rather than of grey boxes.

## 0.1.5 - the Steam connection works

Connecting an account and syncing a private inventory failed for three unrelated
reasons, all of which looked like the same thing: "Steam is not answering".

### Fixes

- **The inventory sync asked for too much per page.** Steam answers a request
  for more than 2000 items with a `400` and a body of `null` - which reads like
  a broken request rather than a too-large one. Every sync failed on it, public
  or private, and a private inventory never got as far as saying it needed
  access.
- **Connecting a cookie always reported it as expired.** The check used
  `/my/?xml=1`, and Steam redirects that to the login page even for a perfectly
  valid session - while the same cookie was opening the private inventory. The
  check now uses `/my/` and reads the account out of the redirect.
- **Inventory history came back empty.** Steam answers every `/my/…` path with a
  redirect to the account's own profile URL, and authenticated calls refused to
  follow any redirect at all. They now follow up to two hops, each checked
  against the host list before the cookie travels with it.
- **"Node.js is not installed" when it was.** The Windows launcher asked
  `where node`, and `where.exe` lives in System32 - on a machine whose PATH has
  lost that entry, the check itself is what fails, not Node. The launcher now
  runs `node --version` and uses nothing but cmd's own built-ins.
- Importing the cookie from a running Chrome now says what is actually wrong.
  Chrome keeps its cookie file locked while it runs and encrypts cookies so that
  only Chrome can read them; both are now reported as such instead of as
  "profile could not be read".

### Holdings

- **Identical copies are one row.** Two thousand cases were two thousand lines.
  Only copies that carry nothing to tell them apart are folded together, so
  skins - float and pattern make every one a different object - are never
  stacked. Location, storage unit, trade lock and collection membership are part
  of the grouping, so a row never averages away something it is showing. Switch
  it off with "Every copy" when you need to correct a single item.

## 0.1.4 - demo mode, and the first round of test feedback

Versions 0.1.1 to 0.1.3 were intermediate steps while the release automation
was being fixed; 0.1.4 is the first build that carries real changes since the
first test build.

### Demo mode

- A throwaway inventory you can switch on in Settings or during setup, so the
  app has something to show before a Steam account is connected: 50 skins (some
  with stickers applied), 2 agents wearing patches, 30 loose stickers and 2000
  containers spread over 5 storage units.
- Prices, purchase dates and marketplaces are varied rather than uniform, so
  every panel - portfolio, analytics, storage units, reconciliation - renders
  something meaningful instead of a flat line.
- Switching it off deletes the whole demo inventory and leaves nothing behind.

### Fixes from the first test round

- **Steam cookie handling.** The cookie parser now accepts what browsers
  actually put on the clipboard, including quoted values from the DevTools
  copy action. A missing `sessionid` is generated instead of failing the
  connection, which was the most common cause of "the cookie does not work".
- **The cookie can be entered during setup**, not only afterwards in Settings.
- **Stickers and charms only go on weapon skins; patches only go on agents.**
  Previously the editor offered them on every item, including on stickers
  themselves.
- **Filters follow the item type.** Float, paint seed and wear no longer
  appear while the list is showing stickers or containers, and holdings can be
  filtered by item type directly.
- Clearing the search box now clears the filter. It used to keep the last
  search active until you pressed Enter again.
- Filter dropdowns grow to fit their contents instead of truncating.
- The loading overlay is translucent, so the app stays readable underneath.
- The status bar shows every running job, not just the first one.

### Settings

- **Logs**: the last twenty sync runs with their error messages.
- **Notifications**: an opt-in browser notification when a sync fails.
- **Passcode**: an optional passcode prompt before the app opens. It keeps
  another person on the same machine out; it is not encryption, and anyone who
  can read the data folder can still read the ledger.

### Under the hood

- Database migrations run automatically on start and report what they changed.
- Marketplace reconciliation is scoped per inventory, so a trade can no longer
  be matched against the wrong account when several are configured.

## 0.1.0 - first test build

The first version handed to test users. It ships as a runnable build: unzip or
clone, start it, and the interface and the server come up together on one port.
Node.js 20+ is the only thing that has to be installed.

Everything below already works; what does not is listed in the README under
"What does not work yet".

### Ledger

- Steam inventories, public or connected. A connected account also gives
  inventory history, market history and storage unit movement.
- Cost basis with a precedence rule that never lets a weaker source overwrite a
  stronger one: what you typed beats a receipt, a receipt beats an inference.
- **Marketplace reconciliation.** Steam records that an item arrived by trade
  but not what it cost; CSFloat records the payment but not which copy it
  bought. ForceBuy matches the two, by asset id where the marketplace names one
  and by name, direction and a six-hour window otherwise. A crowded window is
  reported as ambiguous instead of being guessed, and nothing Steam already
  priced can be paid for twice.
- Manual holdings for anything held outside Steam.
- Applied stickers and charms, editable per item.

### Catalogue

- Every CS2 item, grouped so a skin is one row with a float range rather than
  thirty rows of wear variants.
- Item kind taken from the source file rather than the mixed `category` field,
  so "containers only" is a filter that works.
- Sticker finish, sticker type and tournament read from the source where it
  states them. Container release dates likewise. Nothing inferred.
- Refreshing is a delta: unchanged source files are not downloaded, unchanged
  rows are not written. A refresh that finds nothing takes under a second.
- "Full re-read" additionally pulls the combined dump for anything the typed
  files do not list.

### Currency

- A currency calculator on its own page, on European Central Bank reference
  rates. USD, EUR and CNY always side by side, because that is what the market
  runs on.
- The ledger can be kept in USD, EUR or CNY.
- A payment in another currency is converted at the published rate, and the
  note on the item says which rate on which day - so the number can be
  explained rather than just believed. An unknown pair converts to nothing
  rather than to a guess.

### Prices

- Steam Community Market (no key) or CSFloat (key), ask and bid stored apart.
- Manual overrides per item, which beat everything fetched.
- Request budgets per endpoint with persistent cooldowns, so a throttle is
  visible and survives a restart instead of being rediscovered every time.

### Dashboard and analysis

- Build any chart from a source, a measure, a grouping and filters.
- 34 ready-made panels across portfolio, allocation, performance, activity and
  item quality.
- Trade lock as a real measure, including a calendar of what becomes tradable
  when, and holding-period analysis.
- Several workspaces as tabs, arranged by dragging.

### Tables

- Column choice and order per page, saved views stored in the database.
- Filters for float, paint seed, cost, acquisition window, applied stickers and
  charms, in-game collection and rarity.

### Getting around

- Setup is three steps, not six, and only the first is required.
- Light theme by default; dark is one click away and sticks.

- Command palette on `Ctrl+K`, matching letters in sequence.
- `g` plus a letter to jump between pages.
- Undo on bulk actions.
- Number and date format selectable, separately from the interface language.

### Security

The session cookie is the account, so it is treated that way:

- It only ever goes to `steamcommunity.com`, only over https, and never across
  a redirect.
- Every outbound request is a GET. Nothing lists, trades or changes anything.
- The local API answers cross-origin requests only from pages served by this
  machine, and refuses requests whose `Host` names something else.
- The image proxy only fetches from Steam's own picture hosts.
- Secrets live in `secrets.json`, apart from the config that gets exported and
  synced.
