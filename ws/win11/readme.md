# Windows USB Installers

- on windows, you can just use the media tool from the website
- on linux, it's gpt + single fat32 partition with msftdata flag

notes:
- install.wim needs fragmenting (fat32 4GB limit)
- msftdata flag / partition type is important
- will need TPM 2.0 & secure boot & uefi boot
- manually adding a uefi entry can help: `\EFI\BOOT\BOOTX64.EFI`

warning: you can't just dd the iso and msftdata flag is important (as opposed
to efi), it'll have the wrong partition and while it may boot, it will fail to
see the installer files and complain about missing drivers (which is
misleading).

```bash
sudo apt-get install parted dosfstools rsync wimtools
set -e
lsblk -o NAME,PATH,SIZE,MODEL,TRAN,MOUNTPOINTS

USB=/dev/sdX
ISO=/path/to/Windows.iso

sudo parted "$USB" --script mklabel gpt
sudo parted "$USB" --script mkpart primary fat32 1MiB 100%
sudo parted "$USB" --script set 1 msftdata on
sudo udevadm settle
sudo mkfs.vfat -F 32 -n WININSTALL "${USB}1"

sudo mkdir -p /mnt/winiso /mnt/winusb
sudo mount -o loop,ro "$ISO" /mnt/winiso
sudo mount "${USB}1" /mnt/winusb

sudo rsync -rt --exclude='/sources/install.wim' /mnt/winiso/ /mnt/winusb/
# this usually fails, it's too big
# sudo rsync -rt /mnt/winiso/ /mnt/winusb/
# so you split it with this:
sudo wimlib-imagex split /mnt/winiso/sources/install.wim /mnt/winusb/sources/install.swm 3800

sync
sudo umount /mnt/winusb /mnt/winiso
```
