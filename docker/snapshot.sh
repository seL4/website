#!/bin/bash

set -e

OUTPUT_SNAPSHOT_DIR="snapped_site"

echo "::group::Set up apache with PR conf"
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

# And pick if we're live or staged - since we're in a container, live is what we want.
ln -s config.cfg.live configs/config.cfg
# Update live config to say we're not running on seL4
sed -i '/^seL4 = yes/c\seL4 = no' configs/config.cfg
cat configs/config.cfg

# Create a symlink to point the apache content dir to this PR's dir
rm -rf /var/www/seL4
ln -s $PWD /var/www/seL4
echo "::endgroup::"

echo "::group::Start apache"
apachectl start
sleep 5  # just so apache has some spin-up time
echo "::endgroup::"

echo "::group::Test apache is running"
wget -qO- localhost
echo "::endgroup::"

echo "::group::Snapshot website PR"
# wget is giving bad return codes, even when things seem OK. Turn off
# error checking for this section.
set +e
# Use wget to take a static snapshot of the Apache served website
# Note that we skip sites not hosted by this website, and we skip
# pipermail (since it's not related to the site content), and 
# About/Perfomance, as it's dynamically generated on the live server
wget \
    --recursive \
    --page-requisites \
    --adjust-extension \
    --span-hosts \
    --convert-links \
    --domains localhost \
    --exclude-domains wiki.sel4.systems,docs.sel4.systems \
    --exclude-directories pipermail,About/Performance \
    --no-parent \
    --directory "$OUTPUT_SNAPSHOT_DIR" \
    localhost

set -e
echo "::endgroup::"

echo "::group::Show files"
ls -lan 
ls -lan "$OUTPUT_SNAPSHOT_DIR"
echo "bump"
echo "::endgroup::"

echo "::group::Fix output permissions"
chown -R 1001:116 "$OUTPUT_SNAPSHOT_DIR"
echo "::endgroup::"
