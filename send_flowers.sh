#!/bin/bash

# Define the file path for the plist
PLIST_FILE="$HOME/Library/LaunchAgents/com.user.openimage.plist"

# Define the image file path (using pwd to get the current directory)
IMAGE_FILE="$(pwd)/618AA5W8V6L._AC_SL1024_.jpg"

# Create the directory if it doesn't exist
mkdir -p "$HOME/Library/LaunchAgents"

# Write the plist content to the file
cat > "$PLIST_FILE" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.openimage</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/open</string>
        <string>$IMAGE_FILE</string>
    </array>
    <key>StartInterval</key>
    <integer>86400</integer> <!-- Run every 60 seconds -->
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

# Load the job
launchctl load "$PLIST_FILE"

echo "Plist file created and loaded: $PLIST_FILE"
echo "Image file path set to: $IMAGE_FILE"
