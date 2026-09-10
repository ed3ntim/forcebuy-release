# Changelog

## 0.1.29 - what a sale is really worth

### Exchange rates

- **A payment in another currency is now converted at the rate of the day it
  was made.** ForceBuy kept one rate per currency - today's - so a purchase
  from 2019 could only be converted at this week's rate, which produces a cost
  basis that was never true, or not converted at all. It chose the second.
- **The published series is stored**, back to January 1999, and the note on
  every converted amount still says which day's rate it used.
- The full series is read once and the last ninety days on every routine run,
  because ForceBuy is not open every day and the series would otherwise have a
  gap for every stretch it was closed.

### Trade maths

- **The calculator goes all the way to spendable money.** It used to stop at
  the platform balance, which for Steam is not money: the balance only converts
  at a discount, and that discount is where marketplaces differ most. Two new
  lines show what cashing out costs and what survives it.
- **A switch decides what the break-even and target price aim at** - the
  balance, as before, or the money you can actually spend. The default is
  unchanged, so no figure moves unless you ask it to.
- **The marketplace list shows the total take**, not just the selling fee. It
  is the only number two marketplaces can honestly be compared on.
- **The asking price was a cent too high.** The fee is rounded to a cent before
  it is taken, so several prices reach the same net amount and the arithmetic
  picked one of them rather than the lowest: keeping 100.00 on CSFloat needs
  102.04, and the calculator said 102.05.

## 0.1.28 - filtering by what a row is worth

### Holdings

- **A filter on market value, not just on what was paid.** Value is a price
  looked up per name times a quantity, so it cannot be asked of the database -
  when the filter is on, everything that matched the other filters is valued
  first and paged afterwards.
- It counts whole rows: ten cases at 3.00 are 30.00, which is what the column
  next to it shows.

## 0.1.27 - both halves of a trade

### Market history from other games

- **Trading cards, emoticons and profile backgrounds are cleared out of the
  market history.** Steam keeps one history for the whole account, and releases
  before the app filter stored all of it - on the test account, 189 rows of
  423 that could never match a CS2 inventory.
- It happens on start, once, and only after the item catalogue has been read:
  against an empty catalogue every name looks foreign, and the cleanup would
  have deleted the very history it exists to tidy.
- A name the ledger holds is kept whether or not the catalogue has caught up
  with it.

### What a free arrival cost

- **Two settings decide whether a drop or a trade counts as costing nothing**,
  and both are off to begin with. Left off, an item that arrived without a
  price has no cost basis and stays out of the profit figure, which is more
  honest than counting its whole value as profit.
- They are separate because the honest answer differs: zero is defensible for a
  drop and rarely right for a trade, where something real was given away.
- The assumption is never written into the ledger. It applies when the figures
  are worked out, so a stored zero can never be mistaken for a measured one and
  the numbers change the moment the setting does.
- Unboxings are in neither. Their basis is the case plus the key, a number that
  can be worked out rather than assumed.

### Bought on one market, sold on another

- **The P/L column says whether a figure is realised.** A copy still held shows
  what it would make at today's price; one that has gone shows what it actually
  made, and the two used to sit in one column with nothing to tell them apart.
- **Two new columns, "Sold via" and "Sold for."** Which marketplace a copy was
  sold on was recorded all along and never shown - and it is often not the one
  it was bought on, which is the whole point of reconciling several markets
  into one ledger.

### Request budgets, continued

- **Reading the trade history no longer queues behind a price run.** Both go
  through one CSFloat key and one budget, but they are not comparable work: a
  price pass is hundreds of calls on a schedule that lose nothing by waiting,
  while the trade history is what the ledger's purchase prices are made of.

### The history did not end where it said it did

- **An inventory history that reported itself complete often was not.** Steam
  stops handing out page cursors long before it runs out of history, and
  ForceBuy read that as the end - then marked the account complete over every
  year before that point. Everything derived from those years was quietly
  missing rather than reported missing, purchase dates most of all.
- **The deep read now carries on from an earlier date instead of stopping.**
  It jumps further each time it finds nothing, up to a month, and back to a
  single day as soon as there are rows again, so a quiet four years costs about
  a dozen requests rather than fifteen hundred. It finishes at August 2013,
  when the items it could be about first existed.
- The quick pass that picks up what is new is unchanged: it still stops as soon
  as it sees nothing new.

## 0.1.26 - a throttle that backs off properly

### Request budgets

- **CSFloat's own budget is read and shown**, next to the pace ForceBuy sets
  for itself: "237 of 50,000 used, by their count". The two are different kinds
  of fact and where they disagree, that is worth seeing.
- It does not set the pace. A window budget says how much, never how fast, and
  CSFloat has refused a single request with 99.5% of its window free. It settles
  exactly one thing: a window that really is spent, with a stated reset, is
  waited out instead of guessed at.
- **A source that refuses again the moment it reopens is no longer a loop.**
  The back-off used to stop at half an hour, so such a source produced shut,
  open, shut, forever. It now climbs to two hours, and a second refusal arriving
  right after a wait expired makes ForceBuy wait for the reset the source itself
  published rather than guess again.

## 0.1.25 - charts that mean what they say

### Charts

- **The portfolio-over-time series can be split by account and by category.**
  It could only ever answer for the whole ledger at once, which is the wrong
  answer for anyone running a main account and a trading account.
- Collections are deliberately not offered here: one copy can sit in three of
  them, and a chart with no split adds its rows up, so that skin would be
  counted three times.
- **Cost basis and unrealised profit can be drawn next to value**, so what a
  ledger cost and what it is worth sit on one axis.
- **The series valued the past wrongly, and does not any more.** It priced
  today's ledger with old prices, so a skin bought in March counted in January
  too, and every past point was too high. A copy now counts from the date it
  arrived. One with no known date still counts from the start of the series -
  a missing date is not "arrived today", and treating it as one would make the
  chart jump on the day a history sync filled the date in.

### Syncing, and being able to see it

- **The marketplace sync is on the Inventories page**, next to the inventory
  history and the Steam market history, instead of two pages away in Settings.
  One row for all marketplaces, because they share a single run.
- **Every sync says when it last ran and whether it finished.** "Never read"
  and "more to read" are different answers, and only one of them is a gap.
- **A running sync shows how far it has got.** Where a real total exists - the
  Steam market history knows how many entries there are, the marketplace run
  knows how many accounts - there is a bar. The inventory history has no total,
  because Steam never says how deep it goes, so it reports pages read and the
  date it has reached instead of a bar that would mean nothing.

### Small things

- **"Send me a skin" carries the Steam mark.** Drawn into the page rather than
  fetched, so it is still there when the machine is offline.

### Collections

- **A collection card shows what is in it.** Up to eight item pictures, one per
  distinct name, so forty of the same case are one picture rather than eight,
  with a "+n" for the rest. A card that carried only a name, a count and a sum
  read the same for every collection.

## 0.1.24 - the inventory history stops giving up

### Holdings

- **Items that can never be sold are out of the list by default.** Service
  medals, tournament coins, the C4, the Zeus, default weapons and the storage
  units themselves - on a real ledger, 43 names of 190 that clutter every
  column about money. The filter sits on the bar and says "Sellable only", so
  it is one click to see everything again. Search still finds them by name.
- **A stacked row now shows what the whole row comes to**, under the per-unit
  price, for ask, bid and cost. The total used to be a tooltip on one column.
- **The reset for filters has an outline.** It has been on the bar since
  0.1.10, at the far right of a dozen filters, and was reported missing.

### History

- **The "Entries" count now matches the filter.** It only ever counted by
  account, so a table narrowed to sells still carried the total from before the
  filter - and the pager offered pages that were not there.
- **A "Market" column says which marketplace paid out**, with a filter beside
  it that lists only the marketplaces that have actually written a row. Steam's
  own history and a CSFloat trade used to look identical in the list.
- **Filters for name, date range, side and whether a payment found its copy.**
  The name search and the date range work on the event timeline too, and the
  search there also reads the item names, not just the description.
- **CSFloat transactions show the item picture.** CSFloat's trade list does not
  send one, so the row had a blank where every other row has the item. The
  picture now comes from the catalogue by name - nothing needs re-syncing.
- **A transaction row opens the copy it paid for.** Rows with nothing to open
  stay inert rather than looking clickable.
- **"Read further" sits in the banner that reports an incomplete history**,
  instead of on another page.

### Two kinds of event that had no name

- **"You deleted" and "Expired" are their own kinds now**, instead of sitting
  in "Other". "Other" means the row could not be read and is worth another look
  after an update; these two are read, understood and final.
- They count as neither an acquisition nor a disposal. An item thrown away
  fetched nothing, and filing it as a disposal would read as a loss taken.
- Existing history is relabelled on the next sync, without re-fetching anything.

### A trade that was listed twice

- **Steam reports one delivery as two rows** - one naming the trade partner,
  one naming the copy as it is now - and both were shown. They are folded into
  a single row that keeps the partner from one half and the newer asset id from
  the other, and the list says how many it folded.
- **The rule is narrow on purpose.** Two of the same case listed in the same
  minute look identical by every other measure and are both real, so a fold
  only happens where exactly one of the two rows names a partner. Nothing is
  deleted; both rows stay in the database.

### Request budgets

- **The countdown says which endpoint is waiting**, not just that something is.
  Steam's inventory endpoint being shut and its price endpoint being shut mean
  two different things.
- **It also counts down every second** instead of standing still and jumping
  fifteen at a time.

### Reading the history

- **Syncing the inventory history used to stall after a few hundred events and
  stay stalled.** The cause was our own rule, not Steam's: one refusal shut the
  history off for two minutes, then five, then fifteen, then thirty, and the
  run in progress was abandoned. On a history of twelve thousand events that
  never finished.
- **A refusal now costs ten seconds and the same page is asked for again.** Six
  of those in a row before the old cooldown takes over, so being wrong about
  Steam still ends in a real pause rather than an endless knock at the door.
  Steam's own `Retry-After`, when it sends one, still wins.
- **The history is also read four times faster**, and a scheduled run now covers
  forty pages instead of ten. Both numbers came from measuring what a browser
  extension gets away with on the same endpoint, rather than from guessing
  quietly downwards.
- **The history is now always requested in English.** Steam renders it in the
  account's own language, and both the event descriptions and the dates are
  part of that rendering. An account set to anything but English would have
  produced events that could not be classified and had no date - silently. The
  same applies to the Steam market history.

## 0.1.23 - filters that stay put

### Purchase prices and where an item came from

- **A CSFloat purchase was recorded as a Steam market buy.** Steam's own market
  history and the trades read off other marketplaces share one table, and two
  different pieces of code apply them. Only one of the two declined the other's
  rows, so the Steam path quietly claimed CSFloat purchases and wrote them home
  under its own name - which is what put "Steam Market" on the origin.
- **With several purchases of the same name, the wrong one won.** The Steam path
  has no one-to-one rule, so three CSFloat buys of one skin all landed on the
  same copy and the surviving date and price were whichever was written last.
  Those rows are handed back to the reconciliation, which claims each delivery
  once.
- **Existing ledgers are repaired on first start.** A marketplace receipt linked
  to a holding that claims Steam is unpicked and matched again. Anything typed
  by hand is left alone.
- **Nine percent of one account's inventory history was unreadable, and is not
  any more.** Steam shortens the description when a row has no trade partner to
  name - a bare "Traded", "Used", "Unsealed", "Earned a new rank and got a
  drop" - and the patterns had only ever been written against the long form.
  1.099 events of 12.240 now classify; 16 remain unread.
- That was not cosmetic: an unread event says nothing about when an item
  arrived, so the copy kept no purchase date, and without one a marketplace
  receipt has no delivery to be matched against and its price never reaches the
  ledger. This is why the reported skin had the wrong date and price.
- **Stored history is re-read rather than re-fetched.** The event type is
  decided once, when the row is written, so a pattern added later would only
  have helped history nobody had synced yet - and re-fetching years of it costs
  a rate limit nobody should spend on a bug fix.

### Filters

- **Item type and category no longer sit next to each other saying the same
  thing.** One filter does the job on both pages - but not the same one, because
  they are not equally good in both places.
- In the catalogue, category survives: it is item type one step finer, since a
  skin sits in its weapon class rather than in one "skins" bucket. It now takes
  several values at once, so "every skin" is seven ticks in one menu instead of
  seven passes.
- In holdings, item type survives. Category there comes from the Steam
  description, and a copy rebuilt from a storage-unit deposit has never seen
  one - 2.776 of 2.929 rows in a real ledger carry no category at all. Item type
  comes through the catalogue and covers them.
- **The catalogue had "More filters" on the bar twice**, both panels holding the
  same two ranges, each with its own count. Both are gone; float and release
  date sit on the bar like every other filter.

### Prices

- **Items that cannot be sold are no longer priced.** Steam states outright
  whether an item is marketable, and asking a marketplace about one that is not
  spends quota on a guaranteed empty answer. In a real ledger that is 43 names:
  every service medal and tournament coin, the C4, the Zeus, the default M4A4,
  the default graffiti and music kit, and the storage units themselves.
- The test is the marketable flag, not the item type. A Phoenix Pin is a
  collectible and sells fine; a storage unit is a tool and never will. A name is
  still priced as long as any held copy of it can be sold.
- **The price columns say "not sellable" instead of showing a blank.** An empty
  cell looked like a price nobody had fetched yet, which is worth a refresh -
  this one never will be.

### Tables

- **A reset button sits on every filter bar.** It used to appear only once two
  filters were set, which made it something you had to discover by accident. It
  is now always there, greyed out while there is nothing to clear - which also
  says at a glance whether any filter is in effect.

- **Filters survive leaving the page.** Table state lives in the URL, and
  switching to another tab threw that URL away - so narrowing the list, opening
  an item and coming back landed on an unfiltered table. Each table now parks
  its filters, sorting and columns for the browser session and puts them back
  when you return. A bookmarked or shared URL still wins, and resetting the
  view still clears them for good.

## 0.1.21 - what is in the storage units

### Storage units

- **Items sitting in a storage unit are in the ledger again.** Steam does not
  report casket contents at all, so anything put away before ForceBuy first
  read the inventory existed nowhere: the deposit event had no holding to
  attach to, and the item was simply absent. They are now rebuilt from the
  deposit and withdrawal record.
- **Only once the history has been read to the end.** Both directions are in
  the record but spread across it - the newest five thousand events of a real
  account held 2.778 deposits and not one withdrawal. Balancing a part-read
  history would count items that were taken out again further back, which
  invents property rather than finding it. Until the walk finishes, the number
  is shown and nothing is created.
- **The count corrects itself.** A rebuilt row whose deposit turns out to have
  been cancelled by a later withdrawal is removed again on the next sync, so a
  ledger filled from a partial history does not carry the surplus forever.
- A rebuilt copy carries no asset id, no price and no origin. A deposit says
  where an item went, never where it came from or what it cost, and those are
  left empty rather than guessed - a later marketplace match can still fill
  them in.

### History

- **New entries are picked up even while the deep walk is still running.** The
  history grows at the front, so each sync now reads the newest page first and
  only then carries the deep walk further. Before this, an account whose
  history was still being read could miss everything that happened meanwhile.
- **A throttled sync no longer wastes what it already fetched.** Interpreting
  stored events is database work and cannot be rate limited, but it used to sit
  behind the download in the same block - so one refused request left hundreds
  of stored events unlinked and unpriced. The reading and the interpreting now
  fail independently.
## 0.1.20 - the whole history, and money in one currency

### Fixed

- **A Steam purchase in a euro wallet was recorded as dollars.** The cost from
  Steam's market history was written into the ledger without converting it, so
  on a euro wallet with a dollar ledger every Steam purchase and sale was off
  by the exchange rate - and looked entirely plausible. The marketplace path
  has converted since it was written; this one had simply never been asked,
  because the account it was built against kept its wallet in the ledger
  currency. Where no published rate can form the pair the amount is withheld
  rather than guessed, and the item keeps its date and origin.
- **Only the newest 500 inventory-history events were ever read.** A first sync
  has nothing to stop at, so it was treated as a routine one and capped at ten
  pages - fifty events each, five hundred in total, looking exactly like a
  complete history. Everything older did not exist as far as the ledger was
  concerned. The market history had the same trap at five pages.
- **A long history can now actually be finished.** Steam serves ten history
  pages a minute and then shuts the door, so a full walk gets cut short - and
  every attempt used to start at the newest page again and stop at the same
  depth. The walk now remembers where it stopped and the next one carries on.
- **Applied stickers had stopped showing.** Their icons come from
  `cdn.steamstatic.com`, which was missing from the list of hosts the image
  proxy may fetch from while its Akamai and Cloudflare siblings were on it. The
  markup was there, the images were zero pixels wide.
- **Items in a storage unit were written off as gone.** Steam does not report
  casket contents at all, so a deposited item stops being listed and every sync
  marked it disappeared. The history says where it went, and that is now
  believed over the inventory's silence.
- **Storage units were listed under a name nobody gave them** - the event text,
  which on every deposit reads "Moved to Storage Unit". They are counted under
  one honest label until the real names can be read.

### History

- **Each account says how much of its history has been read.** A truncated
  history is indistinguishable from a complete one by looking at it, and
  everything derived from the missing part is quietly absent: purchase dates,
  cost bases, marketplace origins. It now says "More to read" until the walk
  has reached the end, and "Never read" is kept apart from "complete".
## 0.1.19 - marketplace purchases actually reach the ledger

### Fixed

- **Every CSFloat purchase was being thrown away before it was stored.** A
  trade was only kept if the asset id it named was already in your inventory -
  but Steam issues a *new* asset id whenever an item changes hands, so the id
  CSFloat reports is the seller's copy and can never appear on your side.
  Measured against a real account: 443 trades read, 0 stored. Now 71 stored
  and 24 matched to the copies they paid for.
  This one failure was behind everything downstream - no cost basis, no
  purchase date, an origin stuck on "Trade" instead of the marketplace, and
  per-marketplace filters that looked like they did not exist because nothing
  ever carried a marketplace.
- **Items in a storage unit were being written off as gone.** Steam's inventory
  endpoint does not report casket contents at all, so a deposited item stops
  being listed the moment it goes in - and every sync marked it disappeared. It
  left the holdings entirely while sitting safely in the casket, and the
  purchase that paid for it was left pointing at something marked missing. The
  history says where these went, and that is now believed over the inventory's
  silence; a deposit moves the copy into the unit and a withdrawal brings it
  back, including for copies an older version already wrote off.
- **Storage units were listed under a name nobody gave them.** The unit's name
  was taken from the event text, which on every deposit reads exactly "Moved to
  Storage Unit" - so all of them collapsed into one pseudo-unit called that.
  Steam's history does not appear to carry the casket name at all, so they are
  counted under one honest label until it can be read properly.
## 0.1.18 - purchases that have not arrived yet

### Marketplaces

- **A CSFloat purchase now shows up before the item does.** ForceBuy only ever
  asked CSFloat for trades it had marked verified, so an item paid for and
  still being delivered did not exist here at all - plainly visible on CSFloat,
  missing in ForceBuy, and no way to tell that from never having looked.
- **Whether a purchase counts is decided by your inventory, not by a label.**
  An unverified trade whose item is already in the Steam inventory is a
  completed purchase, and it gets its cost basis like any other. Verification
  is the marketplace's own bookkeeping; what settles it here is finding the
  Steam movement the payment belongs to.
- The transactions list tells two things apart that used to look identical:
  "Not matched" - the item is in the inventory but no movement fits it, which
  is worth looking at - and "Item not here yet", which is ordinary and
  resolves itself on delivery. Where a marketplace reports an unusual state,
  it is shown verbatim next to it rather than translated.
## 0.1.17 - the second account, and what a refresh costs

### Holdings

- **Every account gets its own line, not only the ones with something wrong.**
  With two accounts and one banner, silence meant three different things -
  fine, never checked, or simply not listed - and a healthy account looked
  exactly like an unchecked one. Each now says which it is, and when its
  standing was last read from Steam.
- **A Refresh prices button, on the page where the stale numbers are.** It
  ignores the interval that normally skips a name priced recently, which is
  the point of asking by hand.
- **Next to it, what that will cost.** A budget readout per platform: how many
  requests Steam and CSFloat will still take right now, and a countdown when
  one of them has refused us. A platform counts as free as its tightest
  endpoint, not its average - one shut endpoint is what a run hits first.
- Applied stickers and charms show their name on hover, at once. The name was
  already there as a native tooltip, which waits about a second and renders in
  the desktop style - on a 20px icon in a dense table, nobody waited that long.

### Item detail

- **The price history starts on the day the copy arrived.** A fixed window
  answered the wrong question on a page about one item you own, and the
  purchase date was already in the ledger. 30D, 90D, 1Y and everything are
  still there, and an item with no purchase date falls back to its whole
  history rather than to a guessed window.
- **The account standing is on this page too.** It was in the list and in the
  banner above it, but not here - and this is the page someone opens to decide
  whether to sell. A value on a banned account is a number you cannot act on.

### Wording

- **A banned account now says "Banned", not "Blocked".** It is the account
  that is banned, and "Blocked" read like something about the item.
- **The marker on an unsellable item is a bar down the side of the cell**
  instead of a full border drawn around the badge. The badge has its own
  border and rounding, so the old one read as a box inside a box.
## 0.1.16 - a sync you can watch, and filters that take more than one answer

### Filters

- **A filter can now hold several values at once.** Inventory, location, item
  kind, wear, category, rarity, origin and in-game collection each take a list:
  "Covert or Classified", "drops or unboxed", "everything except the cases".
  Several values mean any of them, which is the only reading that can return
  anything - a holding has one rarity, so "all of them" would always be empty.
- The chosen values are in the URL as `rarity=Covert,Classified`, so a filtered
  view is still something you can bookmark and share, and a saved view still
  carries it. Links and saved views written before this keep working unchanged.
- In-game collection under "More filters" takes several too. Your own
  collections stay single for now: membership is resolved to a list of items on
  the server, and two of them need a different query.
- Wear, float and seed filters now appear while the kind filter is on skins
  **and nothing else**. With stickers also selected they would silently hide
  every sticker.

### Syncing

- **A running sync shows how far it has got**, as a small ring that fills, next
  to the count it already showed. Hovering gives the rest: what it is working
  on, roughly how much time is left, and which pass it is in.
- The estimate is deliberately rounded to minutes and never counts seconds. It
  comes from the rate the run has actually managed, and a rate limiter can
  change that at any moment - seconds would be precision it does not have.
- **A price run counts its two passes separately.** It walks the ledger through
  your price source and then asks Steam about the names that source did not
  list; the bar used to sit at 100% for the whole second half. On a real ledger
  that was 46 of 190 names - a third of the run reading as finished.

### Safety

- **ForceBuy only ever reads from an outside service, and that is now enforced
  rather than intended.** Every outbound call is a GET; the method is not a
  parameter any caller can set, and a test holds it that way. It matters more
  now that an API key is stored: on CSFloat the same address that searches
  listings with a GET creates one with a POST, so between looking up a price
  and putting a skin up for sale there is a single word. Nothing in ForceBuy
  can take that step - no listing, no offer, no purchase, no sale.
- The one exception is your own Google Drive folder, which is where backups are
  written. That is your storage, not a marketplace.

### Fixed

- **The Steam gap fill gave up after the first name it could not price.** One
  name Steam had nothing to say about ended the whole pass, and the run still
  reported success: on the first real run 46 items had no CSFloat price, one got
  a Steam price, and the other 45 were quietly abandoned. A single failing name
  no longer costs the rest, and a run that hits real errors says so.
- **CSFloat's request budget was set too high.** A run over 190 names at thirty
  requests a minute earned a rate limit, so it is now fifteen with a wider gap
  between calls. Worth saying plainly: this is still an estimate. CSFloat turns
  out to publish its budget in response headers - fifty thousand per window, of
  which four full runs spent 237 - so the published limit was never what we ran
  into, and reading those headers instead of guessing a rate is the real fix.
  The budget now carries both prices and trade history, so it is busier than it
  was either way.

## 0.1.15 - CSFloat as a real price source

### Prices

- **CSFloat works as a price source again, and it now needs an API key.** Their
  listing search started refusing requests that do not carry one - it answers
  "You need to be logged in to search listings" - while their documentation
  still says no key is required. Without a key ForceBuy no longer asks at all:
  the source reports itself as not set up, instead of spending one refused
  request per item. Create a key on your CSFloat profile under Developer and
  paste it into Settings.
- **Steam fills the gaps CSFloat does not list.** No marketplace carries
  everything; the odd graffiti or capsule is simply not for sale on CSFloat.
  Those names, and only those, are asked of Steam, so the Steam budget goes on
  the handful of items the main source cannot price rather than on all of them.
  Switchable in Settings; with it off, an item CSFloat does not carry has no
  price at all.
- **A price run stops when the source cannot be asked, and says why.** A refused
  key used to look exactly like an item nobody is selling, so the run worked
  through the whole ledger collecting the same failure in silence. "Nothing
  listed" and "could not ask" are now different things: the first is a gap, the
  second ends the run with a message.
- The scheduler no longer queues a price run for a source that has no key. It
  used to try, fail, and try again on the next tick.
- One thing this does **not** fix: CSFloat has no bulk endpoint, so it is still
  one request per item. What it buys is a second budget on a different host, so
  valuing the ledger stops eating the Steam allowance.

### Security

- **API keys moved out of `config.json` and into `secrets.json`.** They were
  sitting in the one file that gets exported, backed up, and uploaded to Google
  Drive when Drive sync is on - and a CSFloat key is not a preference: it
  belongs to a real account and can list items for sale. Existing keys are moved
  across automatically the first time settings are saved; nothing to do by hand.
- **The CSMarketCap and cs2.sh keys were being sent to the browser in the
  clear.** The CSFloat key was replaced by the word "configured" before leaving
  the server and these two were not - an oversight rather than a decision, since
  the save handler already expected all three to come back masked.
- **Moving the data folder no longer leaves `secrets.json` behind.** It copied
  the database and the settings but not the secrets, so a move quietly dropped
  the stored Steam access and the local passcode.

### Setup

- **The wizard now recommends CSFloat rather than treating it as an equal
  option**, and says why: Steam answers around eighteen items a minute per
  address, which is what makes a large ledger slow to value. It stays a
  recommendation - Steam needs no key, works out of the box, and remains the
  fallback for items CSFloat does not list.
- Setup can no longer finish with CSFloat selected and no key entered. That
  combination would have produced a ledger with no prices and nothing on screen
  explaining it; it now keeps Steam and says so while you are still on the page.

### Fixed

- **CSFloat never reported a buy order, on any item.** Not because nobody bids
  there - ForceBuy was asking an address that does not exist (`/api/v1/buy-orders`
  answers "method not allowed"), and the error was being swallowed. CSFloat
  publishes no buy-order endpoint, so the bid is now honestly left empty rather
  than silently blank.
- **A CSFloat price in a EUR or CNY ledger was the wrong number.** CSFloat
  quotes US dollars and nothing else, but the price was stored with the ledger's
  currency written next to it and never converted - so a $100 skin was added to
  a euro portfolio as if it were €100. Prices now keep the currency the
  marketplace actually quoted, and are converted where they are read, at the
  same European Central Bank rate the rest of the app uses. Where no rate is
  available the price is left out rather than shown unconverted.
- Charts and tables that put several marketplaces side by side convert first.
  Previously a price history could draw a dollar point and a euro point on the
  same line.

## 0.1.14 - the version you see is the version you run

### Settings

- **The feedback panel moved to the bottom of the page**, right above the About
  card. It used to sit between settings somebody was in the middle of changing;
  how to report something belongs next to what to report it against.

### Fixed

- **The version in the status bar could be older than the build running.** It
  was read once when the server started and then remembered for as long as the
  process lived, so a server left running across an update kept reporting the
  version it had booted with. It is re-read now.
- **A build made from a source checkout no longer claims to be a release.** The
  version is only raised when a change is pushed, so a working tree carries the
  number of the *previous* release while running code that will ship under the
  next one. Such a build now says `0.1.13+4` - four commits past the v0.1.13
  tag - instead of `0.1.13`.
- **Feedback reports carry the version, platform and Node version again.** The
  panel asked the server for them over an address that was never wired up, so
  every report went out reading "ForceBuy ?" with the rest missing.

## 0.1.13 - market indexes on the dashboard, and a clean delete

### Dashboard

- **Market indexes are widgets like any other.** A new category in "Add widget"
  offers three: every index as a line, the latest level of each, and how much
  each moved. They can be edited, duplicated and put on any workspace, because
  an index is a time series and the dashboard already knows how to draw those.
- Indexes are their own category, not part of Portfolio. They say how the market
  moved, not what you hold - a market index sitting next to a portfolio value
  invites reading one as the other.
- **Where the numbers come from**: CSMarketCap publishes the indexes this is
  built for, and their API is paid at every tier - there is now a key field for
  it in Settings. cs2.sh issues a free developer key but publishes no aggregate
  index today, only per-item prices, so its key does not fill these widgets yet.
  Both report themselves as not set up rather than showing an empty chart with
  no explanation. Demo mode lays down three of its own index series, so the
  widgets can be seen working before either key exists.

### Fixed

- **Deleting an inventory now removes everything belonging to it.** Applied
  stickers, charms, item events, collection membership, storage units, market
  transactions and history events were already cleared; manual price overrides
  and history-event links were not, and stayed behind pointing at holdings that
  no longer existed. The delete also runs as one statement per table instead of
  four per holding, which for a two thousand item demo inventory was eight
  thousand round trips.
- **Turning demo mode off removes what the demo invented**: its price history
  and its index series, not only its inventory. Price history for an item a real
  inventory also holds is kept, because that history is about the item.
- **A demo seed that fails halfway can be retried.** The inventory it left
  behind was invisible to the config, which only records the id on success - so
  the next attempt collided with a row nothing could name or remove. The cleanup
  now keys on the demo's reserved SteamID, which survives a half-finished run.

## 0.1.11 - a way to report things, and a demo that fills every panel

### Settings

- **Feedback panel**: an email to contact@ed3n.gallery or a message to @ed3ncs
  on X, with the build details ready to copy - version, commit, platform, Node
  and browser. A report without them costs a round of questions before it can be
  looked at. Nothing is sent from the panel itself; the buttons open your own
  mail client or a browser tab, and there is no telemetry anywhere in ForceBuy.

### Demo mode

- **A month of price history per item**, so the charts that read history have
  something to draw. "Value over time" and the price chart on an item were flat
  or empty before, which are the first two panels anyone opens.
- **Marketplace receipts** for the copies whose provenance says they came from
  one, across Steam, CSFloat, Buff163 and YouPin898 - so the reconciliation
  panels have rows. Only for those copies: inventing a CSFloat receipt for a
  drop would teach the wrong thing about where numbers come from.

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
