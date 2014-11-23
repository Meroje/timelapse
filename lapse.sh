#!/bin/bash

### create variables for the current time for later reference
MONT=`date +%m-%Y`
DATE=`date --date="1 day ago" +%d-%m-%Y`
# create a variable for the timelapse root
TSROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IMGPATH=$TSROOT/images
VIDPATH=$TSROOT/videos
### Get a list of files to add to the archive
ls -1tr $IMGPATH/$MONT/$DATE/ > $TSROOT/files.txt
### Change to the directory of the files and encode them into an AVI file
mkdir -p $VIDPATH/$MONT
cd $IMGPATH/$MONT/$DATE
mencoder mf://@@$TSROOT/files.txt -mf w=1920:h=1080:fps=15:type=jpg -ovc x264 -x264encopts subq=6:partitions=all:8x8dct:me=umh:frameref=5:bframes=3:b_pyramid=normal:weight_b:threads=auto -oac copy -o $VIDPATH/$MONT/$DATE.avi
cp -f $VIDPATH/$MONT/$DATE.avi $TSROOT/current.avi

### Archive the images
cd $IMGPATH/$MONT
tar cvzf $DATE.tar.gz $DATE
rm -rf $IMGPATH/$MONT/$DATE
