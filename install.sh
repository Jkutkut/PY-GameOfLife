clear;
echo "
  ___    __    __  __  ____    _____  ____    __    ____  ____  ____ 
 / __)  /__\  (  \/  )( ___)  (  _  )( ___)  (  )  (_  _)( ___)( ___)
( (_-. /(__)\  )    (  )__)    )(_)(  )__)    )(__  _)(_  )__)  )__) 
 \___/(__)(__)(_/\/\_)(____)  (_____)(__)    (____)(____)(__)  (____)
 
Made by Jkutkut
See more at https://github.com/Jkutkut

Instalation will begin shortly.
-Making sure that Python3 and the libraries needed are installed";

echo "-Checking Python3:" &&
sudo apt install python3 &&
echo "-Checking pip3:" &&
sudo apt install python3-pip &&
echo "-Checking pygame:" &&
sudo pip3 install pygame &&
echo "-Checking numpy:" &&
sudo pip3 install numpy ||
(echo "
~~~~~~~~    ERROR AT INSTALLATION   ~~~~~~~~
    Please check README.md
" && exit 1) #if error, exit



echo "-------------------------------------------

All things needed are correctly installed. Now installing the application.
" &&
echo "-Creating icon for the app" &&
sudo cp gameOfLife.png /usr/share/icons/ && # move the icon to the correct dir

echo "-Creating executable" &&
sudo cp gameOfLife.py /usr/bin/gameOfLife && # move the python code
sudo chmod 755 /usr/bin/gameOfLife && # make it able to be executed

echo "-Creating Desktop Entry" &&
echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Game of Life
Comment=Made by Jkutkut
Exec=gameOfLife
Icon=/usr/share/icons/gameOfLife.png
Terminal=false" >> gameOfLife.desktop && # create the .desktop file

sudo mv gameOfLife.desktop /usr/share/applications/ &&
echo "
Installation ended.
Game of Life installed correctly" ||

echo "
~~~~~~~~    ERROR AT INSTALLATION   ~~~~~~~~
    Not able to install the game.
" #if error, exit
