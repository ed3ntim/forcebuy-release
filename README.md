# ForceBuy

**CS2 inventory & market ledger.** Runs on your machine, in your browser, on
your data. No account, no website, no tracking, no ads.

---

## Start it

**Windows:** double-click `ForceBuy.cmd`.

**macOS / Linux:** run `./forcebuy.sh` in a terminal.

Either way it opens **http://127.0.0.1:8787** in your browser. To stop it, close
the terminal window it opened.

> **Needs Node.js 20 or newer.** If it is not installed, the start script says so
> and points you at [nodejs.org](https://nodejs.org). Everything else is in this
> folder; there is nothing to install and nothing to build.

First launch opens a three-step setup: where your data lives, which Steam
account, and where prices come from. Only the first step is required.

---

## What it does

ForceBuy keeps a ledger of your CS2 items: what you own, what it is worth right
now, what it cost you, and what you actually made when you sold it.

- **Your inventories**, synced from Steam, including private ones once you
  connect the account.
- **Prices** from the Steam Community Market or CSFloat, ask and bid kept apart.
- **Real cost basis for items bought outside Steam.** Steam records that an item
  arrived by trade but never what it cost. Connect CSFloat and ForceBuy matches
  each payment to the trade that delivered it.
- **A catalogue** of every CS2 item, filterable by kind, rarity, collection,
  sticker finish and float range.
- **A currency calculator** on European Central Bank reference rates, with USD,
  EUR and CNY always side by side.
- **A dashboard** you build yourself, with 34 ready-made panels to start from.
- **Collections**, your own groups of items with their own totals.

---

## Connecting a Steam account

Adding an inventory by SteamID, vanity name or profile URL reads a **public**
inventory. To read more, you connect the account.

**There is no password field, and there never will be.** You paste one cookie
(`steamLoginSecure`) from a browser you are already signed in to. ForceBuy checks
it against Steam, checks that it belongs to the account you pasted it into, and
stores it separately from everything else so a backup does not carry it along.

With the account connected it can read private inventories, inventory history,
market history and storage unit movement. You can revoke it at any time.

### What ForceBuy does with that access

It reads. That is the whole list.

Nothing here lists an item, accepts a trade, sends a trade or changes anything
about your account. Every outbound request is a GET, the session cookie only ever
goes to `steamcommunity.com` over https, and it is never carried across a
redirect.

The local server also refuses requests from any web page that is not served from
your own machine, so a website you have open cannot reach into your ledger.

---

## Where your data lives

You choose the folder during setup. It holds:

| File | What it is |
| --- | --- |
| `forcebuy.sqlite` | everything: items, prices, history, your dashboards |
| `config.json` | your settings |
| `secrets.json` | the Steam session cookie, deliberately kept apart |
| `cache/` | item pictures and the catalogue download |
| `logs/` | sync logs |

Default if you accept the suggestion:

- Windows: `%APPDATA%\ForceBuy`
- macOS: `~/Library/Application Support/ForceBuy`
- Linux: `~/.local/share/forcebuy`

**Back up that folder.** There is no automatic backup yet.

Updating is replacing this folder with the new one. Your data lives elsewhere and
is untouched.

---

## Getting started, in order

1. Finish the three setup steps.
2. Add your Steam inventory and connect the account.
3. Wait for the first sync. The catalogue takes about ten seconds; the inventory
   depends on its size.
4. Press **Refresh prices** on the Prices page. Steam allows a limited number of
   price requests, so a large inventory takes several passes. The status bar
   tells you how far along it is and when it is throttled.
5. If you buy or sell outside Steam, add a CSFloat API key in Settings and press
   **Read everything** once.

---

## Keyboard

- `Ctrl+K` opens the command palette: pages, actions, and your items by name.
  It matches letters in sequence, so `crd` finds "Cycle row density".
- `g` then `d` / `h` / `c` / `y` / `p` / `u` / `a` / `i` / `s` jumps to dashboard,
  holdings, collections, history, prices, currency, catalog, inventories,
  settings.

---

## What does not work yet

Listed honestly, because a test build that hides its edges wastes your time.

- **Steam throttles price requests hard.** Prices come one item at a time, so a
  large inventory takes several refresh passes to fill in. A bulk price source is
  the next big thing on the list.
- **Storage units.** Steam never returns their contents, in any API. ForceBuy
  reconstructs movement from deposit and withdraw events and labels the result
  *derived*, not confirmed.
- **Inventory history cannot identify a specific copy.** Steam's history rows
  name an item type, not an asset. With several identical items the link is
  marked *ambiguous* rather than presented as fact.
- **No automatic backup.** Copy the data folder yourself.
- **Buff163 and YouPin898** are listed but not connected: both need a browser
  login rather than an API key.
- **Fade percentages and pattern tiers** are not calculated. They cannot be
  derived from a paint seed without community-maintained tables, and guessing
  would produce numbers that look like facts.
- **Node.js has to be installed.** A self-contained download is on the list.

---

## Reporting something

Open an issue on this repository. What helps most:

- **The version.** Bottom right of the status bar, and in full under
  Settings → About.
- What you did, what you expected, what happened instead.
- Whether the account was connected or public.

Please do not paste your `steamLoginSecure` cookie into an issue. Nothing about a
bug report needs it.

---

## Licence

[PolyForm Noncommercial 1.0.0](LICENSE.md). Free to use and modify for
non-commercial purposes; commercial use needs a written agreement. See
[COMMERCIAL.md](COMMERCIAL.md).

Built by [ed3n](https://github.com/ed3ntim).

Item names, images and float ranges come from the public
[ByMykel/CSGO-API](https://github.com/ByMykel/CSGO-API) dataset. Prices come from
the Steam Community Market and CSFloat; exchange rates from the European Central
Bank. Every figure in the app that is not calculated locally says where it came
from.

ForceBuy is an independent fan project and is not affiliated with Valve or Steam.
