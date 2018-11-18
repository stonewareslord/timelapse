#!/bin/bash

UTC_OFFSET="-6"

DAWNPY=`python /usr/local/bin/dawn.py`
DUSKPY=`python /usr/local/bin/dusk.py`
DAWN_UTC=${DAWNPY:19:8}
DUSK_UTC=${DUSKPY:19:8}
#echo "Dawn = ${DAWN_UTC}"
#echo "Dusk = ${DUSK_UTC}"

read DHH DMIN DSEC<<<"$(date -d "${DAWN_UTC} UTC ${UTC_OFFSET} hour" +'%H %M %S')"
DAWN_ADJUSTED="${DHH}:${DMIN}:${DSEC}"
read DHH DMIN DSEC<<<"$(date -d "${DUSK_UTC} UTC ${UTC_OFFSET} hour" +'%H %M %S')"
DUSK_ADJUSTED="${DHH}:${DMIN}:${DSEC}"
echo "Dawn (Adjusted) = ${DAWN_ADJUSTED}"
echo "Dusk (Adjusted) = ${DUSK_ADJUSTED}"

TZ="UTC"
read YYYY MM DD HH MIN SEC<<<"$(date -d "${UTC_OFFSET} hour" +'%Y %m %d %H %M %S')"

CURRENT_TIME="${HH}:${MIN}:${SEC}"
FILEPATH="/home/pi/Documents/Timelapse/tl-${YYYY}-${MM}-${DD}/"
PIC_FILENAME="${HH}-${MIN}-${SEC}.JPEG"
TIMESTAMP="${YYYY}/${MM}/${DD} ${CURRENT_TIME} UTC${UTC_OFFSET}"

mkdir -p "${FILEPATH}"
cd "${FILEPATH}"

echo "Window: ${DAWN_ADJUSTED} and ${DUSK_ADJUSTED}"
echo "CURRENT_TIME = ${CURRENT_TIME}"
echo "TIMESTAMP = ${TIMESTAMP}"
echo "FILEPATH = ${FILEPATH}"

if [[ ! ( "${CURRENT_TIME}" < "${DAWN_ADJUSTED}" || "${CURRENT_TIME}" > "${DUSK_ADJUSTED}" ) ]]; then
	raspistill -n -o "${FILEPATH}${PIC_FILENAME}"
	convert "${FILEPATH}${PIC_FILENAME}" -draw "fill black rectangle 0,2464,800,2410" -gravity southwest -pointsize 50 -fill white -font courier -annotate +0+0 "${TIMESTAMP}" "${FILEPATH}${PIC_FILENAME}"
	echo "picture taken"
else
	echo "no picture taken."
fi
