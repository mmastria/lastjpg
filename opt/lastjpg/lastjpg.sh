#!/bin/bash
cd /opt/lastjpg
echo "." >> lastjpg.log
echo ". $(date +%d.%m.%G\-%H:%M:%S) - start" >> lastjpg.log
CAM1="/mnt/d/iCamSource/7D220F336334C70B79F1B57F8740B9E5732113CC/"
DIR1=$(ls $CAM1 -1 | sort | tail -1)
FILE1=$(ls $CAM1$DIR1 -1 | sort | tail -1)
if [ "$FILE1" != "" ]
then
  echo ". $(date +%d.%m.%G\-%H:%M:%S) - copy $FILE1" >> lastjpg.log
  cp -p $CAM1$DIR1/$FILE1 lastjpg.jpg
fi
echo ". $(date +%d.%m.%G\-%H:%M:%S) - ftp lastjpg.jpg" >> lastjpg.log
ftp webcam.wunderground.com<<EOF
bin
put lastjpg.jpg image.jpg
quit
EOF
echo ". $(date +%d.%m.%G\-%H:%M:%S) - end" >> lastjpg.log
echo "." >> lastjpg.log
