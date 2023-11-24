#!/usr/bin/env bash

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

# Wofi window config (in %)
WOFI_WIDTH=10
WOFI_HEIGHT=35

wofi_command="wofi --show dmenu \
			--prompt choose... \
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WOFI_WIDTH% --height=$WOFI_HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"
			
#entries=$(echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | $wofi_command -i --dmenu | awk '{print tolower($2)}')
menu() {
	printf "1.   Poweroff\n"
	printf "2.   Reboot\n"
	printf "3.  Suspend\n"
	printf "4.  Lock\n"
	printf "5.  Logout\n"
}
#case $entries in 
 #   poweroff|reboot|suspend)
  #      systemctl $entries
   #     ;;
    #lock)
     #   $HOME/.config/hypr/scripts/LockScreen.sh
      #  ;;
    #logout)
     #   hyprctl dispatch exit 0
      #  ;;
#esac
main() {
	choice=$(menu | ${wofi_command} | cut -d. -f1)
	case $choice in
		1)
			systemctl poweroff
			;;
		2)
			systemctl reboot
			;;
		3)
			systemctl suspend
			;;
		4)
			$HOME/.config/hypr/scripts/LockScreen.sh
			;;
		5)
			hyprctl dispatch exit 0
			;;
		*)
			;;
	esac
}

main
