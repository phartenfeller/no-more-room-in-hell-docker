#!/bin/bash
set -e
trap '' TERM INT HUP

./nmrih/srcds_run -game nmrih -maxplayers 12 +map nmo_broadway +exec server.cfg +hostname "$SRV_HOSTNAME" +sv_password "$SRV_PASSWORD" +rcon_password "$RCON_PASSWORD"
