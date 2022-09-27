#!/bin/bash

CONF_FILE=/etc/gitlab-runner/config.toml

echo -e "Starting registration script...\n"
if [ ! -s "${CONF_FILE}" ]; then
    gitlab-runner register --non-interactive --tls-ca-file /etc/gitlab-runner/WinCAG.crt \
    --executor "shell" \
    --url "https://gitlab.services.mts.ru/" \
    --registration-token="GR1348941hP-HGiyzuS__aaqdm_9r" \
    --executor docker \
    --docker-image "docker:20.10.16" \
    --docker-privileged \
    --description "My Docker Runner" \
    --tag-list="" \
    --run-untagged="true" \
    --locked="false" \
    --access-level="not_protected"
else
    echo -e "Ignoring registration : config.toml file not empty (already registered)."
fi
echo -e "End registration script. \n"
