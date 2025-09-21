CURDIR ?= $(.CURDIR)
LN_FLAGS := -sfn

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d

install-emacs:
	brew install --cask emacs

install-emacs-native-comp:
	brew tap jimeh/emacs-builds
	brew install --cask emacs-app

install-emacs-mac:
	brew tap railwaycat/emacsmacport
	brew install --cask emacs-mac

install-lsp: install-lsp-go install-lsp-java install-lsp-python

install-lsp-go:
	brew install gopls

install-lsp-java:
	brew install jdtls

install-lsp-python-venv:
ifndef VIRTUAL_ENV
	$(error refusing to install: venv is not active)
endif
	pip install python-lsp-server python-lsp-ruff pylsp-mypy

update:
	git pull --rebase --quiet

clean:
	rm -rf elpa/*
