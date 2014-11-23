#!/bin/bash
TSROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
### Create some date and time variables to reference later on
DATE=`date +%d-%m-%Y`
MONTH=`date +%m-%Y`
YEST=`date --date="1 day ago" +%m-%d-%Y`

# Set specific variables for your camera
DATETIME=`date +%m-%d-%H-%M-%S-%Y`
CAMIMGPATH=$TSROOT/images
RTSPURL="rtsp://STREAMURL"
### Maker sure all the appropriate directories are created for the Images
mkdir -p $CAMIMGPATH/$MONTH/$DATE
### Use avconv to scrape the RTSP stream and capture a frame for the image
avconv -i $RTSPURL -vframes 1 $CAMIMGPATH/$MONTH/$DATE/$DATETIME.jpg
### Force copy the current image to a folder called current so we can reference the most up to date file for viewing
cp -f $CAMIMGPATH/$MONTH/$DATE/$DATETIME.jpeg $TSROOT/current.jpg
