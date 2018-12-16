#!/usr/bin/python
import astral
from datetime import timedelta, date
from sys import argv, exit

if len(argv) != 2:
    exit("Need an argument")

arg = argv[1]
if arg == "dawn":
    delta_hours = -7
elif arg == "dusk":
    delta_hours = 6
else:
    exit("Argument must be 'dawn' or 'dusk'")

# If timezone is UTC-6, input "Etc/GMT+6"
# 40,-105 for boulder
location = astral.Location(info=("location", "USA", 40, -104, "UTC"))
location.solar_depression = "civil"

today = date.today() - timedelta(hours=delta_hours)

result = location.sun(date=today)

print "%7s %s" % (arg, result[arg])
