#!/bin/sh

yabai -m space --focus $(yabai -m query --windows | jq ".[] | select(.app == \"$1\").space")
