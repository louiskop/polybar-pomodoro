#!/bin/bash

# <CONFIGURATION>
WORK_MINUTES=30
WORK_BG="B#FB4934"
BREAK_MINUTES=5
LONG_BREAK_MINUTES=30
CYCLES=3
BREAK_BG="B#83a598"
FG="F#282828"
PAD="  "
# </CONFIGURATION>

BG=$WORK_BG
minutes=$WORK_MINUTES
seconds=0
mode="WORK"
cycle=0
echo "%{$BG}%{$FG}$PAD$mode $minutes:$seconds$PAD%{F-}%{B-}" > pomodoro.txt

# count down time
while :
do
    # get current status
    status=$(cat pomodoro.txt)

    # update timer if read
    if [ "$status" = "READ" ]; then

        # update minute
        if [ $seconds = 0 ]; then
            # update mode 
            if [ $minutes = 0 ]; then
                if [ $mode = "WORK" ]; then
                    # count this cycle 
                    ((cycle++))
                    if [ $cycle == $CYCLES ]; then
                        mode="LONG BREAK"
                        minutes=$LONG_BREAK_MINUTES
                        seconds=0
                        BG=$BREAK_BG
                        cycle=0
                    else
                        mode="BREAK"
                        minutes=$BREAK_MINUTES
                        seconds=0
                        BG=$BREAK_BG
                    fi
                else
                    mode="WORK"
                    minutes=$WORK_MINUTES
                    seconds=0
                    BG=$WORK_BG
                fi
            else
                ((minutes--))
                seconds=59  
            fi
        # update seconds
        else
            ((seconds--))
        fi

        # write new data
        echo "%{$BG}%{$FG}$PAD$mode $minutes:$seconds$PAD%{F-}%{B-}" > pomodoro.txt

    # stop script
    elif [ "$status" = "Off" ]; then
        exit
    fi
done
