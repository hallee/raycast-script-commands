#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Record Simulator to GIF
# @raycast.mode compact
# @raycast.packageName Developer Utilities

# Optional parameters:
# @raycast.author Hal Lee
# @raycast.authorURL https://github.com/hallee
# @raycast.description Records open Simulator to an animated GIF
# @raycast.icon images/iPhone.png
# @raycast.argument1 { "type": "text", "placeholder": "Filename" }
# @raycast.currentDirectoryPath ~/Downloads

clipboard=$1
videoPath=~/Downloads/$clipboard.mp4
gifPath=~/Downloads/$clipboard.gif
open -a Simulator && xcrun simctl io booted recordVideo --codec h264 --mask black "$videoPath" &&
gifski --fps 30 -W 500 -Q 85 "$videoPath" -o "$gifPath"
open -R "$gifPath"
