#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title text-insert
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Insert Quote" }
# @raycast.argument2 { "type": "text", "placeholder": "Source title" , "optional":true}
# @raycast.argument3 { "type": "text", "placeholder": "Source link" , "optional":true}

# Documentation:
# @raycast.author huyixi
# @raycast.authorURL https://raycast.com/huyixi

# IMPORTANT: Please replace the file_path with your own file path before running this script.
file_path="/Users/huyixi/i/huyixi.wiki/docs/quotes.md"

if [[ -z "$file_path" ]]; then
  echo "Error: file_path is not set. Please set the file_path variable at the top of this script."
  exit 1
fi

quote="$1"
source_title="$2"
source_link="$3"

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

formatted_quote="> $quote"$'\n'

if [[ -n "$source_title" ]]; then
  formatted_quote="$formatted_quote"$'\n'"Source: [${source_title}](${source_link})"
elif [[ -n "$source_link" ]]; then
  formatted_quote="$formatted_quote"$'\n'"Source: [source](${source_link})"
fi

formatted_quote="$formatted_quote"$'\n'"Time: $current_datetime"$'\n'

if [ ! -f "$file_path" ]; then
  touch "$file_path"
fi

echo "$formatted_quote" >> "$file_path"

echo "Quote inserted into $file_path"
