FROM ubuntu:12.04
MAINTAINER Bernard Potocki <bernard.potocki@imanel.org>

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
