#!/bin/bash

# Define the list of programs to install
programs=(
    git
    neofetch
    htop
)
# Define the list of selected programs
selected_programs=()

# go through each program, ask if it should be installed and add it to the selected programs
for program in "${programs[@]}"; do
      while true; do
          read -p "Install $programs? [y/n] " yn
          case $yn in
              [Yy]* ) selected_programs+=("$programs"); break;;
              [Nn]* ) break;;
              * ) echo "Enter 'y' or 'n'!"; break;;
          esac
      done
done

sudo dnf install -y "${selected_programs[@]}"
