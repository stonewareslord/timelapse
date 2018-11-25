#!/bin/bash
function get_ip() {
  ip -o route get 8.8.8.8 | grep src | perl -pe 's/.*src (\d+\.\d+\.\d+\.\d+)?.*/\1/'
}
function update_ip() {
  curl "https://austenwares.com/a/4b95d8a4-a8ef-407b-a953-8192537ae35b/update.php?user=kLOQMkiDV4Il51sJ7oPSqas9fxmbnJ4S&password=nutmBlH13ys7zwfXf02DkaTYmFzYwlPY&ip4addr=$1"
}
function try_update_ip() {
  IP="$(get_ip)"
  if [[ ! -z "$IP" ]]; then
    update_ip "$IP"
    return 0
  fi
  return 1
}
until try_update_ip; do
  echo "Couldn't get ip. Retrying in 5s..."
  sleep 5
  true
done
while true; do
  echo "Tried to update ip. Sleeping 10m"
  sleep $((10*60))
  try_update_ip
done
