#!/bin/sh

protocol="servers"
settings="-l :${port} ${pwd}"
#settings="${settings} ${i}"

if [[ ${protocol} == "servers" ]]; then
	brook servers ${settings}
elif [[ ${protocol} == "streamservers" ]]; then
	brook streamservers ${settings}
fi
