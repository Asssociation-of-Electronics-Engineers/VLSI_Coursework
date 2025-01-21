#!/bin/bash

# IIT Delhi Systems server 
# Designed for Ubuntu 20.04 LTS+ and potentially adaptable for IIT Delhi servers/PARAM Supercomputer.
# Maintainter: Priyanshu Yadav INX432R10

# Set some variables for organization
REPO_DIR="$HOME/vlsi-hdl-arch-repo"  # Main repository directory
SIMULATION_DIR="$REPO_DIR/simulations"
SYNTHESIS_DIR="$REPO_DIR/synthesis"
VERILOG_FILES="$REPO_DIR/**/*.v" # Searches all .v files in subdirectories
SYSTEMVERILOG_FILES="$REPO_DIR/**/*.sv" # Searches all .sv files in subdirectories

# Function to create directories if they don't exist
create_directories() {
  echo "Creating necessary directories..."
  mkdir -p "$REPO_DIR" "$SIMULATION_DIR" "$SYNTHESIS_DIR"
}

# Function to clone a repository (example)
clone_repo() {
  read -p "Enter the repository URL to clone (or press Enter to skip): " repo_url
  if [[ ! -z "$repo_url" ]]; then
    if [[ ! -d "$REPO_DIR/cloned_repo" ]]; then # Check if it's already cloned
        git clone "$repo_url" "$REPO_DIR/cloned_repo" || { echo "Error cloning repository."; return 1; }
    else
        echo "Repository already cloned in $REPO_DIR/cloned_repo"
    fi
  fi
}

# Function to list Verilog and SystemVerilog files
list_hdl_files() {
    echo "Verilog Files:"
    find "$REPO_DIR" -name "*.v" -print
    echo "\nSystemVerilog Files:"
    find "$REPO_DIR" -name "*.sv" -print
}

# Function to run a simulation (example using Icarus Verilog)
run_simulation() {
  read -p "Enter the top-level Verilog file for simulation: " top_file
    if [[ -f "$top_file" ]]; then
        iverilog -o a.out "$top_file"
        vvp a.out
    else
        echo "Error: File '$top_file' not found."
    fi
}

# Function to perform synthesis (example using Yosys)
run_synthesis() {
    read -p "Enter the top-level Verilog file for synthesis: " top_file
    if [[ -f "$top_file" ]]; then
        yosys -p "synth_ice40 -top top_module -json top.json" "$top_file" # Example for iCE40
    else
        echo "Error: File '$top_file' not found."
    fi
}

# Main script execution
create_directories
clone_repo

while true; do
  clear
  echo "VLSI/HDL/Architecture Code Management Script"
  echo "------------------------------------------"
  echo "1. List HDL Files"
  echo "2. Run Simulation (Icarus Verilog Example)"
  echo "3. Run Synthesis (Yosys Example)"
  echo "4. Exit"

  read -p "Enter your choice: " choice

  case "$choice" in
    1) list_hdl_files ;;
    2) run_simulation ;;
    3) run_synthesis ;;
    4) break ;;
    *) echo "Invalid choice. Please try again." ;;
  esac
  read -n 1 -s -r -p "Press any key to continue"
  echo    # (optional) move to a new line after key press
done

echo "Script finished."

exit 0