# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="minimal"
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
set -o vi

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
alias upd="brew upgrade && brew cleanup"
alias sort-autobump='sort -u .github/autobump.txt -o .github/autobump.txt'
alias fnvim='nvim $(fzf --preview="bat --color=always {}")'
alias n='nvim'
alias info='info --vi-keys'
alias co-author='git show --pretty=format:"Co-authored-by: %an <%ae>"'
alias gen-c-tags="find . -name '*.[ch]' -print0 | xargs -0 ctags"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export HOMEBREW_NO_ENV_HINTS=1
export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"

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
export PATH="/opt/homebrew/Library/Homebrew/vendor/portable-ruby/3.3.7/bin:$PATH"

fpath+=~/.zfunc; autoload -Uz compinit; compinit
