# ----------------
# User commands
# ----------------

SOURCE_DIR=sjtutex

all: build-ctan

# Clean all temporary files and generated files
clean:
	cd $(SOURCE_DIR) && l3build clean
	git clean -dfX

# Build sjtutex package
build-ctan:
	cd $(SOURCE_DIR) && l3build ctan

build:
	cd $(SOURCE_DIR) && l3build doc

test:
	cd $(SOURCE_DIR) && l3build check

# For TeX Live/MacTeX users to install the package
install:
	cd $(SOURCE_DIR) && l3build install

# Generate `.sty` files and copy resources
generate:
	cd $(SOURCE_DIR) && l3build unpack && cd ..

.PHONY: build test build-ctan install clean generate
