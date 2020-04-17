######################### setup.sh #################################
# Title        : MoodeAudio-OLED setup script
# Author       : zzeromin, member of Tentacle Team
# Creation Date: Apr 16, 2020
# Github       : https://github.com/zzeromin, https://github.com/tentacleteam
# Cafe         : http://cafe.naver.com/raspigamer
# Free and open for all to use. But put credit where credit is due.
#
# Install      :
# cd /home/pi
# git clone https://github.com/zzeromin/MoodeAudio-OLED.git
# cd /home/pi/MoodeAudio-OLED
# chmod 755 setup.sh
# sudo ./setup.sh

echo "MoodeAudio-OLED setup is starting. "
echo "dtparam=i2c_arm=on" >> /boot/config.txt
echo "dtparam=i2c_arm_baudrate=400000" >> /boot/config.txt
echo "dtparam=i2c_dev=on" >> /boot/config.txt
echo "i2c-bcm2708" >> /etc/modules
echo "i2c-dev" >> /etc/modules
apt-get update
apt-get install python3-dev python3-smbus i2c-tools
echo "I2C, Python Tools Setup Complete."
sleep 1
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade Pillow
pip3 install adafruit-circuitpython-ssd1306
pip3 install python-mpd2
echo "Python Library Setup Complete."
sleep 1
echo "downloading MoodeAudio-OLED source code."
cd /home/pi
git clone https://github.com/zzeromin/MoodeAudio-OLED.git
cd /home/pi/MoodeAudio-OLED
cp oled.service /lib/systemd/system/
systemctl enable oled
echo "All Setup Complete. Reboot after 3 Seconds."
sleep 3
reboot
