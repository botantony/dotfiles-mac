#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
CRON_FILE="cfg_auto"

if [ ! -f "${HOME}/.config/crontab/${CRON_FILE}" ]; then
    mkdir -p ${HOME}/.config/crontab
    echo "0 22 * * * ${SCRIPT_DIR}/auto.sh" > ${HOME}/.config/crontab/${CRON_FILE}
    echo "Created \"${CRON_FILE}\" in \"${HOME}/.config/crontab\""
    crontab ${HOME}/.config/crontab/${CRON_FILE}
fi

sh ${SCRIPT_DIR}/brew.sh --gen

cd ${SCRIPT_DIR} || exit 1

if [[ -n $(git status --porcelain) ]]; then
    echo "Config changes detected, preparing to commit."

    git checkout auto-update
    git submodule update --recursive --remote
    git add .
    git commit -m "Automatic commit: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin auto-update
    git checkout main
    echo "Pushed changes"
fi
