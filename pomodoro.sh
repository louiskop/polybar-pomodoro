#!/bin/bash
OFF_GLYPH=""
mode=$(cat pomodoro.txt)
if [ "$mode" = "Off" ]; then
    echo $OFF_GLYPH
elif [ "$mode" = "READ" ]; then 
    echo $OFF_GLYPH
else
    echo $mode
    echo "READ" > pomodoro.txt 
fi

