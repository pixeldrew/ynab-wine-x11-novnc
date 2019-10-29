## ynab-wine-x11-novnc

Keep ynab around after 32bit support goes away on osx, thanks to Xvfb, x11vnc, noVNC and Wine. Originally based on solarkennedy/wine-x11-novnc-docker's work.

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Wine
* YNAB

## Run It

    docker run --rm -p 8080:8080 -h ynab --name ynab -v "`pwd`/_data:/root/prefix32/drive_c/users/root/" pixeldrew/ynab:latest
    open http://localhost:8080

In your web browser you should see YNAB

## Issues

* Wine could be optimized a bit
* Fluxbox could be skinned or reduced
* Could have some instructions on how to sync with Dropbox
* YNAB may crash if _data doesn't have a "My Documents" folder
* Somewhat slow
* Should create dedicated UID's to not run wine as root.