merrimack
=========

Monitoring stuff

Frequency of polling (be cron-like)

Ways to monitor:

- capture all
  - `log` directory
  - is it up?
  - how long did it take to load?

- capture if it changes
  - `snapshot` directory
  - pruner to delete duplicates and email upon changes

# specific snapshots currently taken
  - iso3166-1
  - iso3166-2
  - kyoiku_kanji

# snaphots to be added
  - area codes
  - timezone database changes
  - tickers added/deleted to stock markets
  - git repos added/deleted/changed
