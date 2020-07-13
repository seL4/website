#!/bin/bash

pwd

echo "::group::Setting up apache with PR conf"
# Clear out any other apache confs, and install the PR's version
rm /etc/apache2/sites-enabled/*.conf 
cp apache/seL4.systems.conf /etc/apache2/sites-available/

CONF="/etc/apache2/sites-available/seL4.systems.conf"
# We need to modify the seL4 site conf to work nicely within the container
# 1. Delete the http component of the conf, which just redirects to 443
sed -i '/^<VirtualHost _default_:80>/,/^<\/VirtualHost>/d' "$CONF"

# 2. Change port 443 to 80
sed -i 's/<VirtualHost _default_:443>/<VirtualHost _default_:80>/g' "$CONF"

# 3. Remove SSL invokes
sed -i '/SSLEngine on/,/<\/Directory>/d' "$CONF"

# Now we 'enable' the site in apache
ln -s "$CONF" /etc/apache2/sites-enabled/seL4.systems.conf

cat /etc/apache2/sites-enabled/seL4.systems.conf

# And pick if we're live or staged - since we're in a container, live is what we want.
ln -s config.cfg.live configs/config.cfg

rm -rf /var/www/seL4
ln -s $PWD /var/www/seL4

ls -lah 
ls -lah configs

echo "::endgroup::"

echo "::group::Starting apache"
apachectl start
sleep 5
echo "::endgroup::"

echo "::group::wgetting apache"
wget \
	--recursive \
	--page-requisites \
	--adjust-extension \
	--span-hosts \
	--convert-links \
	--domains localhost \
	--exclude-domains wiki.sel4.systems,docs.sel4.systems \
	--exclude-directories pipermail \
	--no-parent \
    localhost

echo "::endgroup::"

echo "::group::Apache logs"
cat /var/log/apache2/*
echo "::endgroup::"

