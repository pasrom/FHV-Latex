#!/bin/bash
./dropbox_uploader.sh list | grep "pdf" | awk '{print $3}' | while read line
do
 ./dropbox_uploader.sh delete "$line"
done