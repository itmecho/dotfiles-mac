#!/bin/sh

i3lock --blur=5 --force-clock --color=000000 --pass-media-keys \
    --greetercolor=928374ff \
    --timepos="ix-0:iy-400" --time-font=LatoLight --timesize=140 --timecolor=a89984ff \
    --datepos="tx-0:ty+90" --date-font=LatoLight --datesize=42 --datecolor=928374ff \
    --insidecolor=00000000 --insidevercolor=00000000 --insidewrongcolor=00000000 --line-uses-inside \
    --ringcolor=282828ff --ringvercolor=458588ff --ringwrongcolor=cc241dff \
    --keyhlcolor=b8bb26ff --bshlcolor=689d6aff \
    --ring-width=4.0 --radius=75 \
    --verifcolor=a89984ff --veriftext="..." \
    --wrongtext="Incorrect" --wrongcolor=cc241dff \
    --noinputtext="Empty"
