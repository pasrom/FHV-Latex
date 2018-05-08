#!/bin/bash
./scripts/Dropbox-Uploader/dropbox_uploader.sh list | grep "pdf" | awk '{print $3}' | while read line
do
 ./scripts/Dropbox-Uploader/dropbox_uploader.sh delete "$line"
done