#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "run this script with root priviliges"
  exit
fi

echo "this will apply a parameter to grub config"

sleep 1

read -p "is this ok? (y/n): " confirmation

if [[ "$confirmation" == "y" ]]; then
  echo "alright"
  echo ""
  sleep 1
else
  echo "ok cancelled"
  exit
fi

PARAM="appledrm.show_notch=1"

echo "setting notch param $PARAM"
GRUB_FILE="/etc/default/grub"

if grep -q "$PARAM" "$GRUB_FILE"; then
  echo "the parameter is already set"
  exit
else
  sed -i "/GRUB_CMDLINE_LINUX_DEFAULT/ s/\"$/ $PARAM\"/" "$GRUB_FILE"
  echo "added $PARAM to grub config"
fi

if command -v update-grub >/dev/null; then
  update-grub
else
  grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "ok"
echo "you need to reboot so that the kernel is reloaded to see changes take effect"
