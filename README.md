# binance-node-docker

[![Build status](https://img.shields.io/docker/cloud/build/varnav/xrp-node-docker.svg)](https://hub.docker.com/r/varnav/xrp-node-docker) [![Docker Pulls](https://img.shields.io/docker/pulls/varnav/xrp-node-docker.svg)](https://hub.docker.com/r/varnav/xrp-node-docker) [![](https://images.microbadger.com/badges/image/varnav/xrp-node-docker.svg)](https://microbadger.com/images/varnav/xrp-node-docker "Image details") ![Code size](https://img.shields.io/github/languages/code-size/varnav/xrp-node-docker.svg) [![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT/)

Docker image for Ripple (XRP) Full Node  

## Testnet

### Run as daemon

```
ufw allow 51235/tcp
ufw allow 6005/tcp
docker run -d --name ripple-testnet -p 5005:5005 -p 6006:6006 -p 51235:51235 -p 6005:6005 -v /opt/ripple/:/config/ -v ripple-db:/var/lib/rippled/db/ --restart unless-stopped --security-opt no-new-privileges -e "TESTNET=1" -e "ENABLE_WALLET=1" varnav/xrp-node-docker
```

### Check logs

`docker logs -f ripple-testnet`

## Prod

### Run

```
ufw allow 51235/tcp
ufw allow 6005/tcp
docker run -d --name ripple-testnet -p 5005:5005 -p 6006:6006 -p 51235:51235 -p 6005:6005 -v /opt/ripple/:/config/ -v ripple-db:/var/lib/rippled/db/ --restart unless-stopped --security-opt no-new-privileges -e "ENABLE_WALLET=1" varnav/xrp-node-docker
```

## Building devel branch locally

```
git clone https://github.com/varnav/xrp-node-docker.git
cd xrp-node-docker && docker build . -t varnav/xrp-node-docker
```