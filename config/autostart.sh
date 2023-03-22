
# synergy
mkdir -p /home/falk/.config/autostart
cat > /home/falk/.config/autostart/com.symless.Synergy.desktop << EOF
[Desktop Entry]
Categories=Utility;
Comment=Keyboard and mouse sharing solution
Exec=/usr/bin/flatpak run --branch=master --arch=x86_64 com.symless.Synergy
Icon=com.symless.Synergy
Keywords=keyboard;mouse;sharing;network;share;
Name=Synergy
Terminal=false
Type=Application
Version=1.0
X-Flatpak=com.symless.Synergy
X-Flatpak-RenamedFrom=synergy.desktop;
EOF

# latte-dock
mkdir -p /home/falk/.config/autostart
cat > /home/falk/.config/autostart/org.kde.latte-dock.desktop << EOF
[Desktop Entry]
Name=Latte
Comment=Dock for the masses
GenericName=Dock
Icon=latte-dock
Categories=Utility;X-SuSE-DesktopUtility;
Exec=/usr/bin/latte-dock
InitialPreference=1
StartupNotify=false
Terminal=false
Type=Application
StartupWMClass=latte-dock
X-DBUS-ServiceName=org.kde.lattedock
X-DBUS-StartupType=unique
X-KDE-PluginInfo-Author=Michail Vourlakos, Smith Ar
X-KDE-PluginInfo-Email=mvourlakos@gmail.com, audoban@openmailbox.org
X-KDE-PluginInfo-Version=0.10.8
X-KDE-PluginInfo-Website=https://userbase.kde.org/LatteDock
X-KDE-StartupNotify=false
X-KDE-SubstituteUID=false
X-KDE-Wayland-Interfaces=org_kde_plasma_window_management,org_kde_kwin_keystate,zkde_screencast_unstable_v1
EOF

# ulauncher
mkdir -p /home/falk/.config/autostart
cat > /home/falk/.config/autostart/ ulauncher.desktop<< EOF
[Desktop Entry]
Categories=GNOME;GTK;Utility;
Comment=Application launcher for Linux
Exec=env GDK_BACKEND=x11 /usr/bin/ulauncher --hide-window
GenericName=Launcher
Icon=ulauncher
Name=Ulauncher
Terminal=false
TryExec=/usr/bin/ulauncher
Type=Application
EOF

# make them executable
chmod +x ~/.config/autostart/com.symless.Synergy.desktop
chmod +x ~/.config/autostart/org.kde.latte-dock.desktop
chmod +x ~/.config/autostart/ulauncher.desktop

# make them execute on startup
xdg-autostart com.symless.Synergy.desktop
xdg-autostart org.kde.latte-dock.desktop
xdg-autostart ulauncher.desktop
