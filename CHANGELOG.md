# Changelog

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
