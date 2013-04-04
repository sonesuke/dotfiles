source $HOME/.zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle osx
antigen-bundle brew
antigen-bundle pip
antigen-bundle command-not-found

antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zaw.git
antigen-bundle zsh-users/zsh-completions.git

# Load the theme.
antigen-theme cypher

# Tell antigen that you're done.
antigen-apply

# aliases
alias gvim="open -a /Applications/MacVim.app"

# pythonz
[ -s $HOME/.pythonz/etc/bashrc ] && source $HOME/.pythonz/etc/bashrc
. py33/bin/activate

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# zaw move recent dirs
source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zaw.git/zaw.zsh
bindkey '^h' zaw-cdr # CTRL-h

# zsh-completions
fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src $fpath)


