PWD = $(shell pwd)
DIR_XPDF = ./fuzzing_xpdf

.DEFAULT_GOAL := help

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  core_dump       Set core dump pattern for debugging."
	@echo "  cpu_governor    Set CPU governor to performance mode."
	@echo "  fix             Run both core_dump and cpu_governor."
	@echo "  xpdf_install    Install xpdf in the fuzzing_xpdf directory."
	@echo "  xpdf_examples   Download sample PDF files for fuzzing."
	@echo "  xpdf_fuzzing    Start fuzzing xpdf with AFL++."
	@echo "  xpdf_all        Run the full install, examples, and fuzzing process."
	@echo "  xpdf_clean      Clean up the xpdf build and examples."
	@echo "  help            Display this help message."

core_dump:
	sudo sh -c "echo core >/proc/sys/kernel/core_pattern"

cpu_governor:
	cd /sys/devices/system/cpu;	\
    echo performance | sudo tee cpu*/cpufreq/scaling_governor

ptrace_scope:
	sudo sysctl -w kernel.yama.ptrace_scope=0

fix: core_dump gpu_governor ptrace_scope

xpdf_install:
	$(MAKE) -C $(DIR_XPDF) install

xpdf_examples:
	$(MAKE) -C $(DIR_XPDF) examples

xpdf_fuzzing:
	$(MAKE) -C $(DIR_XPDF) fuzzing

xpdf_all:
	$(MAKE) -C $(DIR_XPDF) all

xpdf_clean:
	@$(MAKE) -C $(DIR_XPDF) clean

.PHONY: help core_dump cpu_governor ptrace_scope fix xpdf_install xpdf_examples xpdf_fuzzing xpdf_all xpdf_clean all clean test
