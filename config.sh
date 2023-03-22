# make certain programs execute on startup
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/config/autostart.sh > autostart.sh && chmod +x autostart.sh
./autostart.sh
rm autostart.sh

# install themes
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/config/themes.sh > themes.sh && chmod +x themes.sh
./themes.sh
rm themes.sh

cat > /home/falk/Documents/config_instructions.txt << EOF
Input Devices
  > Touchpad --> Tap-to-click
Synergy
  edit > preferences > hide on start-up
Wallpaper
  search for wallpaper online and download to 
  ~/.wallpapers
Appearance
  > Global Theme --> Colloid-dark (Appearance settings + Desktop and window layout)
  > Application Style --> kvantum-dark
  > Plasma Style --> Colloid-dark
  > Colors --> ColloidDark
  > Window Decorations > Theme --> Colloid-dark-round 
  > Window Decorations > Window border size --> No Borders
  > Window Decorations > Titlebar Buttons > Minimize, Maximize, Close (in the topright corner)
  > Icons --> Colloid-dark
  > Splash Screen --> FedoraMinimal
Workspace Behavior
  > Desktop Effects --> Blur + Magic Lamp
  > Screen Edges > top-left corner --> No Action
  > Screen Locking > Configure... > Add Image... --> ~/.wallpapers/picture.png
Startup and Shutdown
  > Login Screen (SDDM) --> Colloid-dark > Change Background > Load from File --> ~/.wallpapers/picture.png
Notification
  > Choose Custom Position --> bottom-right corner
  > Application-specific settings > Spotify > uncheck all
Users
  > Profile Picture > Choose File --> ~/path/to/file
EOF
