#!/bin/bash

# Define the list of programs to install
programs=(
    program1
    program2
    program3
)
# Define the list of selected programs
selected_programs=()

# go through each program, ask if it should be installed and add it to the selected programs
for program in "${programs[@]}"; do
      while true; do
          read -p "Install $program? [y/n] " yn
          case $yn in
              [Yy]* ) selected_programs+=("$program"); break;;
              [Nn]* ) break;;
              * ) echo "Enter 'y' or 'n'!";;
          esac
      done
done

# Install the selected programs
sudo dnf install -y "${selected_programs[@]}"
