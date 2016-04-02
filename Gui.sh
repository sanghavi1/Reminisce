#!/bin/bash

CD_APP="/Applications/CocoaDialog.app"
CD="$CD_APP/Contents/MacOS/CocoaDialog"


$CD bubble --title "Message Opener" --text "Launching Application" --x-placement "center" --y-placement "center"

cd ~/Library/Messages/Archive

dates=`$CD standard-inputbox --title "Message Opener" --informative-text "Enter a date in year-month-date format" --text "Example: 2015-09-05" --float | tail -n +2`
if [ ! -d "$dates" ]; then
  exit
fi
cd "$dates"

for files in *; do
	allMes+="$files"$'\n'
done

rv=`$CD ok-msgbox --text "Messages from Date:" \
--informative-text "$allMes" \
--no-newline --float`
if [ "$rv" == "1" ]; then
echo "User said OK"
elif [ "$rv" == "2" ]; then
echo "Canceling"
exit
fi

name=`$CD standard-inputbox --title "Message Opener" --informative-text "Please enter a name" --text "Example: John" --float | tail -n +2`

for file in *$name*; do
	open "$file"
done