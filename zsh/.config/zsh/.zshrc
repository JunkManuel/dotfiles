# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
#
# Ma lines
# -----------------------------------------------Sources--------------------------------------------
#
source ~/.config/zsh/keybinds.zshrc
# 
# -----------------------------------------------ALIASES--------------------------------------------
#
alias tree="eza --tree --icons"
alias cat="bat --style=plain --paging=never"
#
# ls aliases
#
alias ls="eza --icons"
alias la="ls -la"
alias ll="ls -l"
#
# diff-patch alias for unified fileformat
#
alias udiff="diff -Naur --color"
alias upatch="patch -uNp1"
#
# ssh aliases
#
# alias ssh="env TERM=xterm-256color ssh"
if command -v kitten >&/dev/null && [ "$TERM" = "xterm-kitty" ]
then
	alias ssh="kitten ssh"
fi
#
# Kitty aliases
#
alias icat="kitty icat"
#
# ----------------------------------------------PROMPT-THEMING--------------------------------------
#
# Load promp theming module
#
autoload -Uz promptinit && promptinit
#prompt adam2 8bit blue green red
prompt pure
#
# Load version control info (git)
#
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats ' %s(%b)' # git(main)
#
# ----------------------------------------------COMPITNIT-------------------------------------------
#
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump

zstyle ':completion:*' menu select # enable menu driven interface
zstyle ':completion::complete:*' gain-privileges 1 # enable sudo completitions
#
# -----------------------------------------------Fish-like-SYNTAX-----------------------------------
#
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#
# -----------------------------------------------FIXES----------------------------------------------
#
stty icrnl # Enter inputs ^M instead of newline on ssh
