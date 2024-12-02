My dotfiles and a simple bash script that installs my [Homebrew](https://brew.sh) packages.

## Dependencies
1. macOS
2. `GNU stow` (tho `./brew.sh` script installs it automatically)
3. `crontab`
4. `brew`
5. [Oh My Zsh](https://ohmyz.sh/)

## Installment & usage
1. Copy the repo (`git clone --recursive https://github.com/botantony/dotfiles-mac.git`)
2. Use `brew bundle install` and `stow .`
3. (optional) Run `./auto.sh` to do automatic commits to `auto-load` branch

Before commiting new version run `brew bundle dump --force` and `git submodule update --recursive --remote`.
