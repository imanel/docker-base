#!/bin/bash
if [ -f /docker/scripts/prepare.sh ]; then
  /docker/scripts/prepare.sh
fi

exec supervisord -n
