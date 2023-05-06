#!/bin/sh

mkdir BACKUP
cp /lib/systemd/system/osmo* BACKUP

mkdir -p /var/lib/osmocom/

cp services/osmo-nitb.service /lib/systemd/system
cp services/osmo-bts-trx.service /lib/systemd/system
cp services/osmo-trx-uhd.service /lib/systemd/system
cp services/osmo-pcu.service /lib/systemd/system
cp services/osmo-sgsn.service /lib/systemd/system
cp services/osmo-ggsn.service /lib/systemd/system
cp services/osmo-sip-connector.service /lib/systemd/system

systemctl daemon-reload

systemctl stop osmocom-nitb
systemctl stop osmo-nitb
systemctl stop osmo-trx-lms
systemctl stop osmo-bts-trx
systemctl stop osmo-ggsn
systemctl stop osmo-sgsn
systemctl stop osmo-pcu
systemctl stop osmo-sip-connector
systemctl stop asterisk

systemctl disable osmocom-nitb
systemctl disable osmo-nitb
systemctl disable osmo-trx-lms
systemctl disable osmo-bts-trx
systemctl disable osmo-ggsn
systemctl disable osmo-sgsn
systemctl disable osmo-pcu
systemctl disable osmo-sip-connector
systemctl disable asterisk

systemctl daemon-reload

cp /usr/local/bin/osmo-* /usr/bin

