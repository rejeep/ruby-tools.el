all: test

test:
	cask exec ecukes

.PHONY: all test
