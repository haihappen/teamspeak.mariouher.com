#!/bin/bash
set -e

if [ -e ./ts3server.sqlitedb ]; then
  # Server is set up already, normal start.
  exec ./ts3server_linux_amd64 "$@"
else
  touch /home/data/ts3server.sqlitedb
  ln -s /home/data/ts3server.sqlitedb .
  exec ./ts3server_linux_amd64 "$@"
fi
