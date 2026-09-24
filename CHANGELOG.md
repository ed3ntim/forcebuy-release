# Changelog

## 0.7.2 - Steam listings, sorting and filtering by marketplace

### Holdings

- **Your Steam market listings show up too**, read with the inventory's Steam
  session in the market history pass, once a day and when you sign in. The
  price is what the buyer pays.
- **An item listed on the Steam market is no longer marked missing.** Steam
  leaves it out of the inventory answer while it is up for sale, although the
  inventory page still shows it; it counts as still yours now.
- **"Listed" can be sorted**, by the lowest offer of each row, unlisted rows
  last.
- **The "Listed" filter chooses marketplaces**: CSFloat, Steam, Buff163, one or
  several.

## 0.7.1 - listings from the CSFloat stall

### Holdings

- **CSFloat offers show up.** 0.7.0 asked CSFloat's listing search, which
  refuses every request without a key, so no offers appeared. They are now read
  from your CSFloat stall, the same request csfloat.com/stall makes, and only
  with your own CSFloat login for that inventory: a stall can be private, and
  reading it is your choice. The offers appear after the next marketplace
  read - once a day, when you sign in, or with "Sync" next to Marketplaces on
  the Inventories page.

## 0.7.0 - what is listed for sale

### Holdings

- **Holdings shows what you have listed for sale right now**, where and for
  how much: a "Listed" column (several marketplaces per row if a stack is
  listed in several places), a "Listed only" filter, the offers on the grid
  cards, and a "Listed for sale" panel on the detail page. Prices are shown in
  your currency; the amount as listed shows on hover. CSFloat comes first,
  read with the inventory's own CSFloat login (or your account-wide key);
  Steam and Buff163 follow. If you chose your columns yourself, add "Listed"
  under Columns.

### Sync

- **The marketplaces are read once a day and when you sign in**: purchases,
  sales and your current offers. They used to be read only when a key was
  saved or the button was pressed.

## 0.6.12 - local hints, connected marketplaces per inventory

### Settings

- **The local app explains its own use of the CSFloat key and the Buff163
  cookie.** There is no operator account locally, so the key also asks for
  prices when CSFloat is the price source, and the cookie reads the daily
  Buff163 price list. The web texts stay as they are.

### Inventories

- **The Steam access panel shows the marketplaces connected for this
  inventory**: its own account, or your account-wide key. It used to show only
  the account-wide key, so an inventory with its own CSFloat account read
  "no marketplace connected".

## 0.6.11 - texts that were missing

### Texts

- **Texts that showed as raw keys are back.** Empty dashboard panels showed
  "widget.emptyNoPrices" and similar, the demo panel in the settings showed
  "demo.title" and its other labels, and the narrow filter bar "filter.clear".
  The demo texts were lost when that section of the texts was rewritten; the
  panel ones were never written. A test now checks that every text the app
  names exists.

## 0.6.10 - clearer texts and warnings

### Inventories

- **Clearer Steam access setup.** The page no longer has a line under its
  title, the manual steps have no separate heading, and they describe Edge and
  Firefox only: Chrome is not supported at the moment, because of how it
  encrypts its cookies. The marketplace row reads "Transactions on third-party
  marketplaces".
- **The warning that storing a Buff163 cookie goes against Buff163's terms is
  always shown next to the Buff163 field**, in both setups, the settings and
  an inventory's marketplace accounts. It used to appear only once something
  was typed, so it was easy never to see it. The tick is still needed only to
  store a new cookie.

### Settings and texts

- **Shorter, current texts in the settings.** The CSFloat key and the Buff163
  cookie say they are used only to read your transaction history. The line
  about daily reads, the note on stored access, the part of the account
  deletion text about prices and the catalogue, and the opening sentence of
  the marketplace section are gone. The local app is offered as "ForceBuy can
  also be used locally on your own PC". Notifications are described as
  covering important events such as a failed sync. Feedback asks to include
  the build details, drops the note on telemetry, and writes to
  contact@forcebuy.net.

## 0.6.9 - holdings controls

### Holdings

- **"Table / Grid" sits next to "Columns" and "Views"**, with the other
  controls of how the list is shown, instead of in the page header.

### Catalog

- **The "Released between" dates no longer run under the "Form" filter.**

## 0.6.8 - saving that works, and origins by hand

### Holdings

- **Save on the holding detail page saves, and "Add manual holding" adds.**
  Both buttons did nothing: the app's buttons do not submit a form unless
  they say so, and these two did not, so no request was ever sent. A test now
  checks every form for a button that submits it.
- **The origin of a holding can be set by hand when it is unknown.** The edit
  form on the detail page offers it for such holdings: Steam Market, in-game
  store, trade, unboxed, drop, crafted, CSFloat, Buff163, YouPin898, or entered
  by hand. A sync does not overwrite it; if one reports something else, the
  page offers that as a suggestion, as for the other fields.
- **All filters in the filter bar share one background.** The lists with
  several choices (account, location, item type, wear, rarity, origin) were
  lighter than the fields next to them.

## 0.6.7 - fewer settings, shorter texts

### Appearance

- **The density choice is gone** from the theme menu and the command palette.
  Every view uses the normal spacing.

### Texts

- **Dashboard** no longer carries a line under its title. **Collections**
  describes itself as "Define your own collections: investment positions,
  trade-up material, what is up for sale, etc."

## 0.6.6 - wording, and the tour shows each page

### Tour

- **Each step of the tour opens its page by itself.** The welcome shows the
  dashboard, then Holdings, History, Inventories and Settings follow as the
  steps do, so the text always describes what is on screen. The "Show me"
  link is gone.
- **New texts for the tour, and "Do not show again" is a tick box.** Ticked,
  the tour stays away for good however it is closed; the settings can bring
  it back.

### Sign-in

- **The demo button reads "Try the Demo".**

## 0.6.5 - tidier history, and a correction

### Correction

- **An inventory's own CSFloat or Buff163 account is never used for prices.**
  0.6.0 said, and did, that a price run would borrow an inventory's account
  when no account-wide key was set. That was wrong: current prices are not
  user data and come from the operator's accounts on the web. An inventory's
  account reads only what belongs to that user - purchases and sales, their
  days and the amounts actually paid.

### History

- **The events tab no longer offers the column picker of the transactions
  table.** The events are a list; choosing columns there changed nothing.

### Prices

- **A single refusal from CSFloat no longer stops its price run for minutes.**
  CSFloat refuses short bursts even with most of its hourly budget left; such
  a refusal is now waited out for fifteen seconds and the same call made again,
  as the Steam history does. A window that is really spent is still waited out
  until CSFloat says it resets.

### Accessibility

- **Dialogs keep the keyboard inside them**: focus moves into a dialog when it
  opens, Tab stays within it, and focus returns to where it was when it
  closes. Form labels now name their fields for screen readers, and a click on
  a label focuses its field. The folded navigation names its links.

## 0.6.4 - setup without an empty promise

### Setup

- **The local setup no longer offers Google Drive as a place for the data.**
  Nothing was ever written to Drive: choosing it kept everything in the local
  folder, as the local choice does. It comes back once a backup to Drive
  actually runs.

### Settings

- **"Clear holdings" builds the ledger again.** It deleted the holdings and
  left the stored history pointing at them, so purchases stayed "matched" to
  copies that no longer existed, and the list stayed empty until the next
  daily read. The inventories are now read again at once and the stored
  history and receipts matched to what comes back. The confirmation no longer
  claims the price history is deleted; it never was.

## 0.6.3 - selling a selection properly

### Holdings

- **"Mark sold" on a selection asks what the sale was.** A dialog takes the
  price per item, the day and where it was sold (Steam Market, CSFloat,
  Buff163, YouPin898, a trade, or somewhere else). It used to mark the rows
  sold at that moment for nothing, so every one of them read as a total loss
  until opened and edited. Undo still takes all of it back.

### Dashboard

- **"Layout saved" appears once the layout is saved.** It appeared at the click,
  and the old layout flashed back until the answer came; a failed save lost the
  edit while saying it was saved. The edit now stays open with your changes
  until the save went through, and a failure says so.

## 0.6.2 - pages that say what went wrong

### Pages

- **A holding or collection that does not exist says so.** Opening a deleted
  entry or a mistyped link showed "Loading..." for ever, because the page only
  knew "no data yet". It now shows "Not found" with the way back, or "Could not
  load this" when the server failed. A missing entry is no longer asked for a
  second time.
- **Lists show that they are loading, or that loading failed, before they say
  they are empty.** Holdings, History, Collections, Prices, Catalog and
  Inventories showed their "nothing here" text while the first answer was
  still on its way, and for good when it failed. History no longer flashes
  "No account access yet" while it is still finding out.
- **A purchase date from Steam's market history is the same day in the holdings
  list and the edit form as on the detail page.** Steam names a day, stored as
  its midnight UTC; the list and the date field read it as local time, which
  west of Greenwich is the day before.

## 0.6.1 - a warning before a cookie is stored

### Access

- **Storing a Steam or Buff163 cookie now asks for a confirmation first.** A
  warning says that storing the login cookie goes against the site's terms and
  can get the account banned, and saving waits until you tick that you
  understand. It appears wherever a cookie is stored: the Steam access of an
  inventory (pasted or imported from a browser), the Buff163 field in the
  settings and in both setups, and an inventory's own Buff163 account. An API
  key such as CSFloat's is not a cookie and needs no confirmation.

### Security

- **The picture proxy no longer follows a redirect off Steam's image hosts.**
  It checked the host of the first address only, and a redirect from there was
  followed to wherever it pointed. Each hop is now checked, a few at most.

### Sync

- **Pressing Sync while the same sync is running no longer runs it twice.** A
  second request for the same work only counted syncs still waiting, so one
  pressed during a run read the whole set from Steam again right after it.
  Saving a Steam session still reads the inventory again, since the running
  read started without it.

## 0.6.0 - marketplace accounts per inventory

### Inventories

- **Each inventory can have its own CSFloat and Buff163 account.** Under an
  inventory's row on the Inventories page, next to the Steam access, a key or
  cookie entered there is used to read that inventory's purchases and sales.
  So several Steam accounts can each have their own marketplace account. An
  inventory without one keeps using the account-wide key from the settings,
  as before, and the settings list which inventories have their own. Prices
  use the account-wide key, or an inventory's own when there is none.
  Deleting an inventory removes its marketplace logins.

## 0.5.1 - a demo that agrees with itself

### Demo

- **Demo skins match their names.** Wear, float, StatTrak and Souvenir were
  drawn at random, so a card could read "(Well-Worn)" and carry a Factory New
  badge with a float of 0.98. They now follow the item name, and the float lies
  inside its wear.

## 0.5.0 - a tour, and matches per marketplace

### Tour

- **A short tour opens after setup and on every start**, five stops through
  the pages that matter first. Closing it hides it until the next start; "Do
  not show again" puts it away for good, stored with your settings (with your
  account on the web). "Show the tour again" in the settings brings it back.

### Settings

- **The settings show, per marketplace, how many purchases and sales were tied
  to an item.** Each figure of unmatched rows links to exactly those rows in the
  history. Buff163 and YouPin898 rows are named as such in the history too;
  they used to show their raw id.

## 0.4.0 - holdings as a grid

### Holdings

- **Holdings can be shown as a grid of cards.** A switch next to the page
  title changes between the table and the grid. The grid keeps the same
  filters, the same sort (chosen from a list, since there are no column
  headers) and the same selection, so bulk actions work from either view. The
  choice is part of the address and of a saved view.
- **Saving on the holding detail page keeps what you typed.** A price or a
  float typed with a decimal comma (`12,50`) was read as no number at all and
  cleared the field instead of setting it. Commas and thousands marks are read
  now, a number that still cannot be read is named and nothing is saved, a
  failed save says so, and the holdings list shows the new figures right away.
- **The catalogue link on the holding detail page finds the item.** It searched
  the full market name with the wear in brackets, which the catalogue does not
  list, because the pattern meant to take the wear off never matched.

## 0.3.12 - holdings and admin

### Holdings

- **A stacked row shows the stack's total as the main figure**, with the count
  and unit price in the small line under it. It used to be the other way round.
  A single item still shows one price.

### Web

- **The sign-in page and the account card in the settings link the local app**
  for Windows, the release page of the latest version.

## 0.3.11 - legal pages, optional access, a daily read

### Legal

- **Imprint and terms are pages of their own**, in German and English, linked
  with the privacy statement from the sign-in page, the setup, the passcode
  gate, the status bar and the closed-test door. The door serves them before
  the access code. The German text is the binding one.

### Sync

- **Inventory, inventory history and market history run once a day.** Locally
  that is the first time the app is open on a new day. On the web it is a
  server pass for every account that finished setup, and signing in queues the
  same three again. They no longer follow the minute interval. Price refresh is
  unchanged.

### Setup

- **The second setup step takes a Steam session, a CSFloat key and a Buff163
  cookie, and none of them is required.** On the web that step is new: currency
  and the price source come first, then the three fields, and Finish works with
  all of them empty. Locally the key and the cookie moved onto the account
  step, next to the Steam session. Saving a session before Finish works; it
  used to be refused because setup was not finished yet.

## 0.3.8 - the history finishes, and the price page is yours

### History

- **A history that was already read to its end now finishes.** The run picked
  up where it left off - on a position it had worked out itself - and asked
  Steam for a moment before the account's first ever event. Steam answers that
  with an error, which ForceBuy read as "Steam is busy" on the very first
  request of every run, paused, and started over ten minutes later. It has
  been doing that for a day. The check that tells the two apart now runs from
  the first request instead of only later on, so the history completes and the
  items in storage units appear.

### Prices

- **The price table moved to the admin area.** It holds a row for every name
  somebody holds, which on a shared server made it a list of what other people
  own - readable by anyone signed in. It is now behind the operator's account,
  searchable, and gone from the navigation on the web. In the local app
  nothing changes: there the table is yours.
- **Setting a price by hand moved to the item's own page**, where the item is,
  instead of disappearing with the table.

### Demo

- **Knives and gloves come without stickers.** They have no slots for one in
  the game, so a demo that put three on a Karambit was teaching the wrong
  thing. Guns wear them, nothing else does.
- **The demo button matches the Steam button** in size and shape, in
  ForceBuy's own colours rather than Valve's.

## 0.3.0 - look around without signing in

### Demo

- **You can try ForceBuy without a Steam account.** On the sign-in page there
  is now a quieter second way in: a demo account with an invented inventory -
  fifty skins, two thousand containers, storage units, stickers, a trade
  history and receipts from three marketplaces. Every page, filter and chart
  works on it, because that is the point of looking around.
- **It says what it is, and it ends.** A line at the top of every page says the
  data is invented, and the session lasts two hours; afterwards the account and
  everything in it is deleted.
- **A demo reaches nothing outside.** No Steam cookie, no marketplace key, no
  sync, no export - it can read everything of its own and touch nothing of
  anybody's.
- **And the nightly price passes ignore it.** A demo holds two thousand
  invented items; pricing those every night would spend the catalogue's budget
  on things nobody owns.
- **And it writes nothing into what everybody shares.** On the server the demo
  no longer invents prices: it is built from real catalogue items, which the
  daily price passes already cover, so nobody else's price history sees a made
  up number.

### On a phone

- **Tables show four columns instead of twelve.** The ones you put in front
  stay; the rest fall off the back, and the column picker still offers all of
  them. Turning the phone brings them back.
- **The filter bar starts folded**, with the number of active filters on the
  button - six rows of filter fields used to push the table off the screen.

### Prices

- **Steam's own market listing is now a price source.** It lists everything
  that trades - the old stickers, the odd wears, the souvenir packages that no
  other source carries - and the server reads it a few hundred names at a time,
  carrying on where it left off. A full round through its 35,509 names takes
  about five days, and then it starts again.

- **An estimated price is marked where it stands.** CSFloat's daily list is the
  only source that covers the whole catalogue, and it publishes what it thinks
  an item is worth rather than an offer anybody made. The marketplace
  comparison said so already; the holdings table and the price chart now do
  too.

### Fixed

- **Your portfolio chart is yours.** The table behind it was the one table of
  its kind without an owner, so on a shared server every account would have
  read one common line. Found while building the demo, which would have drawn
  its invented portfolio into it.

## 0.2.31 - the history knows when it is finished

### History

- **A history that has been read to its end is now recognised as finished, and
  the items in your storage units appear.** Steam answers a request for a
  moment before your first ever event with an error rather than an empty page.
  ForceBuy read that as "Steam is busy", waited, asked again, and never marked
  the history complete - and because only a complete history may be used to
  rebuild what is inside storage units, those items never reached your
  holdings. An error on such a request is now checked against the newest page:
  if that still answers, the history simply ends there.

## 0.2.23 - the whole history, and prices on the day you arrive

### Operations

- **The server backs itself up every night** to object storage, keeps two
  weeks, and the restore path was tried rather than assumed: the backup was
  fetched back, read into a scratch database, and counted - same rows as the
  live one.

### Admin

- **The closed beta is managed in the admin area.** Accounts that tried to
  sign in without being allowed are listed with how often they tried - one
  click lets one in - and an account that has not tried yet can be added by
  its SteamID. Removing one also ends its sessions, so it is worded as what it
  is.

- **The admin area can start anything and says when something keeps
  breaking.** Every server job has a "run now", the operator's own syncs can be
  queued from the same page, and a job that has failed three times in a row -
  or a sync type that fails more often than it works - is named at the top
  instead of hiding behind its latest attempt.
- **A usage chart**: syncs per day over the last thirty days, failures picked
  out.
- **The page refreshes itself** as often as you choose, or not at all.

- **An admin area inside the app**, for the account that runs the service: what
  the server's own jobs last did, every account with its holdings and stored
  access, and the most recent syncs of everybody. All of it needed a shell on
  the server until now. It is shown to the operator's account only, and the
  routes behind it still ask Cloudflare Access as well.
- **A way into the admin area that works from inside the app.** The page asked
  Cloudflare Access in the background, where a login cannot be shown, and said
  it had no answer. There is a button now that goes through Access and comes
  back.
- **The run log moved out of Settings** on the web and sits in the admin area,
  next to the runs of every other account. In the local app it stays where it
  was.
- **The Buff163 login belongs to the service, not to a person.** It is stored in
  the admin area, encrypted like every other credential, and the nightly price
  pass uses it for everybody - no user's cookie, and no longer only an
  environment variable on the server.

### History

- **The history is read to its end.** A walk stopped after forty pages - two
  thousand events - and reported that there was more, which left the storage
  units half-known. There is no page limit any more.
- **A history Steam pauses is no longer a failed sync.** After a long walk
  Steam answers the next request with an error for a while. What was read is
  kept, the run says what stopped it, and it carries on by itself ten minutes
  later. Asking for a sync by hand starts it again at once instead of waiting.

### Prices

- **Items synced during the day get today's prices right away.** The daily
  price passes write a snapshot only for items somebody holds, so anything that
  arrived after the night's pass - stickers, cases, charms - showed no price
  until the next one. The reading is already there and is now used.

### Connections

- **You are told when ForceBuy loses access.** A Steam session ends sooner or
  later - a sign-in elsewhere, a password change, or just time - and until now
  the app only said so on that inventory's own page, where nobody was looking.
  A line now sits above every page until it is dealt with, with the way to fix
  it, and the browser notification fires once if you allowed those. The same
  for a stored key a marketplace has stopped accepting.

- **A Steam cookie starts working the moment it is saved**: inventory, history
  and market receipts are queued right away. The same for a CSFloat key, whose
  trades are read as soon as it is stored.

### On the web

- **No catalogue buttons for visitors.** The catalogue belongs to the server
  and is refreshed once a night for everybody; a button per person asked the
  same source for the same answer.

## 0.2.20 - a job gets a line of its own

### On the web

- **Syncs no longer stall on "queued".** A job outlives the request that
  started it, but it kept using that request's database connection after the
  request had handed it back - a connection that no longer belongs to any
  account, so the row rules hid everything from it: the job reported "inventory
  not found" and could not even write that down, leaving the run on "queued"
  forever. Every job now takes a connection of its own and gives it back when
  it ends.

## 0.2.16 - ForceBuy says who it is

### Steam

- **ForceBuy no longer pretends to be a browser when it talks to Steam.** It
  now says its name, its version and where to complain. That was the promise
  from the start, and it turns out to be the practical answer too: a request
  Steam refused from a server address is answered in full once the caller
  identifies itself.

### On the web

- **The sign-in page is tidier**: the Steam button is drawn from Valve's own
  vector logo instead of their 180-pixel image, so it stays sharp, and the
  small print sits at the bottom where small print belongs.

## 0.2.15 - hand your inventory in

### On the web

- **Handing an inventory in as a file was withdrawn again.** The server reads
  Steam itself once more, so the extra step had no reason to exist.
## 0.2.12 - usable on a phone

### Layout

- **On a narrow window the navigation is a drawer** behind a menu button
  instead of a rail that took two thirds of the screen. Entries are taller, so
  a finger hits them.
- **Dashboard widgets take the full width on a phone.** A widget sized to a
  quarter of a wide window came out 90 pixels wide, which cut figures in half.
  The layout you set for a wide window is untouched and comes back on one.
- **The status bar keeps to its one line.** It used to wrap into a second line
  and lie across the last row of the page.
- **An item's name no longer squeezes into a narrow column** next to its
  buttons; the buttons move to their own line.

## 0.2.7 - sources named where their prices appear

### Prices

- **Every marketplace a price comes from is now named and linked where the
  price is shown**: under the marketplace panel of an item's page, under an
  item's price chart and under the price table in the catalogue. Skinport and
  CSFloat are credited like Steam, Buff163 and the catalogue data already were.
- **Buff163's daily list now runs once a calendar day as soon as ForceBuy is
  running**, like the other daily lists, instead of 24 hours after the last
  run. Opening the app in the morning no longer waits until the time of
  yesterday's run.

## 0.2.6 - daily prices and price history for the whole catalogue

### Prices

- **CSFloat prices now arrive for every weapon, knife, glove, agent, pin and
  music kit in one request a day**, without an API key. They come from the item
  file csfloat.com itself loads, and are fetched on the first check after you
  start ForceBuy on a new day.
- **These are CSFloat's reference prices, not the cheapest listing.** CSFloat
  works them out from recent sales; on the items compared they sat 1 to 5
  percent above the cheapest offer. The marketplace panel on an item's page marks
  them "reference", and they are never named as the cheapest place to buy.
- **Skinport is a new marketplace.** Its public price list gives the cheapest
  offer for cases, stickers, souvenirs, graffiti and charms, which CSFloat's
  file has no price for, in one request a day and without an account. It shows
  up in the marketplace panel of an item's page and in the catalogue.
- **Both lists are kept as a daily price history for the whole catalogue**, not
  only for what you hold. An item's price chart draws from it, so something you
  buy tomorrow already has its history. Buff163's daily list, for those who use
  it, now shows up on the chart the same way.
- **The CSFloat price run only asks for what CSFloat's file has no price for.**
  Cause of the refusals some of you saw: CSFloat allows 200 listing searches an
  hour per key, and a run over a few hundred held items used them up in about
  thirteen minutes.
- The history takes room: about 1.3 GB a year for both lists together.

## 0.2.2 - a new database under the hood

### The database moves to PostgreSQL

- **ForceBuy now stores its data in an embedded PostgreSQL database (PGlite)**
  in a folder called `pgdata` next to your settings. It is the same database
  the web version of ForceBuy will run on, so both share one set of code.
- **The first start after the update moves your existing data across.** On a
  large ledger that takes about twenty seconds. Every table is counted after the
  move, and if anything does not add up the move is not used and ForceBuy tells
  you why.
- **Your old `forcebuy.sqlite` is not changed or deleted.** It stays in the data
  folder exactly as it was, so an older release can still open it. Once the
  move has worked it is no longer read.
- **While ForceBuy starts, the browser shows "ForceBuy is starting"** and
  reloads by itself, instead of an error page that never recovered. If the
  database cannot be opened, that page says why.
- The download is larger (about 49 MB), because the database engine ships with
  it.

### Changed along the way

- **"Export SQLite" still gives you one SQLite file** that any SQLite tool opens,
  with everything in it. It is now written from the database when you click,
  so a large ledger takes a few seconds.
- **Moving the data folder no longer overwrites a database at the target.** One
  that is already there is renamed to `pgdata.replaced-<time>` and kept.
- **Filter menus list their options alphabetically**, and pages of the history
  and the holdings no longer depend on the order rows happened to be written
  in. Before, two rows with the same time could swap places between pages.

## 0.2.1 - a new look for forcebuy.net

### forcebuy.net

- **The page has a light design in ForceBuy's colours**, with "ForceBuy..
  coming soon" and the access code entered digit by digit.
- **The code is sent as soon as the last digit is in.** Pasting the whole code
  into any box works too, and a wrong code clears the boxes to start again.
- **Fonts come from forcebuy.net itself.** Opening the page makes no request to
  Google or any other third party.

## 0.2.0 - forcebuy.net opens behind an access code

### ForceBuy on the web: the first step

- **Version numbers move to 0.2.** This is the line in which the web version of
  ForceBuy is built. The local app stays and keeps working as before.
- **forcebuy.net is set up as a closed page.** Visitors see "coming soon". A
  personally handed-out access code unlocks a browser for 30 days and leads to
  the download of the local app; the web app itself cannot be used yet.
- A browser can be locked again from the same page. Changing the access code
  locks every browser that was unlocked with the old one.

## 0.1.45 - refresh one marketplace, and tidier filters

### Refresh prices per marketplace

- **Settings has a button per marketplace** - Steam, CSFloat, Buff163 - that
  asks that marketplace for every held item and applied sticker right away,
  whether or not it is your price source. Steam and CSFloat skip what they
  priced within the refresh interval; Buff163 starts its daily goods list, or
  carries on where today's pass stopped.
- A button stays off until the marketplace's key or session cookie is saved.
- Such a run does not delay the regular price refresh.

### Filters

- **Every filter has a small heading** on the Holdings, Catalog, History,
  Inventories and Prices pages, and the "Filters" title at the start of the bar
  is gone. Placeholders that only repeated the heading now say "Any".

## 0.1.44 - what you set by hand stays

### Values you set by hand are no longer overwritten

- **What you change on an item's page stays as you left it**, whatever a sync
  finds later: quantity, location, float, pattern, purchase and sale dates and
  prices, applied stickers and charms. Until now the inventory sync rewrote
  float, name tag, quantity, location, stickers and charms whenever Steam said
  something else, and a Steam market, CSFloat or Buff163 purchase replaced a
  cost typed by hand - an edit was never recorded as one, so nothing knew to
  leave it alone.
- **When a sync reports something different, the field says so:** which value,
  from where and how long ago, with "Use that" to take it.
- When a sync reports the value you set, or you type the value it suggested,
  the field belongs to the syncs again.
- Marking items as sold, moving them to a storage unit and setting a cost from
  the list count as edits too, and undo puts the mark back with the value.
- Saving an item's page no longer moves its purchase and sale times to
  midnight: only the fields you changed are sent.
- A storage unit copy you edited is no longer removed when the history shows
  fewer such items in the unit.

## 0.1.43 - an item's value when your price source has none

### Held items are valued from every marketplace ForceBuy knows

- **When your price source has no price for an item, the last price another
  marketplace gave is used instead** - until your price source has one of its
  own, which then always wins. On a real account with CSFloat as the price
  source, held items with a value went from 402 to 704 of 1,152: CSFloat does
  not list many cheaper items, and Buff163 does.
- **Holdings, totals and an item's page use the catalogue's daily prices.** An
  item the Buff163 daily list priced has a value even if nothing ever asked
  about it by name. The marketplace list on an item's page shows those prices
  too.
- The portfolio chart follows the same order: your price source first, a price
  you typed next, then the latest other marketplace.
- "Fill gaps from Steam" now only decides whether Steam is asked. It used to
  also throw away Steam prices already stored when it was off, leaving such
  items with no value at all.

## 0.1.42 - Buff163 prices for the whole catalogue, and a price history

### Buff163 prices for the whole catalogue

- **Buff163 can be the price source, or one of the marketplaces compared.**
  Once a day ForceBuy reads Buff163's whole goods list, sorted by price, and
  keeps each item's lowest ask, highest buy order and number of listings as that
  day's price - for every item Buff163 sells, not only the ones you hold. A full
  pass is about 35,000 goods and takes about 40 minutes, one page every five
  seconds.
- Items you hold that the list missed are looked up by name; whatever still has
  no Buff163 price from the last 36 hours gets Steam's.
- A pass that is slowed down or stopped continues from the page it reached,
  later the same day, instead of starting over.
- On a real account the first pass priced 25,027 goods before the Buff163 login
  ran out, 24,671 of them catalogue items, and 464 of 1,152 held items. A day of
  Buff163 prices takes about 2 MB.
- An expired Buff163 login stops the pass with "The Buff163 login has expired",
  and the pass keeps its place until a fresh session cookie is pasted in
  Settings.
- Buff163 is now asked at most once every five seconds instead of three, for
  the purchase history too: at three seconds it slowed ForceBuy down after ten
  pages of the goods list.

### Prices in the catalogue

- **Every catalogue card shows a price per form** - Normal, StatTrak™,
  Souvenir - from the price source chosen in Settings, as a range from the
  cheapest condition to the dearest, in your currency. A form without a price
  from that source says so instead of showing nothing.
- **A skin's details list every variant against every marketplace:** each
  condition in each form, with the asking price and the highest buy order, and
  when it was seen. The price source from Settings is marked.
- **Every price ForceBuy reads is kept as price history.** Prices from the price
  refresh, the Steam gap filling, the comparison sources and "ask all
  marketplaces" on an item's page now also go into the catalogue's daily prices,
  and the prices recorded so far were copied in once. The first price of a day is
  kept; nothing already recorded is overwritten.
- Emptying the holdings in Settings no longer deletes the price history: prices
  belong to the item, not to your holdings.

## 0.1.41 - Buff163 purchases, and storage items that know where they came from

### Buff163 purchases and sales

- **Your Buff163 purchase and sale history is read and matched to your
  items**, with the session cookie from Settings. A matched purchase gets its
  price in yuan, converted at the rate of the day it was paid, and "Buff163" as
  its origin. On a real account 492 of 533 Buff163 purchases found their copy,
  and 486 held items gained a purchase price.
- Refunded purchases and sales the buyer never paid for are left out: no money
  moved.
- A marketplace connected after the first sync is now read from its first
  trade. Every source used to be read only from the day of the last sync, so a
  newly connected Buff163 account with purchases from 2022 to 2025 would have
  shown none of them.
- Payments in yuan kept no currency and could never be converted; they are
  converted like any other.
- The cookie only ever goes to buff.163.com, Buff163 is asked at most once
  every three seconds, and ForceBuy only reads - it never buys, sells or lists.

### Items in storage units get their arrival

- **Items rebuilt from storage unit deposits now get the date and origin of
  the trade, drop or purchase that brought them in.** Steam changes an item's
  class id over time, and the history lists each event under the id of that
  day. Cases that came in by trade under one id and went into a storage unit a
  day later under another never met, so the rebuilt copies kept no arrival
  date - on a real account 449 of 4,254 - and no marketplace purchase could be
  matched to them. Now 78 are left, and items with no origin at all went from
  474 to 103.

## 0.1.40 - the setup over a working install

### The setup over a working install

- **The app no longer opens the setup when its server is briefly away.** A
  start page that got no answer from the server treated that as "not set up
  yet" and showed the setup; clicking Continue in its first step then saved the
  finished setup as unfinished, and every later start opened the setup again.
  Your data was never touched. The app now says the server is not answering and
  keeps trying, and choosing a folder in the setup keeps what that folder
  already says about being set up.
- The Buff163 session cookie can also be entered during setup, next to the
  CSFloat key.

## 0.1.39 - CSFloat sales, and a place for the Buff163 cookie

### CSFloat sales and the Buff163 cookie

- **CSFloat sales are no longer read as purchases.** Telling a sale from a
  purchase needed the "CSFloat user id" setting, and with it empty every trade
  was taken for a purchase - both parties are named on every trade, so the
  fallback never found a sale. ForceBuy now asks CSFloat which account the key
  belongs to, and the setting is gone. Sales read from now on are booked as
  sales.
- **New setting: Buff163 session cookie.** Stored beside the API keys, never in
  config.json, and only ever sent to buff.163.com. Nothing uses it yet - it is
  the first step of the Buff163 connection for prices and purchase and sale
  history.

## 0.1.38 - Steam syncs that finish what they start

### Steam syncs that finish what they start

- **The market history import picks up where it stopped.** A first import that
  Steam throttled partway through was never completed: every later run read
  the newest five pages and nothing older, so purchases further back never got
  their receipt. The position is now saved after every page, with the year the
  rows had reached, and the next run carries on from there until the end.
- A routine market sync stops at the first page with nothing new instead of
  always reading five, one request where five were spent before.
- Receipts that were already read are matched even when the sync is cut off
  by Steam. The matching used to be skipped along with the rest of the run.
- **A failing sync is retried after 15 minutes, not every minute.** A failed
  run did not count as tried, so the scheduler queued it again on its next
  tick - one Steam request a minute for as long as the error lasted. Those
  failures also pushed the last successful runs of other jobs out of the list
  the scheduler read, after which inventory and price syncs were queued every
  minute as well.
- The inventory sync shows how many items it has read out of how many, per
  account, instead of "1 of 1". An inventory read that stops before Steam's
  last page is now refused instead of being taken as the whole inventory,
  which would have marked the unread items as gone.

## 0.1.37 - a chart that ignored its own buttons

### The price chart on an item's page

- **30D, 90D, 1Y, All and Since owned now draw different windows.** They used
  to filter the prices and then draw whatever was left edge to edge. ForceBuy
  has only been recording prices for a few days, so every window kept the same
  handful of points and the chart looked identical whichever button was
  pressed. The axis now spans the window you chose, and a note says from which
  day prices exist when that is later than the window starts.
- The date axis follows your number and date setting instead of a fixed
  British format, and shows the year once a window is longer than half a year -
  "Sep 13" on a one-year axis could have been either end of it.
- Prices on the axis are written short with their currency ("$56", "$12.3K")
  instead of as full amounts that did not fit.
- The chart uses the theme's colours, so it is readable in the light theme.

### Axes on dashboard charts

- **Money axes show money.** Values are charted in cents, and the axis printed
  them as bare numbers - a bar worth $123.45 stood against a tick reading
  "12.3k". Money, ratio and float axes now carry their unit.

### Cost and sell price on an item's page

- **Shown in the currency chosen in Settings.** An amount keeps the currency it
  was recorded in, so a purchase recorded while the ledger was in EUR kept its
  EUR number after switching to USD - and the page printed it under "Cost (USD)"
  unchanged. It is now converted at the exchange rate of the day it was paid,
  with the original amount named underneath. Where no rate exists the field is
  left empty and says why, rather than showing the wrong number.
- Saving the form no longer rewrites an amount you did not touch. A price you
  do type is stored in the Settings currency.
- The profit on that page is worked out from the converted figures.
- The holdings list and portfolio totals do not convert these amounts yet.

### The status bar

- **It says what is running and what is waiting.** With several jobs pending it
  used to list them all in one line, with a counter only on the one reporting,
  so it looked like everything was running at once. It now shows the job that
  is working, how far it is, which pass it is on and roughly how long is left,
  plus how many are waiting. Clicking it opens the whole queue: progress bar,
  the item being worked on, and each waiting job's place in line.
- A job that is marked as started but is no longer queued is labelled "Not
  running" instead of looking busy forever.
- The exchange-rate job had no name and appeared as "jobs.fx"; a price
  comparison pass appeared as a raw key too.

### Starting from source

- **`pnpm dev` starts on Windows machines whose PATH lacks `System32`.** The
  tool that ran the API and the web server side by side started each through a
  bare `cmd.exe`, and failed with `spawn cmd.exe ENOENT` before either server
  came up. A small script in the repository starts both directly now.

### Every price in your currency

- **Costs and sale prices follow the currency in Settings.** An amount kept the
  currency it was imported in, so after switching the setting older costs were
  still counted in the old money - on every page that adds them up: holdings,
  collections, the portfolio totals, the dashboard. They are now restated in
  the chosen currency at the exchange rate of the day they were paid. The
  original payment is kept, so switching back gives the exact amount again
  rather than a conversion of a conversion.
- Where no exchange rate exists for a payment's day, the amount stays empty
  until one arrives, instead of showing its number in the wrong currency. The
  next exchange-rate update fills it in.
- **Manual prices** are converted as well. A price typed while the ledger was in
  EUR valued the item at the same number in USD after a switch.
- **Transactions** in History show every payment in your currency; what was
  actually charged is in the tooltip.
- **Bulk "cost" and "sold"** store the amount in your currency, and undo puts the
  currency back too.
- **Dashboard totals of purchases and sales** convert each payment at the rate
  of its own day instead of adding euros and dollars together. The portfolio
  line converts each price at the rate of the day it was seen.
- **A dashboard widget can be set to another currency** in its editor. That is
  the one place a figure may leave the Settings currency, and the widget says
  which one it uses.
- **CSV export** names the currency of every amount, and **import** follows it
  instead of assuming the importing ledger's.
- A marketplace purchase paid in a currency with no rate for that day now still
  records its date and origin. Before, the whole match was skipped.

### The app stays responsive during a history sync

- **ForceBuy no longer freezes while it reads your inventory history.** After
  every history sync it went through the whole stored history again, item by
  item, and the database driver does that work without ever letting the app
  answer anything in between. On a real account that took six and a half
  minutes each time - pages stayed on the loading screen and the status bar
  could not report anything. The same work now takes one to four seconds, and
  requests get through while it runs.
- **Item timelines no longer fill up with repeats.** Every sync wrote "moved to
  storage unit" again for each item already in a unit; one account had 59,734
  such lines. The repeats are removed on the next start, and a sync now only
  records what actually changed.
- An item that went into a storage unit and has been seen in your inventory
  since is no longer moved back into the unit by that old deposit.

### Labels that say what they show

- **"Value over time" starts once prices cover the ledger.** The first days of
  price collection knew only a fraction of the items, so the line began at $0
  and climbed to over $5,000 in three days - how far the price job had got, not
  what the portfolio was worth. Days whose prices cover less than nine tenths of
  the best-covered day are left out.
- **Time charts have a real time axis.** Points were spaced evenly whatever lay
  between them, so 6, 9 and 13 September sat one step apart, just like 3 and 4
  September.
- **Item names on bar charts are readable**: one line each, shortened in the
  middle, the full name on hover. They used to wrap into each other.
- **Cost basis and P/L say what they add up.** A cost basis counts only items
  that have a cost, and an unrealised P/L only those with a cost and a price.
  Dashboard tiles, the top bar and collections now say how many items that is,
  so a value of $1,405 next to a cost of $252 no longer looks like arithmetic
  gone wrong. A collection with no known cost shows none instead of $0.00.
- **"Items held" counts items held.** It counted every row in the ledger, sold
  and ignored ones included, and disagreed with the top bar. Existing
  dashboards are updated on start.
- **Steam market dates have no time of day.** Steam only gives the day, and
  every row showed "02:00". Purchases from the Steam market history show the day
  on an item's page too.
- **An unmatched sale** in History says "No copy matched" instead of the purchase
  wording "Item not here yet - paid for, but nothing matches".
- **Item page:** the price hint names the marketplace and the age of the price
  instead of "csfloat · -", and the origin hint reads "Mission reward · Inventory
  history" instead of internal codes.
- **Prices page** names marketplaces instead of internal ids, and the manual
  price fields name the currency.
- **Status bar** shows "Failed" with the reason on hover instead of a raw code
  such as "INTERRUPTED".

### Steam market purchases get their costs

- **Steam market dates had the wrong year.** Steam prints market dates as "2
  Oct" without a year, and ForceBuy put every one of them in the last twelve
  months. A purchase from 2015 was dated 2025 - with the wrong purchase date, an
  exchange rate from the wrong year, and no way to match it to the item it
  bought. The year now comes from your inventory history, which records the
  same purchase with its full date, and from the order of the list while it is
  read.
- **Every purchase goes to its own copy.** Several purchases of the same item
  were all written onto the first copy - on one account 890 Fracture Case
  purchases landed on a single case, and more than a thousand bought items had
  no cost at all. Each receipt now goes to one copy, preferably the one that
  arrived that day; a sale goes to a copy that could actually have left.
- **Existing ledgers are matched again on the next start.** What the old matches
  wrote is cleared and redone from the stored history and receipts. Nothing is
  fetched from Steam for it, and prices you typed or got from CSFloat stay as
  they are. The status bar shows it as "Matching receipts".
- On the account this was measured on, held items with a known cost went from
  273 to 1,619.
- A leftover second storage unit named "Moved to Storage Unit" is removed; it
  doubled the count on the storage tab.

### Every table sorts by every column

- **A click on any column header sorts the table.** Many columns could not be
  sorted at all: on Holdings the ask, bid, value, P/L, applied, sold via, sold
  price, collections and origin columns; on History the account, marketplace,
  match, asset id and listed columns; standing on Inventories, owned in the
  catalog, and every column of a collection's items, the fee table, the
  exchange rates, the marketplace prices, the rate limits and dashboard widgets
  shown as a table.
- Ask, bid, value and P/L are sorted across the whole list, not within the page
  you are on. They are worked out from prices rather than stored, and ordering
  only the fifty rows on screen would have looked sorted without being so.
- **Empty cells go last in both directions.** Sorting by sale price used to
  open on a page of unsold items, because the database puts missing values
  first when ascending.

### What the stickers on a skin are worth

- **The holdings list and an item's page show the total price of the applied
  stickers** in the currency chosen in Settings, beside the stickers
  themselves. It is information, not part of the skin's value: applying a
  sticker uses it up, and how much of its price a skin keeps depends on the
  skin, the sticker and the buyer.
- When only some of the stickers have a price, the figure says how many it
  covers ("3/4" in the list, "3 of 4 priced" on the item page), so two priced
  stickers out of four do not pass for the whole set. With none priced it says
  so instead of showing zero.
- A "Sticker value" column can be added to the holdings table and sorts across
  the whole list.
- **The price run now also asks for applied stickers.** Steam stores a sticker
  on a skin without the "Sticker | " the market lists it under, so these prices
  were never fetched: on a real ledger 4 of 67 applied sticker names had one.
  Each sticker name not already held as an item is one more request per price
  run - 53 on that ledger, next to 1,141 item names. "Price applied stickers"
  in Settings switches it off.

### Axis labels that do not repeat

- **Neighbouring ticks on a value axis no longer print the same number.** The
  chart picked ticks a quarter apart and the label was rounded by the size of
  the amount alone, so an item quoted between $175 and $176 showed "176 $"
  twice and a portfolio that moved a few dollars read "$5.6K" on every line.
  Ticks now step by 1, 2 or 5 and each label carries the decimals its step
  needs - on item prices, dashboard money, counts, floats and percentages.
- Percentage axes printed 1.25% as "1%"; they now show the step's decimal.
- The chart on an item's page is called "Price history" instead of "Portfolio
  history" - it shows that item's price, not the portfolio.

## 0.1.35 - a profit that was too high

### The navigation rail

- **The rail can be moved, resized, collapsed and reordered.** It docks left or
  right, drags to any width between icons-only and roomy, folds to glyphs, and
  its entries can be dragged into whatever order suits the way you work.
- The arrangement is remembered in the browser rather than in the ledger. It is
  how one person likes their own screen, not a fact about their inventory, and
  it should not travel with a backup.
- A page added by a later release appears at the end of your order rather than
  disappearing because your order never mentioned it.

### Where your data lives

- **`FORCEBUY_DATA_DIR` no longer changes where ForceBuy looks next time.** It
  used to rewrite the stored location as a side effect, so a single run started
  with that variable - a test, a second instance, a script - silently moved
  every later start to that directory. An override meant for one run must not
  outlive it.
- Choosing a folder in Settings still records it. That is the user saying so,
  which is a different thing.

### CSFloat bids

- **CSFloat does have buy orders.** ForceBuy's notes said it had none, on the
  strength of one request that came back "method not allowed" - which was read
  as "no such thing" when it meant the opposite: that address is where a buy
  order is created, which ForceBuy will never do.
- The bid column still shows nothing for CSFloat, and now for an honest reason:
  the address that gives the highest standing offer for an item is not known
  yet. What is readable is the account's own open orders, which is a different
  number.

### The price chart on an item's page

- **It drew every marketplace on one line.** On a real item CSFloat said 56.00
  and Steam said 79.75 on the same day, so the line stepped whenever a
  different source happened to answer last - which reads as a crash rather than
  as what it was.
- **It now draws one source**, the one the ledger is valued at, and says whose
  line it is. Where more than one has history, a picker switches between them.

### Amounts you type

- **"Cost" and "Sell price" name the currency** instead of saying "major
  units", which told nobody which money to type. They follow the ledger's
  currency, like the filters above them.

### Realised profit

- **A sale on CSFloat was counted as more profit than it made.** Steam's market
  history reports what arrives as wallet balance, already net of its cut;
  CSFloat reports what the buyer paid, before its own. Both were treated as the
  same number, so every CSFloat sale carried its 2% fee as profit - and the
  mixture made it hard to spot, because the Steam rows were right.
- **Profit is now worked out from what arrived.** A cost basis is what left the
  wallet, so the other side has to be what entered it.
- **"Sold for" shows both figures** where they differ: what the marketplace
  said, and what was left after its selling fee.
- A marketplace whose fee is not in the table is left at face value. A guessed
  fee would be invisible; a profit that is slightly too high is at least a
  number worth questioning.

## 0.1.33 - where the same item is cheapest

### Prices, continued

- **A price run can ask more than one marketplace**, so an item's page has
  something to compare. Off by default and the setting says why: every extra
  source is another request per name, which is the cost the whole price
  architecture is built around.
- Those prices never value the ledger. That stays the source you chose, because
  a portfolio total that switched marketplaces between runs would be a total
  nobody could explain.
- **A price was counted as fresh per name rather than per marketplace.** A gap
  filled from Steam ten minutes earlier would suppress the next run of the
  source you actually chose, and the ledger sat on a price that source never
  gave.

### Prices

- **The marketplace table now says where an item is cheapest to buy and where
  the best standing offer is**, marks both rows, and gives the gap between
  them. The numbers were all there before; the comparison was left to the
  reader.
- The gap is stated before selling fees and cashout, and says so. What a sale
  nets depends on the marketplace, the payout method and the account's volume
  tier, so a profit figure here would be a guess dressed as a number.
- A gap is only reported between two different marketplaces. The spread inside
  one of them is that market's own and not a trade anyone can make.

## 0.1.30 - a rate with a date on it

### Exchange rates

- **The calculator can be pointed at a date.** Left empty it converts at
  today's rate as before; with a date it answers what the amount was worth
  then, and names the day the rate is from - a Friday, for a purchase made at
  the weekend.

### Reading the history

- **A history read that was picked up where it left off could start over from
  the top.** Caught before anyone met it: when the resumed page came back
  empty, the search for older entries counted back from today rather than from
  the resume point, and read the whole history again.

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
