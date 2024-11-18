PWD := $(shell pwd)

SU := sudo

DIR_XPDF = ./fuzzing_xpdf

.DEFAULT_GOAL := help

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  core_dump       Set core dump pattern for debugging."
	@echo "  cpu_governor    Set CPU governor to performance mode."
	@echo "  ptrace_scope    Set ptrace_scope to 0."
	@echo "  fix             Run both core_dump, cpu_governor and ptrace_scope."
	@echo "  xpdf_all        Run the full install, examples, and fuzzing process."
	@echo "  xpdf_disctlean  Remove all build and installation files."
	@echo "  help            Display this help message."

core_dump:
	$(SU) sh -c "echo core >/proc/sys/kernel/core_pattern"

cpu_governor:
	cd /sys/devices/system/cpu;	\
	echo performance | $(SU) tee cpu*/cpufreq/scaling_governor

ptrace_scope:
	$(SU) sysctl -w kernel.yama.ptrace_scope=0

fix: core_dump gpu_governor ptrace_scope

xpdf_all:
	$(MAKE) -C $(DIR_XPDF) all

xpdf_distclean:
	$(MAKE) -C $(DIR_XPDF) distclean

.PHONY: help core_dump cpu_governor ptrace_scope fix xpdf_all xpdf_distclean test
