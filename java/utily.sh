#!/usr/bin/env bash
#
# "utily" is a script for creating and checking new versions of java Dockerfile
#

#------------------------------------------------------------------------------
# configuration variables
#------------------------------------------------------------------------------
set -o errexit    # abort script at first error
set -o pipefail   # return the exit status of the last command in the pipe
set -o nounset    # treat unset variables and parameters as an error


#------------------------------------------------------------------------------
# function definitions
#------------------------------------------------------------------------------
function log()   { printf "%b\n" "${@}"; }
function error() { printf "%b\n" "[ERROR] ${@}" 1>&2; exit 1; }
function info()  { printf "%b\n" "[INFO] ${@}"; }

function show_help() {
  log "Usage: utily.sh COMMAND"
  log ""
  log "Commands:"
  log "    create    Create a Dockerfile for the specified java version"
  log "    check     Check existing java Dockerfile against template"
  log ""
  exit 1
}

function subcommand_create() {
  java_version=$1
  info "Creating new Dockerfile for java version ${java_version}"

  mkdir -p server-jre/${java_version}

  cp templates/.dockerignore.template server-jre/${java_version}/.dockerignore
  sed -e "s/@@java_version_to_insert@@/${java_version}/g" templates/Dockerfile.template > server-jre/${java_version}/Dockerfile
  sed -e "s/@@java_version_to_insert@@/${java_version}/g" templates/README.md.template > server-jre/${java_version}/README.md
  cp templates/README-short.txt.template server-jre/${java_version}/README-short.txt
}

function subcommand_check() {
  log "TODO: implement check command with diff"
}


#------------------------------------------------------------------------------
# SCRIPT ENTRYPOINT
#------------------------------------------------------------------------------
# exit if there are no arguments
if [[ $# -eq 0 ]]; then
  show_help
fi

# parse subcommands
subcommand=$1; shift
case "$subcommand" in
  create)
    # exit if there is no version to install
    if [[ $# -eq 0 ]]; then
      error "Specify java version for Dockerfile"
    fi

    java_version=$1; shift
    subcommand_create ${java_version}
    ;;

  check)
    subcommand_check
    ;;

  *)
    error "'${subcommand}' subcommand is not supported."
    ;;
esac

exit 0
