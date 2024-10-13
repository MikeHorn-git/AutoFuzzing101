CC = afl-clang-fast
CXX = afl-clang-fast++
GDB := gdb
CFLAGS = -g -O0
CXXFLAGS = -g -O0
GDBFLAGS = -q -x
LLVM_CONFIG = llvm-config-11

EXAMPLES_DIR = $(shell pwd)/pdf_examples
INSTALL_DIR := $(shell pwd)/install
OUT_DIR = $(shell pwd)/out
OUTPUT = $(shell pwd)/output
SEED = 123

POC := poc.gdb
XPDF_URL = https://dl.xpdfreader.com/old/xpdf-3.02.tar.gz
XPDF_ARCHIVE = xpdf-3.02.tar.gz
XPDF_DIR = xpdf-3.02

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  install     Download and install xpdf with debug symbols."
	@echo "  examples    Download example PDF files."
	@echo "  fuzzing     Run AFL fuzzing on pdftotext."
	@echo "  all         Run install, examples, and fuzzing in sequence."
	@echo "  poc         Run poc.gdb script."
	@echo "  clean       Remove temporary files from the last build."
	@echo "  distclean   Remove all build and installation files."
	@echo "  help        Display this help message."

install:
	wget $(XPDF_URL)
	tar -xvzf $(XPDF_ARCHIVE)
	cd $(XPDF_DIR);							\
	export LLVM_CONFIG="$(LLVM_CONFIG)";	\
	export CC="$(CC)";						\
	export CXX="$(CXX)";					\
	export CFLAGS="$(CFLAGS)";				\
	export CXXFLAGS="$(CXXFLAGS)";			\
	./configure --prefix="$(INSTALL_DIR)";	\
	$(MAKE);								\
	$(MAKE) install

examples:
	@mkdir -p $(EXAMPLES_DIR)
	cd $(EXAMPLES_DIR);														\
	wget https://github.com/mozilla/pdf.js-sample-files/raw/master/helloworld.pdf;			\
	wget http://www.africau.edu/images/default/sample.pdf;									\
	wget https://www.melbpc.org.au/wp-content/uploads/2017/10/small-example-pdf-file.pdf;	\

fuzzing:
	afl-fuzz -i $(EXAMPLES_DIR) -o $(OUT_DIR) -s $(SEED) -- $(INSTALL_DIR)/bin/pdftotext @@ $(OUTPUT)

all: install examples fuzzing

poc:
	@$(GDB) $(GDBFLAGS) $(POC)

clean:
	@rm -rf $(XPDF_ARCHIVE) $(XPDF_DIR) $(EXAMPLES_DIR)

distclean:
	@rm -rf $(XPDF_ARCHIVE) $(XPDF_DIR) $(EXAMPLES_DIR) $(INSTALL_DIR) $(OUT_DIR) $(OUTPUT)

.PHONY: help install examples fuzzing all poc clean distclean test
