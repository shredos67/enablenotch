# enablenotch
enables notch for macbooks running arch linux
> [!NOTE]
*this should **only** be ran on a macbook with asahi-alarm installed, not asahi fedora*... 
>i dont know how this would behave on fedora, but it most likely wont work, or worst case it'll break something


also... if you need this script because you cant enable notch manually...  arch linux probably isnt for you :)

# Installation and usage:

make sure you have git installed:
```
pacman -Q git
```
if its not installed:

```
sudo pacman -S git
```

installing the script:
```bash
git clone https://github.com/shredos67/enablenotch.git
cd enablenotch
./enablenotch.sh
```
then reboot

Done!
