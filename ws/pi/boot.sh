#!/usr/bin/env bash

echo "Edit this before running!"
exit 1

boot_dir=/Volumes/boot
wifi_ssid=the_ssid
wifi_pass=the_password
user_name=pi
user_pass=raspberry

cd "$boot_dir" || {
  echo "Failed to cd into boot directory"
  exit 1
}

# ssh
touch ssh

# wifi
echo 'ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev' > wpa_supplicant.conf
echo 'update_config=1' >> wpa_supplicant.conf
echo 'country=US' >> wpa_supplicant.conf
echo >> wpa_supplicant.conf
echo 'network={' >> wpa_supplicant.conf
echo "  ssid=\"$wifi_ssid\"" >> wpa_supplicant.conf
echo "  psk=\"$wifi_pass\"" >> wpa_supplicant.conf
echo '}' >> wpa_supplicant.conf

# user
echo "$user_name:$(echo "$user_pass" | openssl passwd -6 -stdin)" > userconf.txt

# poe
echo 'dtparam=poe_fan_temp0=80000,poe_fan_temp0_hyst=5000' >> config.txt
echo 'dtparam=poe_fan_temp1=82000,poe_fan_temp1_hyst=2000' >> config.txt
echo 'dtparam=poe_fan_temp2=84000,poe_fan_temp2_hyst=2000' >> config.txt
echo 'dtparam=poe_fan_temp3=86000,poe_fan_temp3_hyst=2000' >> config.txt

