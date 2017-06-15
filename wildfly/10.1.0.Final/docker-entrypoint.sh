#!/usr/bin/env bash
#
# A helper script for ENTRYPOINT.
#
# If first CMD argument is 'wildfly', then the script will bootstrap Wildfly
# with xml configuration file as second CMD argument.
# If CMD argument is overridden and not 'wildfly', then the user wants to run
# his own process.

#------------------------------------------------------------------------------
# configuration variables
#------------------------------------------------------------------------------
set -o errexit    # abort script at first error
set -o pipefail   # return the exit status of the last command in the pipe


#------------------------------------------------------------------------------
# function definitions
#------------------------------------------------------------------------------
function error() { printf "%b\n" "[ERROR] ${@}" 1>&2; exit 1; }
function info()  { printf "%b\n" "[INFO] ${@}"; }

# usage: file_env VAR [DEFAULT]
#
# will allow for ie. "$DB_PASSWORD_FILE" to fill in the value of
# "$DB_PASSWORD from a file, especially for Docker's secrets feature.
file_env() {
  local var="$1"
  local fileVar="${var}_FILE"
  local defaultVar="${2:-}"
  if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
    error "both $var and $fileVar are set (but are exclusive)"
  fi
  local val="$defaultVar"
  if [ "${!var:-}" ]; then
    val="${!var}"
  elif [ "${!fileVar:-}" ]; then
    val="$(< "${!fileVar}")"
  fi
  export "$var"="$val"
  unset "$fileVar"
}


#------------------------------------------------------------------------------
# SCRIPT ENTRYPOINT
#------------------------------------------------------------------------------
if [ "$1" = "wildfly" ]; then

  file_env "WILDFLY_ADMIN_USERNAME"
  file_env "WILDFLY_ADMIN_PASSWORD"
  if [[ ! -z "$WILDFLY_ADMIN_USERNAME" && ! -z "$WILDFLY_ADMIN_PASSWORD" ]]; then
    info "==> Creating admin user '$WILDFLY_ADMIN_USERNAME' with password '$WILDFLY_ADMIN_PASSWORD'"
    /opt/wildfly/bin/add-user.sh ${WILDFLY_ADMIN_USERNAME} ${WILDFLY_ADMIN_PASSWORD} --silent
  fi

  if [ -z "$2" ]; then
    info "==> No standalone server configuration defined, JavaEE 7 web profile (standalone.xml) will be used."
    exec gosu wildfly /opt/wildfly/bin/standalone.sh --server-config=standalone.xml -b=0.0.0.0 -bmanagement=0.0.0.0
  else
    info "==> Use injected standalone server configuration '$2'"
    exec gosu wildfly /opt/wildfly/bin/standalone.sh --server-config="$2" -b=0.0.0.0 -bmanagement=0.0.0.0
  fi
fi

exec "$@"
