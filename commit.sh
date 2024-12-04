#!/bin/bash

read -p "Commit description: " desc

$CWD=$(pwd)
cd ~/.dotfiles

brew bundle dump --force

if [[ -n $(git status --porcelain) ]]; then
    echo "Config changes detected, preparing to commit."

    git submodule update --recursive --remote
    git add .
    git commit -m "$desc"
    git push origin main

    echo "Pushed changes"
fi

cd ${CWD}
