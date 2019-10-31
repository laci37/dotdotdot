#!/usr/bin/python3
import sys
BRIGHTNESS_FILE = '/sys/class/backlight/intel_backlight/brightness'
arg = sys.argv[1]
with open(BRIGHTNESS_FILE) as inf:
    brightness = int(inf.read())
if arg == 'up':
    brightness += 500
elif arg == 'down':
    brightness -= 500
else:
    try:
        brightness = int(arg)
    except ValueError:
        sys.exit(1)
with open(BRIGHTNESS_FILE, 'w') as outf:
    outf.write(str(brightness))
