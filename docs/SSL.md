# Configure SSL

Rather than configuring ingress in our cluster, we opt to use a simpler approach suitable for our home-server using [certbot](https://certbot.eff.org/) to create a wildcard cert and [nginx](https://www.nginx.com/) as our reverse proxy. We can then mount the certificates as a volume in our cluster.

### Install certbot

In this tutorial we will opt for a more manual approach to installing certbot, to avoid running the snap daemon.

Follow the official guide on [certbot.eff.org](https://certbot.eff.org/instructions?ws=other&os=pip) to install certbot with pip.

Once certbot is installed and available at `/usr/local/bin/certbot`, we can create a certificate for our domain.

Certbot supports automatic DNS validation with many DNS providers. Install the plugin for your provider. See the list of available [DNS plugins here.](https://eff-certbot.readthedocs.io/en/stable/using.html#dns-plugins)

In this example, we will use Cloudflare as our DNS provider. To install the Cloudflare plugin, run:

```bash
sudo /opt/certbot/bin/pip install certbot-dns-cloudflare
```

### Configure DNS credentials

The documentation above listing the DNS plugins will also provide instructions on how to configure credentials for your DNS provider.

If you are using Cloudflare, continue with the following steps.

1. Create a [Cloudflare API token](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/) with the following permissions:
   - `Zone:Zone:Read`
   - `Zone:DNS:Edit`
2. Create a directory to store your credentials. A common practice is to create a directory in your home directory called `.secrets`.
    ```bash
    mkdir -p ~/.secrets/certbot
    ```
3. Create a file in this directory called `cloudflare.ini` with the following contents:
    ```ini
    # Cloudflare API token used by Certbot
    dns_cloudflare_api_token = <your token>
    ```
4. Set the permissions on this file to `600`:
    ```bash
    chmod 600 ~/.secrets/certbot/cloudflare.ini
    ```
5. Run the following command to create a wildcard certificate for your domain:
    ```bash
    sudo /opt/certbot/bin/certbot certonly \
        --dns-cloudflare \
        --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini \
        --dns-cloudflare-propagation-seconds 60 \
        -d <your domain>
        -d *.<your domain>
    ```
    Certbot will create a certificate and store it in `/etc/letsencrypt/live/<your domain>`. We will use this certificate in our cluster.
6. Setup automatic renewal by running the `certbot renew` command in a cron job. Run the following command:
    ```bash
    echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && sudo certbot renew -q" | sudo tee -a /etc/crontab > /dev/null
    ```
    Certbot will check the expiration date of your certificate twice a day and renew it if it is within 30 days of expiration.
7. Test the renewal process by running:
    ```bash
    sudo /opt/certbot/bin/certbot renew --dry-run
    ```
    If the command runs without errors, the renewal process is working correctly.
8. Lastly, create a Diffie-Hellman parameters certificate for additional security:
    ```bash
    sudo openssl dhparam -out /etc/letsencrypt/certs/dhparam.pem 2048
    ```
    For convenience we will store this certificate in the same directory as our letsencrypt certificates.

# See Also

- [Docs](./README.md)
- [Customize](./Customize.md)
