FROM phusion/baseimage:0.9.9
MAINTAINER Bernard Potocki <bernard.potocki@imanel.org>

# Ensure UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    rm /etc/my_init.d/00_regen_ssh_host_keys.sh

# TODO: Remove it
RUN /usr/sbin/enable_insecure_key

# Install serf - http://www.serfdom.io/
ADD files/serf-0.5.0_linux_amd64 /usr/bin/serf
ADD /services/serf /etc/service/serf
ADD /etc/serf /etc/serf

CMD ["/sbin/my_init"]
