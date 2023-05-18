# Customize services

Before deploying your home services, you will need to customize the configuration to your liking and create some local directories to store the configuration for each service.

## Enable and customize

In the `values.yaml` file you will find the _default_ configuration for each service with example values. This file should typically _not_ be modified. Instead, you will customize the `secrets.yaml` file with the values you want to override.

### Create `secrets.yaml`

It is recommended you reference the existing `secrets.yaml` file, but you may want to rename it to something like `secrets.example.yaml` and create your own new `secrets.yaml` file.

```bash
cp secrets.yaml secrets.example.yaml
```
```bash
touch secrets.yaml
```
```
echo "secrets.example.yaml" >> .gitignore
```

Ensure your secrets.yaml file retains the `common` section, which contains the timezone and SSL certificate configuration:

```yaml
common:
  tz: America/New_York
  certs:
    ssl_certificate: ${HELM_SSL_CERT}
    ssl_certificate_key: ${HELM_SSL_KEY}
    ssl_dhparam: ${HELM_SSL_DHPARAM}
```

You may include your secret values directly in the `secerts.yaml` file only if you remove and exclude the file from git tracking. Otherwise, you can store your secret values in a `.env` file and reference them in the `secrets.yaml` file.

### Create `.env`

Copy the `.env.example` file to `.env`

```bash
cp .env.example .env
```

Not all values must be filled, and some are only there as a convenience. You may fill in only what you reference in `secrets.yaml`.

Add the secrets referenced in the `common` section of `secrets.yaml` to your `.env` file:

```bash
TZ=America/New_York

HELM_SSL_CERT=/etc/letsencrypt/live/<your-domain>/fullchain.pem
HELM_SSL_KEY=/etc/letsencrypt/live/<your-domain>/privkey.pem
HELM_SSL_DHPARAM=/etc/letsencrypt/certs/dhparam.pem

```

### Enabling a service

Here is an example workflow for enabling a service. We will use the `plex` service as an example.

In `values.yaml`, you will see under _`services.plex`_ all of the default configuration for the service, such as the image, ports, and environment variables.

Notice each service has an `enabled` key set to false by default. To enable a service we will set this to true in `secrets.yaml`.

Here is an example of what `secrets.yaml` might look like after enabling the `plex` service:

```yaml
common:
  tz: America/New_York
  certs:
    ssl_certificate: ${HELM_SSL_CERT}
    ssl_certificate_key: ${HELM_SSL_KEY}
    ssl_dhparam: ${HELM_SSL_DHPARAM}

services:
  plex:
    enabled: true
    library:
      tv: ${PLEX_LIB_TV}
      movies: ${PLEX_LIB_MOVIES}
    config: ${PLEX_CONFIG}
```
Here would be the corresponding `.env` file:

```bash
TZ=America/New_York

HELM_SSL_CERT=/etc/letsencrypt/live/<your-domain>/fullchain.pem
HELM_SSL_KEY=/etc/letsencrypt/live/<your-domain>/privkey.pem
HELM_SSL_DHPARAM=/etc/letsencrypt/certs/dhparam.pem


PLEX_LIB_TV=/z-pool/plex/library/tv
PLEX_LIB_MOVIES=/z-pool/plex/library/movies
PLEX_CONFIG=/z-pool/plex/config
```

#### Ensure all directories exist

When you enable a service, you will need to ensure all of the directories referenced in the `secrets.yaml` file exist. If they do not, you will need to create them.

```bash
mkdir -p /z-pool/plex/library/tv
mkdir -p /z-pool/plex/library/movies
mkdir -p /z-pool/plex/config
```

Make sure the created directories are writable.

```bash
chmod -R 660 /z-pool/plex
```

### Validate Helm template

After customizing your configuration, it is a good idea to validate the Helm template for mistakes

## Homepage Dashboard

Enable the [`homepage`](https://gethomepage.dev/en/installation/) service to get a dashboard of all your services and bookmarks at `https://homepage.<your-domain>/`.

Homepage can be customized by editing the _services_, _bookmarks_, _widgets_, and _settings_ configurations. These would typically be separate YAML files, but for simplicity, they are all included in the `secrets.yaml` file under the `homepage` section.

```yaml
services:
  homepage:
    enabled: true
    services:
      - My First Group:
          - My First Service:
              href: http://localhost/
              description: Homepage is awesome
    bookmarks:
        - Developer:
          - Github:
              - abbr: GH
                href: https://github.com/
    widgets:
      - kubernetes:
          cluster:
            show: true
            cpu: true
            memory: true
            showLabel: true
            label: "cluster"
          nodes:
            show: true
            cpu: true
            memory: true
            showLabel: true
      - resources:
          backend: resources
          expanded: true
          cpu: true
          memory: true
      - search:
          provider: google
          target: _blank
```

View the official [Homepage documentation](https://gethomepage.dev/en/configs/services/) for more information on how to customize the dashboard.

## *Arr Services

Many of the services available in this chart are part of the [*Arr](https://wiki.servarr.com/) stack, a collection of services built from the same codebase and designed to work together to "grab", sort, and monitor media files.

You can read all about the *Arr services on the [Servarr Wiki](https://wiki.servarr.com/).

# See Also

- [Docs](./README.md)
- [Deploy](./Deploy.md)