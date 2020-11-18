#!/bin/bash

set -e

function help {
  cat <<- EOF
    overview：wrapper of "python manage.py"
    usage：bash /opt/app/scripts/manage.sh [-h|-r|-m|
    option：
      -h  this message
      -r ->> run "python manage.py runserver 0.0.0.0:8000"
      -m ->> run "python manage.py migrate"
EOF
    exit 1

}

while getopts ":hrm" OPT;
do
  case ${OPT} in
    r)
      python manage.py runserver 0.0.0.0:8000
        ;;
    m)
      python manage.py migrate
        ;;
    \?)
      help
        ;;
  esac
done

