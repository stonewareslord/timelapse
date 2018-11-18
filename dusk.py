#!/usr/bin/python

import astral
import datetime

#if timezone is UTC-6, input "Etc/GMT+6"
location = astral.Location(info=("location", "USA",40,-105, "UTC"))
#40,-105 for boulder
location.solar_depression = "civil"

today = datetime.date.today() - datetime.timedelta(hours=6)

result = location.sun(date=today)

for k in ["dusk"]:
    print "%7s %s" % (k, result[k])

