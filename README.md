My dotfiles.

## Dependencies
1. macOS
2. [`brew`](https://brew.sh)
3. `GNU stow` (tho `brew bundle install` script installs it automatically)
4. `crontab`
5. [Oh My Zsh](https://ohmyz.sh/)

## Installment & usage
1. Copy the repo (`git clone --recursive https://github.com/botantony/dotfiles-mac.git`)
2. Use `brew bundle install` and `stow .`
3. (optional) Run `./auto.sh` to do automatic commits to `auto-load` branch

Before commiting new version run `brew bundle dump --force` (or just use `commit.sh` script).
