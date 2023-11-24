#!/bin/bash

## Files
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"
iDIR="$HOME/.config/hypr/dunst/icons"


# wofi window config (in %)
WIDTH=20
HEIGHT=40

## Wofi Command
wofi_command="wofi --show dmenu \
			--prompt choose...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"


notification(){
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/music.png" "Now Playing: Online Music" 
}

menu(){
printf "1. Mon Mix\n"
printf "2. Nirvana et cie\n"
printf "3. My Reggae\n"
printf "4. Core\n"
printf "5. OST\n"
printf "6. SB\n"
printf "7. Phonk\n"
printf "8. LofiGirl\n"
printf "9. Reggae Mix V1\n"
printf "a. Reggae Mix V2\n"
}
main() {
choice=$(menu | ${wofi_command} | cut -d. -f1)
case $choice in
1)
	notification ;
    mpv --shuffle --vid=no "https://youtube.com/playlist?list=PLuAX9t_8FM4NCv323X1ej49ShYy7fdFGp"
    return
    ;;
2)
	notification ;
	mpv --shuffle --vid=no "https://youtube.com/playlist?list=PLuAX9t_8FM4ONqUphPzr5ZdcNiiFm8xWD"
	return
	;; 
3)
	notification ;
	mpv --shuffle --vid=no "https://youtube.com/playlist?list=PLuAX9t_8FM4Nuvy2IFdADiyolyciHVXXK" 
	return
	;;
4)
	notification ;
	mpv --shuffle --vid=no "https://youtube.com/playlist?list=PLuAX9t_8FM4N0_EBLx4hu0HCcte2QD_cW"
	return
	;;
5)
	notification ;
	mpv --shuffle --vid=no "https://youtube.com/playlist?list=PLuAX9t_8FM4M7ntgVBV3ZfmJ9ZN0sP8ty"
	return
	;;
6)
	notification ;
	mpv --shuffle --vid=no "https://youtube.com/playlist?list=PLuAX9t_8FM4PcNAE-zHxq6OoKaKleEVNj"
	return
	;;
7)
	notification ;
	mpv --shuffle --vid=no "https://youtube.com/playlist?list=PluAX9t_8FM4N6Xà734xskvFyF2lRIoLky"
	return
	;;
8)
	notification ;
	mpv "https://play.streamafrica.net/lofiradio"
	return
	;;
9)
	notification ;
	mpv --shuffle --vid=no "https://youtube.com/playlist?list=PLlUi-WH71EJHu4gTzxamPT-I1d3SPE1L1"  
	return
	;;
a)
	notification ;
	mpv --shuffle --vid=no "https://www.youtube.com/playlist?list=PLNGyppABYvboDVHOEeLsw2yJIPbcWcRFQ"
	return
	;;

esac
}

pkill -f http && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/music.png" "Online Music stopped" || main
