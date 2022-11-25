#!/bin/bash

## Install dependencies
apt install lftp -y

## LFTP Execution
lftp "${PARAM_HOST}" -u "${PARAM_USER}","${PARAM_PASSWORD}" -e "set ftp:ssl-force ${PARAM_FORCESSL}; set ssl:verify-certificate false; mirror ${PARAM_OPTIONS} --reverse --continue --dereference -x ^\.git/$ ${PARAM_LOCALDIR} ${PARAM_REMOTEDIR}; quit"
