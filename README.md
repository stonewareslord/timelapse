For creating timelapses of the day on a raspberry pi, taking into account the timezone.

# General Notes
Install required applications:
```
sudo apt update
# Wondershaper used for throttling wifi (helps with kernel panicks during high load)
sudo apt install wondershaper imagemagick
```

To add a network, open the network list:
```
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```
and add the following to the bottom:
```
network={
    ssid="NEWTORK NAME HERE"
    psk="NETWORK PASSWORD HERE"
}
```
Exit the editor with cntrl x, y, enter

# "Personal" notes
```
shopt -s extglob
# Remove extra services
sudo rm -r /etc/cron.daily/!(logrotate)
sudo rm -r /etc/cron.weekly/man-db

# Removing time checks
systemctl disable systemd-timesyncd ntp apt-daily-upgrade.timer

# Install timedate service
sudo cp etc/timedate.service etc/systemd/system/timedate.service
sudo systemtcl daemon-reload
sudo systemctl enable timedate
```
