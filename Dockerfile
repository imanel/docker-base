FROM ubuntu:12.04
MAINTAINER Bernard Potocki <bernard.potocki@imanel.org>

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update apt cache and install base packages
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      python-software-properties \
      software-properties-common
