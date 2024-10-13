CC = afl-clang-fast
CXX = afl-clang-fast++
LLVM_CONFIG = llvm-config-11
INSTALL_DIR := $(shell pwd)/install
EXAMPLES_DIR = $(shell pwd)/pdf_examples
OUT_DIR = $(shell pwd)/out
OUTPUT = $(shell pwd)/output
SEED = 123

install:
	wget https://dl.xpdfreader.com/old/xpdf-3.02.tar.gz
	tar -xvzf xpdf-3.02.tar.gz
	cd xpdf-3.02;										\
	export LLVM_CONFIG="$(LLVM_CONFIG)";				\
	export CC="$(CC)";									\
	export CXX="$(CXX)";								\
	./configure --prefix="$(INSTALL_DIR)";				\
	$(MAKE);											\
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

clean:
	@rm -rf xpdf-3.02.tar.gz xpdf-3.02 $(EXAMPLES_DIR) $(INSTALL_DIR) $(OUTPUT)

.PHONY: install examples fuzzing all clean test
