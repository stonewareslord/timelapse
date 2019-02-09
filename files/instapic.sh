#!/bin/bash

TZ="UTC"

#read YYYY MM DD HH MIN SEC<<<"$(date +'%Y %m %d %H %M %S')"
read YYYY MM DD HH MIN SEC<<<"$(date --date='5 seconds'  +'%Y %m %d %H %M %S')"

if findmnt -M /mnt >/dev/null; then
  # The disk is mounted. Copy files to /mnt
  FILEDIR="/mnt"
else
  # The disk is not mounted. 
  FILEDIR="/home/pi/Documents/fp"
fi
FILEPATH="$FILEDIR/fp-${YYYY}-${MM}-${DD}/"
PICFILENAME="${YYYY}-${MM}-${DD}-${HH}-${MIN}-${SEC}.JPEG"
TIMESTAMP="${YYYY}/${MM}/${DD} ${HH}:${MIN}:${SEC}"

mkdir -p "${FILEPATH}"

raspistill --nopreview --output "${FILEPATH}${PICFILENAME}"
convert "${FILEPATH}${PICFILENAME}" -draw "fill black rectangle 0,2464,560,2410" -gravity southwest -pointsize 50 -fill white -font courier -annotate +0+0 "${TIMESTAMP}" "${FILEPATH}${PICFILENAME}"
echo "${PICFILENAME}"
