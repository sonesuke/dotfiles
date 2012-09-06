brew install fontforge
mkdir $HOME/tmp
cd $HOME/tmp
curl -L -o $HOME/tmp/Inconsolata.otf http://levien.com/type/myfonts/Inconsolata.otf
curl -L -o $HOME/tmp/3.2.0.zip https://github.com/yascentur/Ricty/zipball/3.2.0
curl -L -o $HOME/tmp/migu-1m-20120411-2.zip "http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F56156%2Fmigu-1m-20120411-2.zip"
unzip $HOME/tmp/3.2.0.zip
unzip $HOME/tmp/migu-1m-20120411-2.zip
cp $HOME/tmp/Inconsolata.otf $HOME/tmp/yascentur-Ricty-b9d8b9c/
cp $HOME/tmp/migu-1m-20120411-2/*.ttf $HOME/tmp/yascentur-Ricty-b9d8b9c/
$HOME/tmp/yascentur-Ricty-b9d8b9c/ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf
cp $HOME/tmp/yascentur-Ricty-b9d8b9c/Ricty*.ttf /Library/Fonts/
