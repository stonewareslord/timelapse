For creating timelapses of the day on a raspberry pi, taking into account the timezone.

# General Notes

To add a network, open the network list:
```
$ sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
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
#
sudo rm -r /etc/cron.daily/!(logrotate)
sudo rm -r /etc/cron.weekly/man-db

# removing time checks
systemctldisable systemd-timesyncd ntp apt-daily-upgrade.timer

# throttling wifi (helps with kernel panicks during high load)
sudo apt install wondershaper
wondershaper wlan0 256 128

#
sudo systemtcl daemon-reload
sudo systemctl enable timedate
```
