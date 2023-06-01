export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PATH=$HOME/.nodebrew/current/bin:$PATH

eval "$(pyenv init -)"

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

alias ll="ls -la"
alias ls="ls -GF"
alias gls="gls --color"

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 色を使用
autoload -U compinit
compinit

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# vcs_infoを読み込み
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{166}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PS1="%~
%B%F{green}❯%f%F{yellow}❯%f%F{red}❯%f%b"
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

export TMUX_TMPDIR=/tmp
