#!/bin/bash

mkdir -p ~/Videos/gifs
cd ~/Videos/Screencasts

for file in *.webm;
do
  ffmpeg -i "$file" ../gifs/"$file".gif;
  rm "$file";
done
