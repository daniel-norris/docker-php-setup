#!/usr/bin/env bash

if [ ! -d /.composer ]; then
    mkdir /.composer
fi

chmod -R ugo+rw /.composer

if [ $# -gt 0 ];then
    exec "$@"
else
    /usr/bin/supervisord
fi