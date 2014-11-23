# Use avconv to take photos and assamble timelapse videos

A set of sample bash scripts to take photos with a webcam using avconv and assemble them in a daily timelapse.

Images will be stored in `images` subdirectory, and daily videos to `videos`, sorted by month then day. Most recent video will be visible as current.avi, and images will be archived and deleted after the video is assembled to save up on space (great for off the grid timelapse on sdcard and embedded device).

## Requirements

* `avconv` and `mencoder` for capturing photos and assambling the timelapse.
* debian (or modify `date` calls for yesterday to `date -j -v -1d +%d-%m-%Y`)

## Crontab Examples

    # Take a photo every minute (can go up to every second)
    */1 * * * * /PATH/image.sh

    # Take a photo every 5 minutes
    */5 * * * * /PATH/image.sh

    # Assemble yesterday's video at 11:30
    30 11 * * * /PATH/lapse.sh
