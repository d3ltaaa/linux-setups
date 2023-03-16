echo "===> install synergy"
sleep 3
curl -L -O "https://rc.symless.com/synergy3/v3.0.68.13-beta/synergy-linux_x64-libssl3-v3.0.68.13-beta.rpm"
dnf install synergy-linux_x64-libssl3-v3.0.68.13-beta.rpm
