#!/bin/bash

query=$(printf '%s' "$*" | tr ' ' '+' )
resolution='+1080p'

magnet=$(echo $(curl -s "https://nyaa.si/?f=0&c=1_2&q=$query$resolution&s=seeders&o=desc") | grep -Po "magnet:\?xt=urn:btih:[a-zA-Z0-9]*" | head -n 1)

if [ "$magnet" == "" ]; then
  echo "torrent not found for $query"
  exit 1
else
  echo "found torrent for $query" 
  echo "opening vlc.."
  peerflix "$magnet" --vlc >> /dev/null
fi

