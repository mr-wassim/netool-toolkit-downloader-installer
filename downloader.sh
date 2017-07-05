#!/bin/sh
###
#
# -=[netool toolkit downloader/installer]=-
# Author: r00t-3xp10it -> peterubuntu10[at]sourceforge[dot]net
# Project -> https://sourceforge.net/projects/netoolsh/
# ------------------------------------------------------------
# This script will download the correct toolkit for your OS
# using my GIT (dev-only repository), or using my STABLE repo,
# and will install it under: Kali, Ubuntu, Debian, Parrot, BackBox,
# Lubuntu, Xubuntu, Kubuntu "more distros will be added in the future".
# ------------------------------------------------------------
# Save file as: downloader.sh
# Set privs   : chmod +x downloader.sh
# run script  : ./downloader.sh
#
###


# ----------------------------------------
# Variable declarations
########################################################################################
H0m3=`echo ~`                              # local user Home path                      # 
OS=`awk '{print $1}' /etc/issue`           # grab Operative System distro              #
rpath="$H0m3/opensource"                   # toolkit correct directory (default)       #
wEr3=`pwd`                                 # current path of downloader.sh             #
########################################################################################


# ----------------------------------------
# Colorise shell Script output leters
# ----------------------------------------
Colors() {
Escape="\033";
white="${Escape}[0m";
RedF="${Escape}[31m";
GreenF="${Escape}[32m";
YellowF="${Escape}[33m";
BlueF="${Escape}[34m";
CyanF="${Escape}[36m";
Reset="${Escape}[0m";
}





# ----------------------------------
# bash trap ctrl-c and call ctrl_c()
# ----------------------------------
trap ctrl_c INT
ctrl_c() {
Colors;
   echo ${RedF}[x]${YellowF} You have pressed ${RedF}[CTRL+C] ${Reset};
   echo ${RedF}[x]${YellowF} Please Wait, cleanning ... ${Reset};
   sleep 2
   cd /tmp && rm *.sh > /dev/null 2>&1
   rm *.txt > /dev/null 2>&1
exit
}



# collecting some info about repository's available 
cd /tmp && wget -qq https://dl.dropboxusercontent.com/u/21426454/netool-kali/update2.txt
G1T=`cat /tmp/update2.txt | egrep -m 1 "V3rs10n:" | cut -d ':' -f2` > /dev/null 2>&1
ST4BL3=`cat /tmp/update2.txt | egrep -m 1 "ST4bL3:" | cut -d ':' -f2` > /dev/null 2>&1
cd $H0m3



Colors;
# ----------------------------
# installer banner display
# ----------------------------
cat << !
 
     ┌┐┌┌─┐┌┬┐  ┌┬┐┌─┐┌─┐┬  ┌─┐
     │││├┤  │    │ │ ││ ││  └─┐
     ┘└┘└─┘ ┴    ┴ └─┘└─┘┴─┘└─┘ (universal)
 +---------------------------------------------+
 |    Downloader/Installer by: r00t-3xp10it    |
 +---------------------------------------------+
 |  Script to quickly 'download' and 'install' |
 |  the correct version of toolkit in your OS. |
 |                     ---                     |
 |  this script will allow you to download the |
 |   toolkit from STABLE repository (bug free) |
 |   or from GIT repository (not-stable-beta). |
 +---------------------------------------------+
!
Colors;
echo ${white} '|'_STABLE REPO:${GreenF}$ST4BL3   ${white}GIT REPO:${GreenF}$G1T${Reset};
echo "" && echo ""
echo ${RedF}_${Reset};
echo ${BlueF}['>'][ PRESS${GreenF} ENTER ${BlueF}TO DOWNLOAD TOOLKIT ]${Reset};
echo ${BlueF}['>'][ PRESS${YellowF} CTRL+C ${BlueF}TO ABORT TASKS ]${Reset};
read op
echo ${BlueF}[+][ distro download ${YellowF}'->'${GreenF} $OS ${BlueF}]${Reset};
sleep 1
echo ${BlueF}[+][ clonning into ${YellowF}'->'${GreenF} $rpath ${BlueF}]${Reset};
sleep 1


  # check if opensource folder exists
  if [ -d $rpath ]; then
    echo ${RedF}[x][ abort clonninig repository, folder allready exists ]${Reset};
    zenity --info --title="ABORT CLONNING REPOSITORY" --text "the toolkit was [ NOT ] downloaded.\nfolder allready exists.\n\nIf you wish to update, then delete opensource folder and run this script again." --width 400 > /dev/null 2>&1
    exit
  else
    echo "good" > /dev/null 2>&1
fi





# -----------------------------------------
# check if compatible OS distro (node name)
# -----------------------------------------
if [ "$OS" "=" "Kali" ]; then
m0D=$(zenity --list --title "CHOSE REPOSITORY" --text "Download toolkit from:" --radiolist --column "Pick" --column "Option" TRUE "STABLE REPOSITORY (bug free $ST4BL3)" FALSE "GIT REPOSITORY (under develop $G1T)" --width 330 --height 180) > /dev/null 2>&1

      if [ "$m0D" = "STABLE REPOSITORY (bug free $ST4BL3)" ]; then
        cd $H0m3 && wget https://sourceforge.net/projects/netoolsh/files/opensource%5Bkali%5D.tar.gz
        tar -xf opensource[kali].tar.gz
        echo ${BlueF}[+][${GreenF} download completed, running installer ${BlueF}]${Reset};
        echo ""
        cd opensource && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

      elif [ "$m0D" = "GIT REPOSITORY (under develop $G1T)" ]; then
        cd $H0m3 && git clone git://git.code.sf.net/p/netoolsh/opensource-kali opensource
        echo ${BlueF}[+][${GreenF} clonning completed, running installer ${BlueF}]${Reset};
        echo ""
        cd opensource && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

   else
     echo ${RedF}[x][ABORTED][${YellowF} QUIT ${RedF}] ${Reset};
     rm $wEr3/downloader.sh > /dev/null 2>&1
     rm /tmp/update2.txt > /dev/null 2>&1
     sleep 2
     exit
fi





  elif [ "$OS" "=" "Ubuntu" ]; then
    m0D=$(zenity --list --title "CHOSE REPOSITORY" --text "Download toolkit from:" --radiolist --column "Pick" --column "Option" TRUE "STABLE REPOSITORY (bug free $ST4BL3)" FALSE "GIT REPOSITORY (under develop $G1T)" --width 330 --height 180) > /dev/null 2>&1

      if [ "$m0D" = "STABLE REPOSITORY (bug free $ST4BL3)" ]; then
        cd $H0m3 && wget https://sourceforge.net/projects/netoolsh/files/opensource.tar.gz
        tar -xf opensource.tar.gz
        echo ${BlueF}[+][${GreenF} download completed, running installer ${BlueF}]${Reset}
        echo ""
        cd opensource && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

      elif [ "$m0D" = "GIT REPOSITORY (under develop $G1T)" ]; then
        cd $H0m3 && git clone git://git.code.sf.net/p/netoolsh/opensource opensource
        echo ${BlueF}[+][${GreenF} clonning completed, running installer ${BlueF}]${Reset};
        echo ""
        cd opensource && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

   else
     echo ${RedF}[x][ABORTED][${YellowF} QUIT ${RedF}] ${Reset};
     rm $wEr3/downloader.sh > /dev/null 2>&1
     rm /tmp/update2.txt > /dev/null 2>&1
     sleep 2
     exit
fi




  elif [ "$OS" "=" "BackBox" ]; then
  m0D=$(zenity --list --title "CHOSE REPOSITORY" --text "Download toolkit from:" --radiolist --column "Pick" --column "Option" TRUE "STABLE REPOSITORY (bug free $ST4BL3)" FALSE "GIT REPOSITORY (under develop $G1T)" --width 330 --height 180) > /dev/null 2>&1

      if [ "$m0D" = "STABLE REPOSITORY (bug free $ST4BL3)" ]; then
        cd $H0m3 && wget https://sourceforge.net/projects/netoolsh/files/opensource.tar.gz
        tar -xf opensource.tar.gz
        zenity --info --title="REMARK" --text "netool toolkit it was build to work on Ubuntu or Kali,\nThis downloader will replace the original 'installer' by\none universal installer to be hable to run it on BackBox\nRemenber to edit 'toolkit_config' file to input the correct paths to toolkit dependencies." --width 460 > /dev/null 2>&1
        # Special thanks to 'milton@barra' for checking dependencies paths on backbox distro
        echo ${BlueF}[+][${GreenF} all files downloaded, running installer ${BlueF}]${Reset};
        echo ""
        cd opensource && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

      elif [ "$m0D" = "GIT REPOSITORY (under develop $G1T)" ]; then
        cd $H0m3 && git clone git://git.code.sf.net/p/netoolsh/opensource opensource
        zenity --info --title="REMARK" --text "netool toolkit it was build to work on Ubuntu or Kali,\nThis downloader will replace the original 'installer' by\none universal installer to be hable to run it on BackBox\nRemenber to edit 'toolkit_config' file to input the correct paths to toolkit dependencies." --width 460 > /dev/null 2>&1
        # Special thanks to 'milton@barra' for checking dependencies paths on backbox distro
        echo ${BlueF}[+][${GreenF} all files downloaded, running installer ${BlueF}]${Reset};
        echo ""
        cd opensource && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

      else
      echo ${RedF}[x][ABORTED][${YellowF} QUIT ${RedF}] ${Reset};
      rm $wEr3/downloader.sh > /dev/null 2>&1
      rm /tmp/update2.txt > /dev/null 2>&1
      sleep 2
      exit
      fi





  elif [ "$OS" "=" "Debian" ] || [ "$OS" "=" "Parrot" ]; then
  m0D=$(zenity --list --title "CHOSE REPOSITORY" --text "Download toolkit from:" --radiolist --column "Pick" --column "Option" TRUE "STABLE REPOSITORY (bug free $ST4BL3)" FALSE "GIT REPOSITORY (under develop $G1T)" --width 330 --height 180) > /dev/null 2>&1

      if [ "$m0D" = "STABLE REPOSITORY (bug free $ST4BL3)" ]; then
        cd $H0m3 && wget https://sourceforge.net/projects/netoolsh/files/opensource%5Bkali%5D.tar.gz
        tar -xf opensource[kali].tar.gz
        # Special thanks to '????' for checking dependencies paths on debian/parrot distros
        cd /tmp && wget https://dl.dropboxusercontent.com/u/21426454/netool-kali/INSTALL.sh
        zenity --info --title="REMARK" --text "netool toolkit it was build to work on Ubuntu or Kali,\nThis downloader will replace the original 'installer' by\none universal installer to be hable to run it on $OS\nRemenber to edit 'toolkit_config' file to input the correct paths to toolkit dependencies." --width 460 > /dev/null 2>&1
        echo ${BlueF}[+][${GreenF} all files downloaded, running installer ${BlueF}]${Reset};
        echo ""
        sed "s|node='Parrot'|node='$OS'|g" INSTALL.sh > copy.int
        mv -f /tmp/copy.int $rpath/INSTALL.sh > /dev/null 2<&1
        cd $rpath && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/INSTALL.sh > /dev/null 2<&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

      elif [ "$m0D" = "GIT REPOSITORY (under develop $G1T)" ]; then
        cd $H0m3 && git clone git://git.code.sf.net/p/netoolsh/opensource-kali opensource
        # Special thanks to '????' for checking dependencies paths on debian/parrot distros
        cd /tmp && wget https://dl.dropboxusercontent.com/u/21426454/netool-kali/INSTALL.sh
        zenity --info --title="REMARK" --text "netool toolkit it was build to work on Ubuntu or Kali,\nThis downloader will replace the original 'installer' by\none universal installer to be hable to run it on $OS\nRemenber to edit 'toolkit_config' file to input the correct paths to toolkit dependencies." --width 460 > /dev/null 2>&1
        echo ${BlueF}[+][${GreenF} all files downloaded, running installer ${BlueF}]${Reset};
        echo ""
        sed "s|node='Parrot'|node='$OS'|g" INSTALL.sh > copy.int
        mv -f /tmp/copy.int $rpath/INSTALL.sh > /dev/null 2<&1
        cd $rpath && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/INSTALL.sh > /dev/null 2<&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

   else
     echo ${RedF}[x][ABORTED][${YellowF} QUIT ${RedF}] ${Reset};
     rm $wEr3/downloader.sh > /dev/null 2>&1
     rm /tmp/update2.txt > /dev/null 2>&1
     sleep 2
     exit
fi



  elif [ "$OS" "=" "Lubuntu" ] || [ "$OS" "=" "Xubuntu" ] || [ "$OS" "=" "Kubuntu" ]; then
  m0D=$(zenity --list --title "CHOSE REPOSITORY" --text "Download toolkit from:" --radiolist --column "Pick" --column "Option" TRUE "STABLE REPOSITORY (bug free $ST4BL3)" FALSE "GIT REPOSITORY (under develop $G1T)" --width 330 --height 180) > /dev/null 2>&1

      if [ "$m0D" = "STABLE REPOSITORY (bug free $ST4BL3)" ]; then
        cd $H0m3 && wget https://sourceforge.net/projects/netoolsh/files/opensource.tar.gz
        tar -xf opensource.tar.gz
        cd /tmp && wget https://dl.dropboxusercontent.com/u/21426454/netool-kali/INSTALL.sh
        zenity --info --title="REMARK" --text "netool toolkit it was build to work on Ubuntu or Kali,\nThis downloader will replace the original 'installer' by\none universal installer to be hable to run it on $OS\nRemenber to edit 'toolkit_config' file to input the correct paths to toolkit dependencies." --width 460 > /dev/null 2>&1
        echo ${BlueF}[+][${GreenF} all files downloaded, running installer ${BlueF}]${Reset};
        echo ""
        sed "s|node='Parrot'|node='$OS'|g" INSTALL.sh > copy.int
        mv -f /tmp/copy.int $rpath/INSTALL.sh > /dev/null 2<&1
        cd $rpath && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/INSTALL.sh > /dev/null 2<&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

      elif [ "$m0D" = "GIT REPOSITORY (under develop $G1T)" ]; then
        cd $H0m3 && git clone git://git.code.sf.net/p/netoolsh/opensource opensource
        cd /tmp && wget https://dl.dropboxusercontent.com/u/21426454/netool-kali/INSTALL.sh
        zenity --info --title="REMARK" --text "netool toolkit it was build to work on Ubuntu or Kali,\nThis downloader will replace the original 'installer' by\none universal installer to be hable to run it on $OS\nRemenber to edit 'toolkit_config' file to input the correct paths to toolkit dependencies." --width 460 > /dev/null 2>&1
        echo ${BlueF}[+][${GreenF} all files downloaded, running installer ${BlueF}]${Reset};
        echo ""
        sed "s|node='Parrot'|node='$OS'|g" INSTALL.sh > copy.int
        mv -f /tmp/copy.int $rpath/INSTALL.sh > /dev/null 2<&1
        cd $rpath && chmod +x INSTALL.sh && ./INSTALL.sh
        rm $wEr3/downloader.sh > /dev/null 2>&1
        rm /tmp/INSTALL.sh > /dev/null 2<&1
        rm /tmp/update2.txt > /dev/null 2>&1
        exit

   else
     echo ${RedF}[x][ABORTED][${YellowF} QUIT ${RedF}] ${Reset};
     rm $wEr3/downloader.sh > /dev/null 2>&1
     rm /tmp/update2.txt > /dev/null 2>&1
     sleep 2
     exit
fi


else


Colors;
# --------------------------------------------------------------------
# fail comparing toolkit version to current installed Operative System
# --------------------------------------------------------------------
echo ${RedF}[x]${BlueF}[Supported OS][${RedF} FAIL ${BlueF}]${Reset};
echo ${RedF}[x]${BlueF}[Supported OS ${YellowF} '->'${BlueF} Kali, Ubuntu, BackBox, Lubuntu, Xubuntu, Kubuntu, Debian, Parrot ${BlueF}]${Reset};
sleep 2

QuE=$(zenity ---question --title="T00LKIT DOWNLOADER/INSTALLER" --text "report issue to my project webpage?" --width 350) > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
 xdg-open "https://sourceforge.net/p/netoolsh/discussion/general/thread/928a3086/?limit=25#0214/cc81" > /dev/null 2>&1
 rm /tmp/update2.txt > /dev/null 2>&1
else
 rm /tmp/update2.txt > /dev/null 2>&1
fi

exit
fi
