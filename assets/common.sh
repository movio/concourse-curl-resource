#!/bin/sh

set -e

check_version() {

  # retrieves HTTP header of file URL response
  httpHeader=$(curl -R -I "$1" 2>&1 | grep '[Ll]ast-[Mm]odified:' | sed 's/[ \t\n\r]*$//')

  if [ ! -z "$httpHeader" ]
  then
        dateString=$(echo "$httpHeader" | sed -e "s/[Ll]ast-[Mm]odified: //")
  fi

  echo "{\"version\":\"$dateString\"}" | jq --slurp .
}
