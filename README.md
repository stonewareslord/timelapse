# timelapse
# For creating timelapses of the day on a raspberry pi, taking into account the timezone.

```bash
# To add a network, open the network list:
$ sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
# and add the following to the bottom:
network={
network={
    ssid="NEWTORK NAME HERE"
    psk="NETWORK PASSWORD HERE"
}
# Exit the editor with cntrl x, y, enter

# "personal" notes
shopt -s extglob
sudo rm -r /etc/cron.daily/!(logrotate)
sudo rm -r /etc/cron.weekly/man-db
```
