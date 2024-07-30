#!/bin/bash

noteFilename="/c/Users/grzegorz_kot/.config/Notes/log/note-$(date +%Y-%m).md"

echo "Searching $noteFilename"

if [ -f $noteFilename ]; then
    echo "file found"
    vim -c "norm Go" -c "norm Go## $(date +%d.%m-%H:%M)" -c "norm Go" \
    -c "startinsert" $noteFilename
else
    echo "file not found"
    vim -c "norm GI# Notes for $(date +%Y-%m)" \
    -c "norm Go" -c "norm Go## $(date +%d.%m-%H:%M)" -c "norm Go" \
    -c "startinsert" $noteFilename
fi
