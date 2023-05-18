
<p align="center">
  <img src=".github/img/header.png" alt="Banner" width="100%">
</p>

<p align="center">
  A personal collection of helm charts for the ultimate home server.
</p>

## Services
### Dashboard
- 🏠 [`homepage`](https://gethomepage.dev/): A customizable start page for your home server.
### Media
- 📺 [`plex`](https://www.plex.tv/): A personal media server.
- 📖 [`kavita`](https://www.kavitareader.com/): A modern reading server for manga, comics, and books.
### Media Management
- 👁️ [`overseerr`](https://overseerr.dev/): A request management and media discovery tool.
- ⏺️ [`sonarr`](https://sonarr.tv/): An automated TV show download and management system.
- 🎬 [`radarr`](https://radarr.video/): An automated movie download and management system.
- 📊 [`tautulli`](https://tautulli.com/): Monitor your Plex Media Server.
- 🐯 [`prowlarr`](https://github.com/Prowlarr/Prowlarr): Manage indexers for your *arr stack.
- 🔍 [`jackett`](https://github.com/Jackett/Jackett): An API to connect with various torrent providers.
- 🤖 [`autobrr`](https://autobrr.com/): Automatically search and download from IRC.
### Download
- ⏬ [`qbittorrent`](https://www.qbittorrent.org/): A lightweight and feature-rich torrent client.
- 📰 [`sabnzbd`](https://sabnzbd.org/): The automated Usenet download tool.
### Network
- 🌐 [`nginx`](https://hub.docker.com/_/nginx): A high-performance web server and reverse proxy.
- ☁️ [`cloudflared`](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation/): Expose services running on your home network to the internet.
### Messaging
- 💬 [`thelounge`](https://thelounge.chat/): A modern, self-hosted web IRC client.
### Notifications
- 📲 [`gotify`](https://gotify.net/docs/plugin): Self-hosted push notifications.
- 📲 [`apprise`](https://github.com/caronc/apprise-api): Multi-platform push notifications.
### Automation
- 🦅 [`huginn`](https://github.com/huginn/huginn): Create agents that monitor and act on your behalf.
- 🔄 [`changedetection.io`](https://changedetection.io): Monitor web pages for changes.
### Development
- 🎭 [`playwright`](https://playwright.dev/): A headless browser automator.

## Prerequisites

- Kubernetes 1.16+ (built for k3s)
- Helm 3.0+

## Installing the Repository

To add this repository to your Helm client, run the following command:

```bash
helm repo add home-server https://github.com/KyleTryon/homeserver-helm-charts
```

## Installing Charts

To install a chart from this repository, use the following command:

```bash
helm install [RELEASE_NAME] home-server/[CHART_NAME]
```