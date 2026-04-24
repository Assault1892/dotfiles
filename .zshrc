# === OTHER === #

zstyle ":completion:*:commands" rehash 1
ZLE_REMOVE_SUFFIX_CHARS=$''

# === ENVIRONMENT VARIABLES === #

export EDITOR="vim"

# === ALIAS === #

alias python="python3"
alias ls="ls -l"
alias la="ls -ahl"
alias vim="nvim"

# === PATH === #

typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

# === ZSH COMPLETIONS AND AUTO SUGGESTIONS === #

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

# === IMPROVE ZSH OUTPUT === #

source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh

git_prompt() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    PROMPT="%F{green}%n%f@%F{green}%m%f %F{cyan}($(arch))%f: %F{blue}%~%f $(git_super_status)"$'\n'"%# "
  else
    PROMPT="%F{green}%n%f@%F{green}%m%f %F{cyan}($(arch))%f: %F{blue}%~%f "$'\n'"%# "
  fi
}

add_newline() {
  if [[ -z $PS1_NEWLINE_LOGIN ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}

precmd() {
  git_prompt
  add_newline
}
