kill $(ps -aux | grep StreamingCam.py | awk '/python/ {print $2}')
raspistill -o $1
./StreamingCam.py &
