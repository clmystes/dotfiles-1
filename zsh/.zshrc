# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"

# agnoster handle git sync and becomes condiferably slow.
# ZSH_THEME="agnoster"

# similar but not: https://github.com/sindresorhus/pure
ZSH_THEME="refined-lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# plugins=(zsh-autosuggestions)

# https://github.com/zsh-users/zsh-completions
# plugins=(zsh-completions)

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# source ~/.oh-my-zsh/plugins/incr/incr*.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#####################################
# alias
#####################################

alias sml='rlwrap sml'
alias uscheme='rlwrap uscheme'
alias scheme='rlwrap scheme'

alias mlre='pbpaste | refmt --parse ml --print re | pbcopy'
alias reml='pbpaste | refmt --parse re --print ml | pbcopy'
alias prtop='pbpaste | rtop'

alias oldcaml='opam switch 4.02.3; eval `opam config env`'
alias newcaml='opam switch 4.06.0; eval `opam config env`'

# redefine prompt_context for hiding user@hostname
prompt_context () { }

# ocaml / opam
eval $(opam config env)

#####################################
# auto-fu, insta productivity boost 2
#####################################

# npm/make/brew autocompletions are super slow. Disable them so that auto-fu's
# completion doesn't trigger for these
noopt() {}
compdef noopt npm make brew
# enable completion for these commands.
# See https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org#completing-generic-gnu-commands
compdef _gnu_generic bsc bsb ocamlc yarn

# https://github.com/hchbaw/auto-fu.zsh
# Fork with cleaned-up readme:
# https://github.com/HerringtonDarkholme/auto-fu.zsh

# make sure history-substring-match is disabled (crashes window with auto-fu).
# auto-fu master currently unstable. Use the `pu` branch instead

# git clone https://github.com/HerringtonDarkholme/auto-fu.zsh ~/.auto-fu
# cd ~/.auto-fu
# git checkout pu

if [ -f ~/.auto-fu/auto-fu.zsh ]; then
  source ~/.auto-fu/auto-fu.zsh
  function zle-line-init () {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi
zstyle ':auto-fu:var' postdisplay $''
