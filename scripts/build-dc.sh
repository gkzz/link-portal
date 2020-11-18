#!/bin/bash

H_FLAG=FALSE
N_FLAG=FALSE
F_FLAG=FALSE
FILENAME=

function help {
  cat <<- EOF
    overview：wheter run "docker-compose up -d --build"
    usage：bash commands/build-dc.sh [-h|-n|-f]
    option：
      -h  this message
      -n ->> run "docker-compose up -d --build"
      -f ->> run "docker-compose -f FILENAME up -d --build"
EOF
    exit 1

}

while getopts ":hnf:" OPT;
do
  case ${OPT} in
    h)
      H_FLAG=TRUE;
        ;;
    n)
      N_FLAG=TRUE
        ;;
    f)
      F_FLAG=TRUE
      FILENAME=$OPTARG;
        ;;
    \?)
      exit 1
        ;;
  esac
done

shift $((OPTIND - 1))

if [ "$H_FLAG" = "TRUE" ]; then
  help
elif [ "$N_FLAG" = "TRUE" ]; then
  docker-compose up -d --build
elif [ "$F_FLAG" = "TRUE" ]; then
  docker-compose -f ${FILENAME} up -d --build
else
  echo "option is unexpected."
  help
fi

