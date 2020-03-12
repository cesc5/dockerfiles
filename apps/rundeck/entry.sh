#!/bin/bash
set -eou pipefail

export HOSTNAME=$(hostname)
export RUNDECK_HOME=/home/rundeck

# Store settings that may be unset in script variables
SETTING_RUNDECK_FORWARDED="${RUNDECK_SERVER_FORWARDED:-false}"

# Unset all RUNDECK_* environment variables
if [[ "${RUNDECK_ENVARS_UNSETALL:-true}" = "true" ]] ; then
    unset `env | awk -F '=' '{print $1}' | grep -e '^RUNDECK_'`
fi

# Unset specific environment variables
if [[ ! -z "${RUNDECK_ENVARS_UNSETS:-}" ]] ; then
    unset $RUNDECK_ENVARS_UNSETS
    unset RUNDECK_ENVARS_UNSETS
fi

JVM_MAX_RAM_FRACTION=1
exec java \
    -XX:+UnlockExperimentalVMOptions \
    -XX:MaxRAMFraction="${JVM_MAX_RAM_FRACTION}" \
    -XX:+UseCGroupMemoryLimitForHeap \
    -Dloginmodule.conf.name=jaas-loginmodule.conf \
    -Dloginmodule.name=rundeck \
    -Drundeck.jaaslogin=true \
    -Drundeck.jetty.connector.forwarded="${SETTING_RUNDECK_FORWARDED}" \
    "${@}" \
    -jar rundeck.war
