# This Dockerfile is expected to built from the context of the whole repo, e.g.:
#    docker build -t sel4/sel4-website -f docker/Dockerfile .
FROM debian:buster

COPY docker/libapache2-mod-python_3.5.0-1_amd64.deb /tmp/libapache2-mod-python_3.5.0-1_amd64.deb

# Get and install dependencies required
RUN apt-get update -q \
    && apt-get install -y --no-install-recommends \
        apache2 \
        libxml2-dev \
        linkchecker \
        python3-dev \
        python3-lxml \
        python3-pip \
        wget \
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
    && ln -s ../mods-available/expires.load mods-enabled/expires.load 

COPY docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
