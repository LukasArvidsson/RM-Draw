# RM-Draw

My personal fork of [FouzR/xovi-extensions](https://github.com/FouzR/xovi-extensions),
used to customise the floating toolbar (`floating.qmd`) on my own reMarkable.
Licensed GPL-3.0 like the original (see `LICENSE`).

## What's different from upstream (3.28/floating.qmd)

- Pen menu "QuickTools" foldout only has the QuickTools item (Cycle Preset,
  Save Preset and Reset FloatBar are gone). QuickTools shows/hides my bar.
- The original floating bar is hidden, and long-pressing tools no longer adds
  them to it.
- Fixed bar: Fountain pen and Fineliner in the bottom-left corner, magenta,
  blue and green dots in the bottom-right corner. No border, no hide handle.
  They're hardcoded in the `RM-Draw` block at the end of the file.
- The floating layers bar is unchanged.

## If the document view breaks after a deploy

Put the upstream file back and redeploy:

    git show f63bbc5:3.28/floating.qmd > /tmp/floating.qmd
    scp /tmp/floating.qmd root@10.11.99.1:/home/root/xovi/exthome/qt-resource-rebuilder/floating.qmd

then restart xovi.

## Setup on the tablet (once)

1. xovi and `qt-resource-rebuilder` installed (e.g. via Vellum).
2. Remove the Vellum copy so it doesn't clash: `vellum remove floating-toolbar`.

## Edit and deploy

- Edit `3.28/floating.qmd` (my firmware is 3.28).
- Connect the tablet over USB and run `./deploy.sh` (or `./deploy.sh <wifi-ip>`).

## Pulling upstream fixes

    git fetch upstream
    git merge upstream/main

When the tablet updates firmware, start from the new version's folder and set
`FW=<version> ./deploy.sh`.
