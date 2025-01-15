#!/bin/bash

KIOSK_URL="http://127.0.0.1:3000/NiclaSenseME-dashboard/index.html"

# Function to display progress bar
show_progress() {
  local duration=$1
  already_done() { for ((done=0; done<$elapsed; done++)); do printf "#"; done; }
  remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf "."; done; }
  percentage() { printf "| %s%%" $(( ($elapsed*100)/($duration*1) )); }
  clean_line() { printf "\r"; }

  for ((elapsed=1; elapsed<=$duration; elapsed++)); do
    already_done; remaining; percentage
    sleep 1
    clean_line
  done

  printf "\n"
}

# Sleep with progress bar
echo "compilation source... ..."
show_progress 8

echo 'Starting Chromium...'
#/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk --app=$KIOSK_URL
#echo "done"
