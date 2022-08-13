# How to auto setup

You can use the downloadable image, and configure it with this without having
to mount on another raspberry pi.

# Enable ssh with `/boot/ssh`
```
touch ssh
```

# Add wifi with `/boot/wpa_supplicant.conf`
Start with this:
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US
```
Use `wpa_passphrase` to generate the psk part
```
wpa_passphrase '<ssid>' '<password>'
```

# Set the password with `/boot/userconf.txt`
```
echo op:"$(echo 'mypassword' | openssl passwd -6 -stdin)" > userconf.txt
```

# Setup the poe pi hat levels with `/boot/config.txt`

Add the following to the bottom
```
# PoE Hat Fan Speeds
dtparam=poe_fan_temp0=50000
#dtparam=poe_fan_temp0_hyst=2000
dtparam=poe_fan_temp1=55000
#dtparam=poe_fan_temp1_hyst=2000
dtparam=poe_fan_temp2=60000
#dtparam=poe_fan_temp2_hyst=2000
dtparam=poe_fan_temp3=65000
#dtparam=poe_fan_temp3_hyst=5000
```

