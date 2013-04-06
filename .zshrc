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

# keymap like vim
bindkey -v

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


# google by w3m
function go() {
local str opt
if [ $ != 0 ]; then
	for i in $*; do
		str="$str+$i"
	done
	str=`echo $str | sed 's/^\+//'`
	opt='search?num=50&hl=ja&lr=lang_ja'
	opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}

# alc by w3m
function alc() {
if [ $ != 0 ]; then
      w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
else
      w3m "http://www.alc.co.jp/"
fi
}

# move directory without cd
setopt auto_cd

# search command history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
