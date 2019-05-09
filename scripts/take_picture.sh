STILL_OPTIONS=(-o $1)

echo "Killing server!"
kill $(ps -aux | grep StreamingCam.py | awk '/python/ {print $2}')
echo "Taking picture!"
raspistill "${STILL_OPTIONS[@]}" && echo "Picture taken! Starting preview server."
./start_stream.sh
