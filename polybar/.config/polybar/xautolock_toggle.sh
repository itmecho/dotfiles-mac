#!/bin/sh

state=${XDG_RUNTIME_DIR}/xautolock_state

if test -f ${state} && test $(cat ${state}) -eq 1; then
	xautolock -disable
	echo 0 > ${state}
else
	xautolock -enable
	echo 1 > ${state}
fi
