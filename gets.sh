sudo apt-get update
sudo apt-get install zsh 
sudo chsh -s /usr/bin/zsh

sudo apt-get install vim
sudo apt-get install git
sudo apt-get install tmux

git clone https://github.com/sonesuke/dotfiles.git 
cd dotfiles
./setup.sh

cd .vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git
cd ~

cd .zsh
git clone https://github.com/zsh-users/antigen.git
cd ~

cd ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git
sudo ln -s "$PWD/pure.zsh" /usr/share/zsh/site-functions/pure_prompt_setup
