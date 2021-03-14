CURDIR ?= $(.CURDIR)

LN_FLAGS := -sfn

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d

install-lsp: install-lsp-go install-lsp-python install-lsp-rust

install-lsp-go:
	go install golang.org/x/tools/gopls@latest

install-lsp-python:
	python3 -m pip install --user -U python-language-server

install-lsp-rust:
	rustup component add rls

update:
	git pull --rebase --quiet

clean:
	rm -rf elpa/*
