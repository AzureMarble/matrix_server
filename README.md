# Description
 A simple docker compose configuration for matrix homelabbing. Since my knowledge on docker and cybersecurity is limited, feel free to provide any feedback or recommendations.

# Setup
## Preperation
### Docker Compose
Since the script is based on docker compose, install it first. You can find instructions [here](https://docs.docker.com/compose/install)

### DDNS
When running a homelab you need either a fixed IP or some sort of DDNS for your server to be always reachable. Since fixed IPv4s are somewhat insecure and aren't available for private networks, I'm only addressing DDNS in this setup.
In some cases your router already has a DDNS service. If not, you can find multiple list of free and public DDNS providers on the internet. Some examples are [duckdns](https://www.duckdns.org/) or [No-Ip](https://www.noip.com/)

### Port Forwarding
Setup Port Forwarding in your router interface for ports 80, 443 and 8448, that point to your local server address. Since this process varies between device to device, be sure to look it up.

### Caddy
Change the domain and email found in **caddy/Caddyfile** to the domain you got from your DDNS provider and the email you want to use to create TLS certificates.

### Synapse (Matrix Server)
1. Change **server_name** to your DDNS domain.
2. Change database **user**, **password** and **database** parameters to your earlier defined values.
3. (Optional) Setup trusted_key_servers
4. (Optional) Change, add or delete settings based on your preferences.You can find the documentation [here](https://element-hq.github.io/synapse/latest/usage/configuration/config_documentation.html)

### Postgresql
Using postgresql is optional, but recommended. If you don't want to use a dedicated Postgresql database, be sure to remove the postgresql sections from the **compose.yaml** and **synapse/homeserver.yaml** files.
1. If you decide to use postgresql, be sure to define a database name, user and password in **db/init/init.sql** and **synapse/homeserver.yaml**
2. (Optional) Tune your postgres config to better match your hardware. There are various websites that make this progress easier. Some examples are [PGTune](https://pgtune.leopard.in.ua/) or [Cybertec Postgresql Configurator](https://pgconfigurator.cybertec.at/)

## Running the container
After having prepared everything stated above, all you need to do is run
1. Linux 
```bash
sudo docker compose up
```
If you need to restart or stop the server you can do that by running
```bash
sudo docker compose stop
```
