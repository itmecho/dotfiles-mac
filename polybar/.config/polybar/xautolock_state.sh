#!/bin/sh

state=$XDG_RUNTIME_DIR/xautolock_state
if [ ! -f ${state} ]; then
	xautolock -enable
	echo 1 > ${state}
fi

if [ $(cat ${state}) -eq 1 ]; then
	echo "%{F#50fa7b} %{F-}"
	echo " "
else
	echo "%{F#f1fa8c} %{F-}"
fi
