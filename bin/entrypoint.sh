#!/bin/bash

setup.sh

set -ex

mkdir -p /config/
cp -n /config_samples/* /etc/opt/ripple/

if [ $TESTNET=1 ] then 
echo "TESTNET mode"
cp -n /config_samples_testnet/* /etc/opt/ripple/
else
echo "MAINNET mode"
cp -n /config_samples/* /etc/opt/ripple/
fi

# Start rippled, Passthrough other arguments
exec /opt/ripple/bin/rippled --net --conf /etc/opt/ripple/rippled.cfg "$@"