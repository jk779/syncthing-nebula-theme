FROM syncthing/syncthing:latest

# Keep the GUI override outside Syncthing's persisted /var/syncthing volume.
COPY themes/nebula /opt/nebula-gui-assets/nebula

ENV STGUIASSETS=/opt/nebula-gui-assets
