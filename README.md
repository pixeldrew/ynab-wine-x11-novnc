## ynab-wine-x11-novnc

keep ynab around after 32bit support goes away on osx.

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager
* YNAB


## Run It

    docker build --rm -t ynab:latest .
    docker run --rm -p 8080:8080 --name ynab -v "`pwd`/data:/root/prefix32/drive_c/users/root/" ynab
    open http://localhost:8080

In your web browser you should see YNAB:

## Modifying

You should add this dockerfile to a compose where you save the volume

## Issues

* Wine could be optimized a bit
* Fluxbox could be skinned or reduced
* x11vnc could use some pixel caching
