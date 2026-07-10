# Nebula — ein modernes Syncthing-Theme

`Nebula` ist ein dunkles, ruhiges Dashboard-Theme mit Cyan-/Indigo-Akzenten,
animierter Aurora im Hintergrund und klar getrennten Statusfarben. Es ist ein
kleines CSS-Overlay, kein Fork der Syncthing-GUI.

## Inhalt

```text
themes/nebula/assets/css/theme.css  # das Theme
docker-compose.yml                  # lokales Docker-Beispiel
```

## Docker: Schnellstart

1. Passe in `docker-compose.yml` bei Bedarf `PUID`, `PGID`, `hostname` und die
   Verzeichnisse an.
2. Starte den Container:

   ```bash
   docker compose up -d
   ```

3. Öffne die Syncthing-GUI, gehe zu **Actions → Settings → GUI** und wähle bei
   **Theme** den Eintrag **nebula**. Speichern; die Oberfläche lädt neu.

Das Theme wird gezielt nach
`/var/syncthing/config/gui/nebula` gemountet. Syncthing nimmt von dort
`assets/css/theme.css` und verwendet für alle anderen Dateien seine eingebauten
Standard-Assets. Es bleibt deshalb bei Syncthing-Image-Updates erhalten.

> Das Compose-Beispiel nutzt `network_mode: host`, wie von Syncthing für eine
> zuverlässige LAN-Erkennung empfohlen. Auf Docker Desktop für macOS/Windows
> ist Host-Netzwerk eingeschränkt; dort Ports explizit veröffentlichen oder
> einen Linux-Host verwenden.

## Ohne Docker

1. Finde den tatsächlichen GUI-Override-Pfad:

   ```bash
   syncthing --paths
   ```

2. Kopiere den Ordner `themes/nebula` in den dort ausgegebenen
   `GUI override directory`.
3. Wähle `nebula` wie oben in den GUI-Einstellungen.

Alternativ kann `STGUIASSETS` auf ein Verzeichnis gesetzt werden, das den
Unterordner `nebula/` enthält.

## Anpassungen

Die Farbpalette steht am Anfang der CSS-Datei in `:root`. Besonders einfache
Startpunkte sind `--nebula-cyan`, `--nebula-violet` und `--nebula-void`.
Die animierte Hintergrund-Aurora berücksichtigt `prefers-reduced-motion` und
wird bei aktivierter reduzierter Bewegung praktisch abgeschaltet.

## Sicherheit

Wenn die GUI außerhalb des eigenen Rechners erreichbar ist: Syncthing-GUI mit
Passwort absichern und TLS bzw. einen korrekt konfigurierten Reverse Proxy
verwenden. Das Theme verändert keine Sicherheits- oder Sync-Einstellungen.
