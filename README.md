
<p align="center">
  <img src=".github/img/header.png" alt="Banner" width="100%">
</p>

<p align="center">
  A personal collection of helm charts for the ultimate home server.
</p>

## Services

- 🌐 [`nginx`](https://hub.docker.com/_/nginx): A high-performance web server and reverse proxy.
- 🏠 [`homepage`](https://gethomepage.dev/): A customizable start page for your home server.
- 📺 [`plex`](https://www.plex.tv/): A media server that allows you to stream your personal media collection.
- 🎬 [`radarr`](https://radarr.video/): An automated movie download and management system.
- 📰 [`sabnzbd`](https://sabnzbd.org/) The automated Usenet download tool.
- 📺 [`sonarr`](https://sonarr.tv/): An automated TV show download and management system.
- 🔍 [`jackett`](https://github.com/Jackett/Jackett): An API support system that allows you to connect with various torrent providers.
- ⏬ [`qbittorrent`](https://www.qbittorrent.org/): A lightweight and feature-rich torrent client.
- 💬 [`thelounge`](https://thelounge.chat/): A modern, self-hosted web IRC client.
- 🤖 [`autobrr`](https://autobrr.com/): Automatically searches for and downloads new content based on user-defined rules.

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