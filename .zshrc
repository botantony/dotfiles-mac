export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="minimal"
# ZSH_THEME="refined"
ZSH_THEME="awesomepanda"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Unalias OMZ's bs
unalias -m '*'

set -o vi
set -o ignoreeof

export EDITOR="nvim"
export VISUAL="nvim"

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

source <(fzf --zsh)

# useful aliases and functions
function test-formula() {
  echo -e "\e[1;31m==>\e[0m brew install $1"
  HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --include-test --verbose --formula $1
  echo -e "\e[1;31m==>\e[0m brew test $1"
  brew test --verbose $1
  echo -e "\e[1;31m==>\e[0m brew audit --new $1"
  brew audit --strict --online --new --formula $1
}
function test-cask() {
  echo -e "\e[1;31m==>\e[0m brew install $1"
  HOMEBREW_NO_INSTALL_FROM_API=1 brew install --verbose --cask $1
  echo -e "\e[1;31m==>\e[0m brew audit --new $1"
  brew audit --strict --online --new --cask $1
}
function vman() {
  nvim -c "Man $1 $2" -c 'silent only'
}
alias reload="source ~/.zshrc"
alias upd="brew update && brew upgrade"
alias fnvim='nvim $(fzf --preview="bat --color=always {}")'
alias n='nvim'
alias c="clear && clear"
alias info='info --vi-keys'
alias co-author='git show --pretty=format:"Co-authored-by: %an <%ae>"'
alias gen-c-tags="find . -name '*.[ch]' -print0 | xargs -0 ctags"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_FROM_API=1

# Created by `pipx` on 2024-11-17 18:49:35
export PATH="$PATH:/$HOME/.local/bin"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/${HOME}/.opam/opam-init/init.zsh' ]] || source '/${HOME}/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

export GPG_TTY=$(tty)

export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

source ~/.secrets
export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$HOMEBREW_PREFIX/lib/ruby/gems/4.0.0/bin:/opt/homebrew/opt/openjdk/bin:$HOME/opt/bin:$PATH"

HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
  source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER";
fi
