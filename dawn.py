#!/usr/bin/python

import astral
from datetime import datetime, timedelta

#if timezone is GMT-6, input "Etc/GMT+6
location = astral.Location(info=("location", "USA",40,-104, "UTC"))

location.solar_depression = "civil"

today = datetime.today() - timedelta(hours=-7, minutes=0)

result = location.sun(date=today)

for k in ["dawn"]:
    print "%7s %s" % (k, result[k])
