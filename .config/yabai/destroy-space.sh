#!/bin/bash

YABAI_CURRENT_SPACE=$(yabai -m query --spaces --space mouse | jq -r '.index')
YABAI_WINDOWS=$(yabai -m query --windows --space ${YABAI_CURRENT_SPACE} | jq -r '.[].id')
for YABAI_WINDOW_ID in $YABAI_WINDOWS; do
  yabai -m window --close $YABAI_WINDOW_ID
done
yabai -m space --destroy
