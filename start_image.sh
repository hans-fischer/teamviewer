docker run -d \
    --rm \
    --name=teamviewer_rdesktop \
    -e TZ=Europe/London \
    -p 3389:3389 \
    teamviewer:local