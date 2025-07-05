# Init

```
sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y vim git
sudo parted /dev/mmcblk0 resizepart 2 100%
git clone git@github.com:lkwilson/anybox.git ~/.home
cd ~/.home
./anybox install
# copy ssh keys onto machine
mkdir ~/l
git clone git@github.com:lkwilson/home-infra.git ~/l/home-infra
```

Install docker

```
sudo usermod -aG docker op
```