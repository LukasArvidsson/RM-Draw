# RM-Draw

My personal fork of [FouzR/xovi-extensions](https://github.com/FouzR/xovi-extensions),
used to customise the floating toolbar (`floating.qmd`) on my own reMarkable.
Licensed GPL-3.0 like the original (see `LICENSE`).

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
