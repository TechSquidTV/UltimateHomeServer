
<p align="center">
  <img src=".github/img/header.png" alt="Banner" width="100%">
</p>

<p align="center">
  A personal collection of helm charts for the ultimate home server.
</p>

## Services

- 🌐 `nginx`: A high-performance web server and reverse proxy.
- 🏠 `homepage`: A customizable start page for your home server.
- 📺 `plex`: A media server that allows you to stream your personal media collection.
- 🎬 `radarr`: An automated movie download and management system.
- 📺 `sonarr`: An automated TV show download and management system.
- 🔍 `jackett`: An API support system that allows you to connect with various torrent providers.
- ⏬ `qbittorrent`: A lightweight and feature-rich torrent client.
- 💬 `thelounge`: A modern, self-hosted web IRC client.
- 🤖 `autobrr`: Automatically searches for and downloads new content based on user-defined rules.

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