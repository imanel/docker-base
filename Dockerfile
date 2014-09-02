FROM ubuntu:14.04
MAINTAINER Bernard Potocki <bernard.potocki@imanel.org>

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Script to clean after each installation
ADD docker-cleanup /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-cleanup

# Install couple base packages
RUN apt-get update -qq && \
    apt-get install -y software-properties-common wget && \
    docker-cleanup
