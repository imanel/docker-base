FROM ubuntu:12.04
MAINTAINER Bernard Potocki <bernard.potocki@imanel.org>

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update apt cache, upgrade distro and install base packages
RUN apt-get update
# RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install \
      dropbear \
      supervisor

# Install serf - http://www.serfdom.io/
ADD files/serf-0.5.0_linux_amd64 /usr/bin/serf

# Copy files
ADD config /docker/config
ADD scripts /docker/scripts
RUN chmod 755 /docker/scripts/*.sh

RUN rm -rf /etc/supervisor && \
    mv /docker/config/supervisor /etc/ && \
    mkdir -p /docker/log/supervisor

# Set SSH password - should be changed if port will be exposed
RUN echo 'root:secret' | chpasswd

VOLUME ["/docker/log"]

CMD ["/docker/scripts/run.sh"]
