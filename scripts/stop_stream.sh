kill $(ps -aux | grep StreamingCam.py | awk '/python/ {print $2}')
