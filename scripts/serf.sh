#!/bin/bash
exec serf agent -config-dir=/docker/config/serf -encrypt="$SERF_CLUSTER_KEY" #-join $SERF_CLUSTER_IP
