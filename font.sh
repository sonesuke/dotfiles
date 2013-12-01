
sudo apt-get install fontforge
sudo apt-get install python-fontforge
git clone https://github.com/yascentur/Ricty.git
cd Ricty
wget http://levien.com/type/myfonts/Inconsolata.otf
wget "http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F57240%2Fmigu-1m-20121030.zip"
mv "redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F57240%2Fmigu-1m-20121030.zip" migu-1m-20121030.zip
unzip migu-1m-20121030.zip
mv ./migu-1m-20121030/migu-1m-bold.ttf .
mv ./migu-1m-20121030/migu-1m-regular.ttf .		
sh ricty_generator.sh auto
sudo mkdir /usr/share/fonts/truetype/Ricty

git clone https://github.com/Lokaltog/vim-powerline
python ./vim-powerline/fontpatcher/fontpatcher Ricty-Bold.ttf
python ./vim-powerline/fontpatcher/fontpatcher RictyDiscord-Bold.ttf
sudo cp ./*.ttf /usr/share/fonts/truetype/Ricty
sudo fc-cache -vf
