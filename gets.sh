sudo apt-get update
sudo apt-get install zsh 
sudo chsh -s /usr/bin/zsh

sudo apt-get install vim
sudo apt-get install git
sudo apt-get install tmux
sudo apt-get install w3m
sudo apt-get install ctags

./setup.sh
cd ~

# install iconv 
wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.1.tar.gz
wget http://www2d.biglobe.ne.jp/~msyk/software/libiconv/libiconv-1.13-ja-1.patch.gz
tar -zxvf libiconv-1.13.1.tar.gz
cd libiconv-1.13.1
gzip -dc ../libiconv-1.13-ja-1.patch.gz | patch -p1
./configure
make && make check
sudo make install

# install ag
sudo apt-get install libpcre3 libpcre3-dev liblzma-dev libz-dev
git clone https://github.com/monochromegane/the_silver_searcher
cd the_silver_searcher
git checkout detect-japanese-char-set
./build.sh
sudo make install

cd ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git
sudo mkdir /usr/local/share/zsh/site-functions/:w
sudo ln -s "$PWD/pure.zsh" /usr/local/share/zsh/site-functions/pure_prompt_setup

sudo apt-get install ruby
sudo apt-get install ruby-dev
sudo gem install slideshow
