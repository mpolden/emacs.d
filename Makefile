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

install-emacs-mac-icon:
	mkdir -p /tmp/emacs-macos-icon-main
	test -f /tmp/emacs-macos-icon-main/emacs.icns || curl -fsSL https://github.com/c9rgreen/emacs-macos-icon/archive/refs/heads/main.tar.gz | tar -C /tmp -xf -
	install -m 0644 -p /tmp/emacs-macos-icon-main/emacs.icns /Applications/Emacs.app/Contents/Resources/Emacs.icns

install-emacs-plus:
	brew tap d12frosted/emacs-plus
	brew install --with-native-comp --with-c9rgreen-sonoma-icon emacs-plus

install-lsp: install-lsp-go install-lsp-java install-lsp-python

install-lsp-go:
	brew install gopls

install-lsp-java:
	brew install jdtls

install-lsp-python:
	pipx install python-lsp-server

install-lsp-python-fmt:
	pipx inject python-lsp-server python-lsp-ruff

install-lsp-python-types:
	pipx inject python-lsp-server pylsp-mypy

install-lsp-python-more: install-lsp-python-fmt install-lsp-python-types

update:
	git pull --rebase --quiet

clean:
	rm -rf elpa/*
