# This Dockerfile is expected to built from the context of the whole repo, e.g.:
#    docker build -t sel4/sel4-website -f docker/Dockerfile .
FROM debian:buster

COPY docker/libapache2-mod-python_3.5.0-1_amd64.deb /tmp/libapache2-mod-python_3.5.0-1_amd64.deb

# This inserts the current directory as the website. This may be overridden by
# later docker run commands.
COPY . /var/www/seL4

# Get and install dependencies required
RUN apt-get update -q \
    && apt-get install -y --no-install-recommends \
        apache2 \
        libxml2-dev \
        python3-dev \
        python3-lxml \
        python3-pip \
    && dpkg -i /tmp/libapache2-mod-python_3.5.0-1_amd64.deb \
    && apt-get clean autoclean \
    && apt-get autoremove --purge --yes \
    && rm -rf /var/lib/apt/lists/* \
    # Python deps
    && pip3 install setuptools \
    && pip3 install SQLObject
       
# Configure apache 
RUN cd /etc/apache2 \
    # Enable required apache mods
    && ln -s ../mods-available/expires.load mods-enabled/expires.load \
    #
    # Install seL4 site conf
    && rm sites-enabled/*.conf \
    && cp /var/www/seL4/apache/seL4.systems.conf sites-available \
    #
    # We need to modify the seL4 site conf to work nicely within the container
    # 1. Delete the http component of the conf, which just redirects to 443
    && sed -i '/^<VirtualHost _default_:80>/,/^<\/VirtualHost>/d' sites-available/seL4.systems.conf \
    # 2. Change port 443 to 80
    && sed -i 's/<VirtualHost _default_:443>/<VirtualHost _default_:80>/g' sites-available/seL4.systems.conf \
    # 3. Remove SSL invokes
    && sed -i '/SSLEngine on/,/<\/Directory>/d' sites-available/seL4.systems.conf \
    #
    # Now we 'enable' the site in apache
    && ln -s ../sites-available/seL4.systems.conf sites-enabled/seL4.systems.conf \
    #
    # And pick if we're live or staged - since we're in a container, live is what we want.
    && cd /var/www/seL4/configs \
    && ln -s config.cfg.live config.cfg

# If no other CMD is given, run Apache
CMD ["apachectl", "-D", "FOREGROUND"]
