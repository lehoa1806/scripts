#!/usr/bin/env bash


# print info log to syslog
# Usage: log <messages>
# - messages: strings will be logged to systemlog
function log() {
  logger -p user.info "INFO: ${*}"
}


# print error log to syslog
# Usage: error <messages>
# - messages: strings will be logged to systemlog
function error() {
  logger -p user.info "ERROR: ${*}"
}


# validate input arguments
# Usage: set eligible_options then invoke this function
# - eligible_options: a list of eligible arguments
function check_eligible_options() {
  local _found=0
  for _elopt in "${eligible_options[@]}"; do
    case ${1} in
      ${_elopt})
        _found=1
        break
        ;;
    esac
  done
  if [[ ${_found} -eq 0 ]]; then
    echo "Option ${1} is not supported. Try help for more information."
    error "Option ${1} is not supported. Try help for more information."
    exit 1
  fi
}


# rm
# Usage: remove_dir <location>
# - location: full path to the destination directory
function remove_dir() {
  local location="${1}"

  log "Remove the existing directory: ${location}"
  rm -rf "${location}"
}


# mkdir
# Usage: make_dir <location>
# - location: full path to the destination directory
function make_dir() {
  local location="${1}"

  log "Create a directory named: ${location}"
  mkdir -p "${location}"
}


# remove the existing directory and create a new one
# Usage: make_clean_dir <location>
# - location: full path to the destination directory
function make_clean_dir() {
  local location="${1}"

  remove_dir "${location}"
  make_dir "${location}"
}
