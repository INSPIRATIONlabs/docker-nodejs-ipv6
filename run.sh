#!/bin/bash

if [ ! -z "$IPV6ADDR" ]; then
	ip -6 addr add $IPV6ADDR dev eth0
fi

if [ ! -z "$IPV6GW" ]; then
	ip -6 route add  default via $IPV6GW dev eth0
fi

if [ ! -z "$GITREPO" ]; then
	rm -R /var/node
	mkdir /var/node
	git clone $GITREPO /var/node
	cd /var/node
	npm install
	bower --allow-root install
	node app.js
fi
