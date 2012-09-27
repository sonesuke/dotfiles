# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cypher"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gvim="open -a /Applications/MacVim.app"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/sonesuke/.pythonbrew/bin:/Users/sonesuke/.pythonbrew/pythons/Python-2.7.2/bin:/Users/sonesuke/Library/Haskell/bin:/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/sbin/:/Library/Frameworks/Python.framework/Versions/Current/bin:/Users/sonesuke/.rvm/bin

# settings
PATH_ROOT="$PYTHONBREW_ROOT"
if [ -z "${PATH_ROOT}" ] ; then
    PATH_ROOT="$HOME/.pythonbrew"
fi
PATH_ETC="$PATH_ROOT/etc"

PATH_HOME="$PYTHONBREW_HOME"
if [ -z "${PATH_HOME}" ] ; then
    PATH_HOME="$HOME/.pythonbrew"
fi
PATH_HOME_ETC="$PATH_HOME/etc"

# py file
PY_PYTHONBREW="$PATH_ROOT/bin/pythonbrew"

# functions
__pythonbrew_set_default()
{
    PATH_PYTHONBREW="$PATH_ROOT/bin"
    PATH_PYTHONBREW_LIB="$PATH_ROOT/lib"
}

__pythonbrew_set_path()
{
    PATH_WITHOUT_PYTHONBREW=$(printf "$PATH" | awk -v RS=: -v ORS=: "/${PATH_ROOT//\//\/}/ {next} {print}" | sed -e 's#:$##')
    export PATH=$PATH_PYTHONBREW:$PATH_WITHOUT_PYTHONBREW
    export PYTHONPATH=$PATH_PYTHONBREW_LIB
}

__pythonbrew_set_temp_path()
{
    if [[ -s "$PATH_HOME_ETC/temp" ]] ; then
        source "$PATH_HOME_ETC/temp"
        PATH_PYTHONBREW="$PATH_ROOT/bin:$PATH_PYTHONBREW_TEMP"
        PATH_PYTHONBREW_LIB="$PATH_PYTHONBREW_TEMP_LIB"
    else
        __pythonbrew_set_default
    fi
    __pythonbrew_set_path
}

__pythonbrew_set_current_path()
{
    if [[ -s "$PATH_HOME_ETC/current" ]] ; then
        source "$PATH_HOME_ETC/current"
        PATH_PYTHONBREW="$PATH_ROOT/bin:$PATH_PYTHONBREW_CURRENT"
        PATH_PYTHONBREW_LIB="$PATH_PYTHONBREW_CURRENT_LIB"
    else
        __pythonbrew_set_default
    fi
    __pythonbrew_set_path
}

__pythonbrew_reload()
{
    [[ -s "$PATH_ETC/bashrc" ]] && source "$PATH_ETC/bashrc"
}

__pythonbrew_use()
{
    [[ $? == 0 ]] && __pythonbrew_set_temp_path
}

__pythonbrew_switch()
{
    [[ $? == 0 ]] && __pythonbrew_set_current_path
}

__pythonbrew_off()
{
    [[ $? == 0 ]] && __pythonbrew_set_current_path
}

__pythonbrew_update()
{
    [[ $? == 0 ]] && __pythonbrew_reload
}

__pythonbrew_venv()
{
    if [[ $? == 0 ]] ; then
        if [[ -s "$PATH_HOME_ETC/venv.run" ]] ; then
            source "$PATH_HOME_ETC/venv.run"
            cat /dev/null > "$PATH_HOME_ETC/venv.run"
        fi
    fi
}

__pythonbrew_find_command()
{
    command_name=""
    for arg in "$@" ; do
        case $arg in
            --*) continue;;
            -*) continue;;
            *)
            command_name=$arg
            break
            ;;
        esac
    done
}

__pythonbrew_run()
{
    __pythonbrew_find_command "$@"
    "$pythonbrew" "$@"
    case $command_name in
        use) __pythonbrew_use "$@";;
        switch) __pythonbrew_switch "$@" ;;
        off) __pythonbrew_off "$@" ;;
        update) __pythonbrew_update "$@" ;;
        venv) __pythonbrew_venv "$@" ;;
    esac
    builtin hash -r
}

pythonbrew()
{
    pythonbrew=$PY_PYTHONBREW
    __pythonbrew_run "$@"
}

pybrew()
{
    pythonbrew "$@"
}

sudopybrew()
{
    pythonbrew="sudo PYTHONBREW_ROOT=$PATH_ROOT PATH=$PATH_PYTHONBREW:$PATH_WITHOUT_PYTHONBREW $PY_PYTHONBREW"
    __pythonbrew_run "$@"
}

# main
__pythonbrew_set_current_path
