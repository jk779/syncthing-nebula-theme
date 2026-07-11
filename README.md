# Nebula — a modern Syncthing theme

`Nebula` is a dark dashboard theme with cyan, green, and violet accents, an
animated aurora background, and clearly separated status colors. It is a small
CSS overlay, not a fork of the Syncthing GUI.

## Contents

```text
themes/nebula/assets/css/theme.css  # the theme
Dockerfile                          # Syncthing image with the theme included
docker-compose.yml                  # local Docker example using the published image
.github/workflows/container.yml     # GHCR build and update workflow
```

## Docker quick start

1. Adjust `PUID`, `PGID`, `hostname`, and the directory mappings in
   `docker-compose.yml` as needed.
2. Start the container:

   ```bash
   docker compose up -d
   ```

3. Open the Syncthing GUI, go to **Actions → Settings → GUI**, and select
   **nebula** as the **Theme**. Save the settings; the interface reloads.

The published image includes the theme and sets `STGUIASSETS` to a read-only
directory outside Syncthing's persisted `/var/syncthing` volume. Syncthing
serves `assets/css/theme.css` from there and falls back to its bundled default
assets for every other file. The theme therefore survives image updates.

Images are published as `ghcr.io/jk779/syncthing-nebula-theme:latest` after
pushes to `main` and by a scheduled weekly rebuild. The scheduled build follows
the newest official `syncthing/syncthing:latest` base image.

> The Compose example uses `network_mode: host`, as recommended by Syncthing
> for reliable LAN discovery. Host networking is limited in Docker Desktop for
> macOS and Windows; publish ports explicitly there or use a Linux host.

## Without Docker

1. Find the actual GUI override directory:

   ```bash
   syncthing --paths
   ```

2. Copy the `themes/nebula` directory into the displayed GUI override directory.
3. Select `nebula` in the GUI settings as described above.

Alternatively, set `STGUIASSETS` to a directory containing the `nebula/`
subdirectory.

## Customization

The color palette is defined near the top of the CSS file in `:root`. Easy
starting points are `--nebula-cyan`, `--nebula-violet`, and `--nebula-void`.
The animated background aurora respects `prefers-reduced-motion` and is
effectively disabled when reduced motion is enabled.

## Fonts

Google Sans Flex, Stack Sans Notch, and DM Mono are bundled in
`themes/nebula/assets/font`. The theme makes no Google Fonts CDN requests at
runtime. See `themes/nebula/assets/font/LICENSES.md` for licensing details.

## Icons

The theme replaces Syncthing's Font Awesome glyphs with bundled Octicon SVG
masks while retaining Syncthing's original HTML classes. The selected icons
are stored in `themes/nebula/assets/icons` and are licensed under the MIT
License; see `themes/nebula/assets/icons/LICENSE`.

## Security

If the GUI is reachable beyond the local machine, protect it with a password
and use TLS or a correctly configured reverse proxy. The theme does not change
security or synchronization settings.
