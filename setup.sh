cd ~
rm .vimrc
rm .gvimrc
rm .vim
rm .zshrc
rm .zsh
rm .zshenv
rm .Xresources-hybrid
rm .tmux.conf
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.vim .vim
ln -s dotfiles/.zshrc .zshrc
ln -s dotfiles/.zsh .zsh
ln -s dotfiles/.Xresources-hybrid .Xresources-hybrid
ln -s dotfiles/.tmux.conf .tmux.conf
ln -s dotfiles/.tmux .tmux
ln -s ~/dotfiles/theme-color/vim/colors/ ~/dotfiles/.vim/colors
