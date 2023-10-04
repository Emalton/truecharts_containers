#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /app/jackett \
        --NoUpdates \
        "$@" \
        --Port \
         ${JACKETT_PORT}
