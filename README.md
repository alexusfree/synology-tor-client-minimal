
# synology-tor-client-minimal

Tor client (Socks proxy ) - 19MB image - Tor client image qualified for Docker on Synology NAS. This Docker image launch a Tor client with a Socks proxy on port 9150 (SocksPort 0.0.0.0:9150). The proxy is opened for hosts on the local network with 0.0.0.0 IP (SocksPolicy accept 0.0.0.0).

https://hub.docker.com/r/alexusfree/synology-tor-client-minimal/

### Versions

OS : Alpine Linux  - [http://alpinelinux.org](http://alpinelinux.org) - Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox.


### Install

1. In the Synology NAS admin interface, launch Docker package
2. In the registry tab, search for the image (search for "tor client") and double click to download
3. When the download is finished, in the image tab, select the tor-client image and launch to create the container.
4. Choose a container name and add port settings : local port (9150) and container port (9150)
5. Click "Next" and adjust ressource limitation if you want. Click "Next" then click "Apply"
6. Launch the container.
7. To use, configure your browser/client to use a SOCKS server with the IP of the NAS and server port: 9150. (Use TorBrowser and change connection settings in preferences panel)
8. Your Tor client is running.

