#!/bin/bash

set -e

function apply_patches() {
    # Copy additional files to bladeRF-wiphy submodule
    cp -r patches/additional_files/fft64 bladeRF-wiphy/fpga/ip/altera/
    cp -r patches/additional_files/viterbi_decoder bladeRF-wiphy/fpga/ip/altera/
    cp -r patches/additional_files/wlan_pll bladeRF-wiphy/fpga/ip/altera/

    # Add .gitignore to bladeRF-wiphy
    echo "fpga/ip/altera/fft64/fft64/*" >> bladeRF-wiphy/.gitignore
    echo "fpga/ip/altera/viterbi_decoder/viterbi_decoder/*" >> bladeRF-wiphy/.gitignore
    echo "fpga/ip/altera/wlan_pll/wlan_pll/*" >> bladeRF-wiphy/.gitignore

    # Add .gitignore to bladeRF
    echo "hdl/quartus/wlanxA9-*" >> bladeRF/.gitignore
}

apply_patches
