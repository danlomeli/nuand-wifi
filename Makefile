# Define submodule directories
BLADE_RF_DIR = bladeRF
BLADE_RF_WIPHY_DIR = bladeRF-wiphy

# Define Quartus environment variables
QUARTUS_ROOTDIR = /opt/intel/quartus_lite/23.1std/quartus
SOPC_KIT_NIOS2 = $(QUARTUS_ROOTDIR)/../nios2eds

# Add Quartus tools to PATH
export PATH := $(PATH):$(QUARTUS_ROOTDIR)/bin:$(QUARTUS_ROOTDIR)/sopc_builder/bin:$(QUARTUS_ROOTDIR)/../nios2eds/sdk2/bin:$(QUARTUS_ROOTDIR)/../nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/bin:$(QUARTUS_ROOTDIR)/../nios2eds/bin

# Default target
.PHONY: all
all: setup submodules patch build

# Setup environment variables
.PHONY: setup
setup:
	@echo "Setting up environment variables..."
	@export QUARTUS_ROOTDIR=$(QUARTUS_ROOTDIR)
	@export SOPC_KIT_NIOS2=$(SOPC_KIT_NIOS2)
	@export PATH=$(PATH)

# Initialize and update submodules
.PHONY: submodules
submodules:
	@git submodule update --init --recursive

# Apply patches and copy additional files
.PHONY: patch
patch:
	@./apply_patches.sh

# Build bladeRF submodule
.PHONY: build
build: submodules patch
	@echo "Building bladeRF..."
	@cd $(BLADE_RF_DIR)/hdl/quartus && ./build_bladerf.sh -b bladeRF-micro -r wlan -s A9

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BLADE_RF_DIR)/hdl/quartus/work/*
	@rm -rf $(BLADE_RF_DIR)/hdl/quartus/output_files/*
	@rm -rf $(BLADE_RF_DIR)/hdl/quartus/db/*
	@rm -rf $(BLADE_RF_DIR)/hdl/quartus/incremental_db/*
	@rm -rf $(BLADE_RF_DIR)/hdl/quartus/wlanxA9-*

# Combined clean target
.PHONY: clean-all
clean-all: clean
	@echo "Cleaned all build artifacts."
