# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export EDITOR=vi
export GDFONTPATH="$HOME/share/fonts"
export LANG=zh_TW.UTF-8

export PATH=$PATH:/home/yichung/.local/bin/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ll='ls -lh'
alias la='ls -A'
alias cls='clear && ls'
alias cp='cp -i'
alias mv='mv -i'
alias rm='_rm'
alias rrm='/bin/rm -i'	# real rm
alias vi='~/vim81/bin/vim'
alias tx='tmux attach'
alias npms='npm start'
alias yarns='yarn start'
alias cd='venv_cd'
alias txl='tmux ls'
alias ..='cd ..'
alias cs='_cs'
alias venv="_venv"
alias nv=nvidia-smi

function _ls() {
/bin/ls -C --color=always $@ | /usr/bin/iconv
}

function _cs() {
cd $1
ls
}

function _venv() {
source $HOME/.venv/$1/bin/activate
}

function _rm() {
while [ $# -ge 1 ]; do
	/bin/cp -rf "$1" $HOME/tmp
	/bin/rm -rf "$1"
	echo "$1 deleted."
	shift
done
}

function venv_cwd {
  # Check that this is a Git repo
  unset ENV_NAME
  VENV_HOME="$HOME/.venv"
  if [ -f ".venv" ]; then
    ENV_NAME=`cat ".venv"`
  fi
  if [ $ENV_NAME ]; then
    # Activate the environment only if it is not already active
    if [ "$VIRTUAL_ENV" != "$VENV_HOME/$ENV_NAME" ]; then
      if [ -e "$VENV_HOME/$ENV_NAME/bin/activate" ]; then
        . $VENV_HOME/$ENV_NAME/bin/activate && export CD_VIRTUAL_ENV="$ENV_NAME"
      fi
    fi
  elif [ $CD_VIRTUAL_ENV ]; then
    # We've just left the repo, deactivate the environment
    # Note: this only happens if the virtualenv was activated automatically
    deactivate && unset CD_VIRTUAL_ENV
  fi
}
function venv_cd {
  \cd "$@" && venv_cwd && ls
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
