#!/bin/bash

# Get the directory where the script is located
script_dir="$(dirname "$(realpath "$0")")"

# Create the directory for hardware info if it doesn't exist
mkdir -p "$script_dir/Hardware_info"

# Run the commands and save the output in the 'Hardware_info' directory
{
    echo "Collecting hardware information..."
    
    # Check sudo permissions
    if ! sudo -v &>/dev/null; then
        echo "You need to have sudo permissions to run this script."
        exit 1
    fi

    sudo lshw -short > "$script_dir/Hardware_info/OutputOf_lshw_short"
    sudo lshw > "$script_dir/Hardware_info/OutputOf_lshw"
    sudo glxinfo > "$script_dir/Hardware_info/OutputOf_glxinfo"
    sudo lscpu > "$script_dir/Hardware_info/OutputOf_lscpu"
    sudo lspci > "$script_dir/Hardware_info/OutputOf_lspci"
    sudo dpkg -l > "$script_dir/Hardware_info/OutputOf_dpkg_list"

    echo "Hardware information collected in $script_dir/Hardware_info"


} || {
    echo "An error occurred while collecting hardware information."
}

