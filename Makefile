# ----------------
# User commands
# ----------------

SOURCE_DIR=sjtutex

all: build

# Clean all temporary files and generated files
clean:
	cd $(SOURCE_DIR) && l3build clean
	git clean -dfX

# Build sjtutex package
build-ctan:
	cd $(SOURCE_DIR) && l3build ctan

build:
	cd $(SOURCE_DIR) && l3build doc

# Generate `.sty` files and copy resources
generate:
	cd $(SOURCE_DIR) && l3build unpack && cd ..

.PHONY: build build-ctan format clean generate
