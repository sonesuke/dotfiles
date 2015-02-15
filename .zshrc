source $HOME/.zsh/antigen/antigen.zsh

antigen-bundle sindresorhus/pure.git
antigen-bundle zsh-users/zaw.git
antigen-bundle zsh-users/zsh-completions.git
antigen-bundle Tarrasch/zsh-bd

# Tell antigen that you're done.
antigen-apply

# keymap like vim
bindkey -v

# pure
PURE_DEFAULT_USERNAME='sonesuke'
autoload -U promptinit && promptinit
prompt pure

# aliases
alias gvim="open -a /Applications/MacVim.app"
alias freecad="/Applications/FreeCAD.app/Contents/bin/FreeCADCmd"
alias tmux="tmux -u"

# pythonz
if [ -d $HOME/py33/bin/activate ]; then
	export VIRTUAL_ENV_DISABLE_PROMPT=1
	[ -s $HOME/.pythonz/etc/bashrc ] && source $HOME/.pythonz/etc/bashrc
	. py33/bin/activate
fi

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# zaw move recent dirs
source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zaw.git/zaw.zsh
bindkey '^j' zaw-cdr
bindkey '^h' zaw-history

# zsh-completions
fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src $fpath)


# alc by w3m
function alc() {
if [ $ != 0 ]; then
      w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
else
      w3m "http://www.alc.co.jp/"
fi
}

#
# move directory without cd
setopt auto_cd

# search command history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# terminal 256 color
export TERM=xterm-256color


export LD_LIBRARY_PATH=$(/usr/local/opt/llvm/bin/llvm-config --libdir):$LD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH:/usr/local/opt/llvm/lib/python2.7/site-packages/

