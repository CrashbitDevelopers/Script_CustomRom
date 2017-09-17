#!/bin/bash
# Specify colors utilized in the terminal
normal='tput sgr0'              # Normal
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
orange='tput setaf 166'         # Orange
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldnormal=${txtbld}$(tput sgr0) # Bold normal
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldorange=$(txtbld)$(tput setaf 166) # Bold Orange
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White

clear

        echo -e "${bldred}                                 "
        echo -e "${bldred}   ----------------------------- "
        echo -e "${bldred}   |    ${bldnormal}Instalacion de codigo fuente     ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   | ${bldnormal}Descargando el codigo ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |   ${bldnormal}Configurando la computadora  ${bldred}| "
        echo -e "${bldred}   ----------------------------  "

tput setaf 2
	if [ -d ~/android/system/ ]
	then
		read -r -p "${bldred}El directorio ~/android/system/ ya existe! Desea borrarlo? [Y/n]" response
		case $response in
        	[yY][eE][sS]|[yY]) 
        	sudo rm ~/android/system/ -R
        	;;
    		*)
		echo "Instalador se esta cerrando..."
        	exit
        	;;
		esac
	fi
	mkdir -p ~/android/system/
	cd ~/android/system
	
  # Initial git config
	echo "Ingrese email de Github: "
	read input_email
	echo "Ingrese nombre de Github (Nombre cualquiera): "
	read input_user
	git config --global user.email "$input_email"
	git config --global user.name "$input_user"
clear

  # Source version selection
  echo "============================================================"
  echo " Elige tu versión....."
  echo "============================================================"
  echo 
  echo "  1 - LineageOS 13"
  echo "  2 - LineageOS 14.1"
  echo "  3 - LineageOS 15"
  echo "  4 - OmniROM 6.0.1"
  echo "  5 - OmniROM 7.1.2" 
  echo "  6 - OmniROM 8.0"
  echo "  7 - AOKP 6.0.1"
  echo "  8 - AOKP 7.1.2"
  echo "  9 - Paranoid Android Marshmallow"
  echo "  10 - Paranoid Android Nougat"
  echo
  echo -n "Ingrese una opción: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) repo init -u git://github.com/lineageos/android.git -b cm-13.0;;
      2) repo init -u git://github.com/lineageos/android.git -b cm-14.1;;
      3) repo init -u git://github.com/lineageos/android.git -b lineage-15.0;;
      4) repo init -u git://github.com/omnirom/android.git -b android-6.0;;      
      5) repo init -u git://github.com/omnirom/android.git -b android-7.1;;
      6) repo init -u git://github.com/omnirom/android.git -b android-8.0;;
      7) repo init -u git://github.com/AOKP/platform_manifest.git -b mm;;
      8) repo init -u git://github.com/AOKP/platform_manifest.git -b nougat;;
      9) repo init -u git://github.com/AOSPA/manifest.git -b marshmallow;;
      10) repo init -u git://github.com/AOSPA/manifest.git -b nougat-mr2;;
      
    esac
  fi

  # First sync
	time repo sync --force-broken --force-sync -j4
	echo  
	echo -e "${bldcya}El codigo ha sido descargado en ~/android/system"
	echo -e "${bldcya}Tu podras compilar en la ubicacion ~/android/system"
	echo -e "${bldcya}Recuerda aplicar el comando ${bldgrn}ccache -M 40 ${bldcya}para poder compilar por primera vez" 
	cp ~/android/system/.repo/repo /usr/bin/repo 2>/dev/null
	mkdir ~/android/system/.repo/local_manifests 2>/dev/null
        echo -e "${bldorange}   -------------------------------------------------- "
        echo -e "${bldorange}   |   ${txtund}No olvides descargar el codigo fuente de     | "
        echo -e "${bldorange}   |                                                | "
        echo -e "${bldorange}   |       ${txtund}tu dispositivo antes de compilar.        | "
        echo -e "${bldorange}   |                                                | "
        echo -e "${bldorange}   -------------------------------------------------- "
exit
