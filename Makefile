# ----------------
# User commands
# ----------------

BUILD_DIR=build
LATEXINDENT_ARGS=-l latexindent.yaml -c $(BUILD_DIR)
LATEXMK_ARGS=-halt-on-error -time -xelatex -outdir=build -shell-escape
SOURCE_DIR=sjtuthesis

all: build

# Format all tex and dtx files
format:
	.github/ci/format.sh $(LATEXINDENT_ARGS)

# Clean all temporary files and generated files
clean:
	cd $(SOURCE_DIR) && l3build clean
	git clean -dfX

# Build sjtuthesis package
build-ctan:
	cd $(SOURCE_DIR) && l3build ctan

build:
	cd $(SOURCE_DIR) && l3build doc

# Generate `.sty` files and copy resources
generate:
	cd $(SOURCE_DIR) && l3build unpack && cd ..

.PHONY: build build-ctan format clean generate
