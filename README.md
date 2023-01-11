# Lenovo Yoga Grub2 Theme

This theme has been tested on:
1. Lenovo Yoga Slim 7 Pro X (Resolution: 3072x1920)
2. Fedora 37


## Preview



## Manual Installation
### Part 1: Install theme
1. Download theme
2. Copy theme to /usr/share/grub/themes
3. Open /etc/default/grub
4. Modify the following:
    1. Change:
    
        `GRUB_TERMINAL=console`
    
        To:
    
        `#GRUB_TERMINAL=console`
    
    2. Add:

        `GRUB_THEME="/usr/share/grub/themes/yoga/theme.txt"`



### Part 2 [Optional]: Add icon for UEFI Settings
!!! This might be different for your distro !!!
1. Open /etc/grub.d/30_uefi-firmware
2. Change:

    `"menuentry '$LABEL' \$menuentry_id_option 'uefi-firmware' {"`
    
    To:

    `"menuentry '$LABEL' --class uefi-firmware \$menuentry_id_option 'uefi-firmware' {"`

    Note: use `--class efi` instead of `--class uefi-firmware` for different icon

### Part 3: Update Grub
1. Run:

    `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg`

    or

    `sudo grub2-mkconfig -o /boot/grub2/grub.cfg`

2. Reboot & enjoy!

## Automatic Installation
Not available at the moment

# License

Licensed under GNU GPL v3.0

Adapted from Filippo Ghibellini

https://github.com/fghibellini/arch-silence
