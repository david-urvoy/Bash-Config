#!/bin/zsh

echo ">> Installing VNC"

sudo apt update -y;
sudo apt install -y xfce4 xfce4-goodies tightvncserver;
echo "
/!\\ ============================================================ /!\\
For VNC, you will have to enter a password with 8 characters length
/!\\ ============================================================ /!\\
";

vncserver;

vncserver -kill :1;
mv $HOME/.vnc/xstartup $HOME/.vnc/xstartup.bak;

echo "#!/bin/zsh
xrdb $HOME/.Xresources
startxfce4 &" >> $HOME/.vnc/xstartup;

sudo chmod +x $HOME/.vnc/xstartup;

echo ">> VNC is now installed. Run 'vncserver' to start a new session. Run 'vncserver -kill :1' to kill it";

