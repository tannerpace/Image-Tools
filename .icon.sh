#!/bin/bash

# Open Finder and allow the user to select an image
echo "Please select an image to resize for favicon (PNG, JPG, GIF supported)"
image_file=$(osascript -e 'tell application "Finder" to ¬
    POSIX path of (choose file with prompt "Select an image to resize for favicon" of type {"PNG", "jpg", "gif"}))')

# prompts the user to get target to move the files to using the osascript command
echo "Please select the Next.js project directory to move the files to"
target_dir=$(osascript -e 'tell application "Finder" to ¬
   POSIX path of (choose folder with prompt "Select the Next.js root directory")')

# prompt the user if they are using a src directory in their project
echo "Are you using a src directory in your project? (y/n)"
read src_dir
if [ "$src_dir" = "y" ]; then
    target_dir="$target_dir/src/"
fi

# Convert image to PNG if necessary
ext="${image_file##*.}"
if [ "$ext" != "png" ]; then
    sips -s format png "$image_file" --out "${image_file%.*}.png"
    image_file="${image_file%.*}.png"
fi

# Resize the image to favicon size using the sips command
echo "Resizing image to favicon size..."

sips -Z 16 "$image_file" --out "${target_dir}favicon-16x16.png"
sips -Z 32 "$image_file" --out "${target_dir}favicon-32x32.png"
sips -Z 48 "$image_file" --out "${target_dir}favicon-48x48.png"

# Convert to ICO using ImageMagick
convert "${target_dir}favicon-16x16.png" "${target_dir}favicon-32x32.png" "${target_dir}favicon-48x48.png" -colors 256 "${target_dir}favicon.ico"

echo "Favicon created successfully."

# Clean up temporary files
rm "${target_dir}favicon-16x16.png"
rm "${target_dir}favicon-32x32.png"
rm "${target_dir}favicon-48x48.png"
