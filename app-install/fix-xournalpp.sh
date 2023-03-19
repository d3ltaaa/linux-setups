#!/bin/bash
echo "unset GDK_CORE_DEVICE_EVENTS" >> ~/.bashrc

# Add "unset GDK_CORE_DEVICE_EVENTS;" before the "Exec=" line in the desktop file
# and save the changes
sudo sed -i 's|Exec=xournalpp %f|Exec=unset GDK_CORE_DEVICE_EVENTS;xournalpp %f|g' /usr/share/applications/xournalpp.desktop
