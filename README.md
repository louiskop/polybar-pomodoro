# Polybar Pomodoro Module

# Installation

1. Clone this repo where you store your polybar scripts

2. Add the following config in your polybar config

```
[module/pomodoro]
type = custom/script
exec = /path/to/repo/pomodoro/pomodoro.sh
interval = 1
click-left = exec /path/to/repo/pomodoro/pomodoro-on.sh
click-right = exec /path/to/repo/pomodoro/pomodoro-off.sh
format-padding = 1
format-background = #282828
format-foreground = #F0C674
```
- Note : `format-background` and `format-foreground` is for when the timer is off
- Note : `interval = 1` is essential for the timer to work in seconds
- Note : Make sure all `.sh` scripts has executable privileges with `chmod u+x <related_filename>.sh`
- Note : The tomato glyph used is compatible with Nerd Fonts -> change this in `pomodoro.sh`

3. Make sure the module is added to your bar & you're done !

# Configuration

Open `pomodoro-on.sh` and view all configurable variables:

```
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
```
- Note: `CYCLES` is the amount of work and break sessions before a long break is triggered.

# Usage

- Left click on the icon to start the timer.
- Left click again to restart the timer. (cycles also reset).
- Right click to turn off the timer

