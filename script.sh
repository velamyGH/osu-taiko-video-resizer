echo "//Tool made by Khoo Hao Yit and Jerry, linux native script by velamy"

echo
echo "Video conversion in progress, please wait"
echo

cd "$(dirname "$0")"

files/ffmpeg/ffmpeg -y -hide_banner -loglevel fatal -stats \
  -i "$1" -i files/Blank720p.png \
  -filter_complex "[0]split=3[blur][scale][output];[output]scale=1280:720[output];[scale]scale=-1:340[scale];[blur]scale=1280:-1,boxblur=10,crop=1280:340[blur];[output][1]overlay=0:0[output];[output][blur]overlay=0:387[output];[output][scale]overlay=(W-w)/2:387[output]" \
  -map "[output]" -aspect 1280:720 -b:v 800K output.mp4

echo
echo "Video conversion completed"
echo
read -p "Press enter to exit..."
exit 0
