#!/bin/bash

UTC_OFFSET="-6"

TZ="UTC"
read YYYY MM DD HH MIN SEC<<<"$(date -d "-1 day ${UTC_OFFSET} hour" +'%Y %m %d %H %M %S')"

YESTERDAY_DATE="${YYYY}-${MM}-${DD}"
TEST_YESTERDAY_DATE="2018-06-20"
YESTERDAY_FILEPATH="/home/pi/Documents/Timelapse/tl-${YESTERDAY_DATE}/"
VID_FILENAME="${YESTERDAY_DATE}.mp4"

if [[ -d "${YESTERDAY_FILEPATH}" ]]; then
	cd "${YESTERDAY_FILEPATH}"
else
	echo "${YESTERDAY_FILEPATH} does not exist. exiting script"
	exit
fi

echo "${YESTERDAY_FILEPATH}${VID_FILENAME}"

if [[ -e "${YESTERDAY_FILEPATH}${VID_FILENAME}" ]]; then #if {filename}.mp4.success exists...
	echo "${YESTERDAY_FILEPATH}${VID_FILENAME} already exists, exiting script"
	exit
else
	echo "creating video ${YESTERDAY_FILEPATH}${VID_FILENAME}"
	if ffmpeg -r 15 -pattern_type glob -i "${YESTERDAY_FILEPATH}*.JPEG" -s 720x480 -vcodec libx264 "${YESTERDAY_FILEPATH}${VID_FILENAME}" ; then #create timelapse
		echo "${YESTERDAY_FILEPATH}${VID_FILENAME} successfully created. exiting script."
		exit
	else
		rm -f "${YESTERDAY_FILEPATH}${VID_FILENAME}"
		echo "failed to create ${YESTERDAY_FILEPATH}${VID_FILENAME}"
		echo "exiting script."
		exit
	fi
fi
