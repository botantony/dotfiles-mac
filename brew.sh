#!/bin/bash

if ! command -v brew &>/dev/null; then
    echo "Install Homebrew first!"
    exit 1
fi

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed!"
    exit 1
fi

CASKS_FILE="casks.txt"
FORMULAE_FILE="formulae.txt"

generate_files() {
    echo "Generating $CASKS_FILE and $FORMULAE_FILE..."

    brew list --casks > "$CASKS_FILE"
    echo "Casks saved to $CASKS_FILE."

    brew list --formulae > "$FORMULAE_FILE"
    echo "Formulae saved to $FORMULAE_FILE."
}

install_packages() {
    if [[ ! -f "$CASKS_FILE" || ! -f "$FORMULAE_FILE" ]]; then
        echo "Error: $CASKS_FILE and/or $FORMULAE_FILE not found. Run the script with --gen first."
        exit 1
    fi

    echo "Installing packages from $CASKS_FILE and $FORMULAE_FILE..."

    while IFS= read -r cask; do
        if [[ -n "$cask" ]]; then
            brew install --cask "$cask"
        fi
    done < "$CASKS_FILE"

    while IFS= read -r formula; do
        if [[ -n "$formula" ]]; then
            brew install "$formula"
        fi
    done < "$FORMULAE_FILE"

    echo "Installation completed."
}

if [[ "$1" == "--gen" ]]; then
    generate_files
elif [[ "$1" == "--install" ]]; then
    install_packages
else
    echo "Usage: $0 --gen | --install"
    echo "  --gen     Generate $CASKS_FILE and $FORMULAE_FILE"
    echo "  --install Install packages listed in $CASKS_FILE and $FORMULAE_FILE"
    exit 1
fi
