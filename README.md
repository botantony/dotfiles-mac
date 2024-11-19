My dotfiles and a simple bash script that installs my [Homebrew](https://brew.sh) packages.

## Dependencies
1. macOS
2. `GNU stow` (tho `./brew.sh` script installs it automatically)
3. `brew`
4. [Oh My Zsh](https://ohmyz.sh/)

## Installment & usage
1. Copy the repo (`git clone --recursive https://github.com/botantony/dotfiles-mac.git`)
2. Use `./brew.sh --install` and `stow .`

Before commiting new version run `./brew.sh --gen`.
