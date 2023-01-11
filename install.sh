echo "Yoga Grub2 Theme Installer\n"
# create grub themes folder
THEME_DIR = "/usr/share/grub/themes"
echo "Creating themes folder...\n"
sudo mkdir $THEME_DIR

# copy theme to themes folder
echo "Copying yoga grub theme...\n"
sudo cp -R yoga $THEME_DIR


if grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null; then
#Replace GRUB_THEME
sed -i "s|.*GRUB_THEME=.*|GRUB_THEME=\"${THEME_DIR}/yoga/theme.txt\"|" /etc/default/grub
else
#Append GRUB_THEME
echo "GRUB_THEME=\"${THEME_DIR}/yoga/theme.txt\"" >> /etc/default/grub
fi

if grep "GRUB_TERMINAL=console" /etc/default/grub 2>&1 >/dev/null || grep "GRUB_TERMINAL=\"console\"" /etc/default/grub 2>&1 >/dev/null; then
#Replace GRUB_TERMINAL
sed -i "s|.*GRUB_TERMINAL=.*|#GRUB_TERMINAL=console|" /etc/default/grub
fi

if grep "GRUB_TERMINAL_OUTPUT=console" /etc/default/grub 2>&1 >/dev/null || grep "GRUB_TERMINAL_OUTPUT=\"console\"" /etc/default/grub 2>&1 >/dev/null; then
#Replace GRUB_TERMINAL_OUTPUT
sed -i "s|.*GRUB_TERMINAL_OUTPUT=.*|#GRUB_TERMINAL_OUTPUT=console|" /etc/default/grub
fi


echo "Do you want to add UEFI/BIOS icon? (Risky\!)\nY/N? Default N"
read EFI_ICON

if [$EFI_ICON = "Y"] || [$EFI_ICON = "y"] 
	if has_command dnf; then
		echo "Editing uefi-firmware file...\n"
		LINE = "menuentry '$LABEL' \$menuentry_id_option 'uefi-firmware' {"
		REPL = "menuentry '$LABEL' --class efi \$menuentry_id_option 'uefi-firmware' {"
		sudo sed -i "s/$LINE/$REPL/" /etc/grub.d/30_uefi-firmware
	else
		echo "Only works with fedora for now. Try installing manually...\n"
	fi
fi

sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

# Check command availability
function has_command() {
  command -v $1 &> /dev/null #with "&>", all output will be redirected.
}
