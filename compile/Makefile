# -------------------------------------
# Testbench Makefile for Verilog Simulation using verilator
# -------------------------------------
NPROC = $$((`nproc`-1))

# Simulator configuration
VERILATOR := verilator
ifdef VERILATOR_ROOT
VERILATOR := $(VERILATOR_ROOT)/bin/verilator
endif

# Testbench and design files
DESIGN_FILES := ../rtl/seq0110.v  
TESTBENCH_FILES := ../tb/seq0110_tb.v  

# Simulation configuration
SIM_NAME ?= seq
# SIM_DIR := $(SIM_NAME)-sim

# Compilation arguments
COMPILE_ARGS += --prefix $(SIM_NAME) 
COMPILE_ARGS += -o $(SIM_NAME)
COMPILE_ARGS += --trace

# Extra simulation arguments
EXTRA_ARGS += --timing \
              --error-limit 100 \
              --cc \
              --exe \
              --main 

# Warning suppression
WARNING_ARGS += -Wno-lint \
                -Wno-style \
                -Wno-SYMRSVDWORD \
                -Wno-IGNOREDRETURN
 
simulate : clean 
	@echo "Running verilator"
	$(VERILATOR) \
	$(EXTRA_ARGS) \
	$(COMPILE_ARGS) \
	$(WARNING_ARGS) \
	$(DESIGN_FILES) \
	$(TESTBENCH_FILES)

	make -C obj_dir -f $(SIM_NAME).mk

run :
	@echo "Running simulation"
	./obj_dir/$(SIM_NAME)

wave :
	@echo "showing waveform"
	gtkwave dump.vcd

clean:

	@echo "Cleaning up"
	rm -rf $(SIM_DIR)
	rm -rf obj_dir 
	rm -rf *.log
	rm -rf *.vcd

.PHONY: simulate clean
