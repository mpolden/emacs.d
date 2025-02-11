CURDIR ?= $(.CURDIR)
BREW ?= $(shell command -v brew 2> /dev/null)
JDT_LS_VERSION ?= 1.21.0
PREFIX ?= $(HOME)/.local/stow
JDT_LS_HOME ?= $(PREFIX)/eclipse.jdt.ls-$(JDT_LS_VERSION)

LN_FLAGS := -sfn
COLOR := \033[32;01m
NO_COLOR := \033[0m

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d

install-emacs:
ifneq ($(BREW),)
	$(BREW) install --cask emacs
else
	$(error brew command not found)
endif

install-emacs-mac:
ifneq ($(BREW),)
	$(BREW) tap railwaycat/emacsmacport
	$(BREW) install --cask emacs-mac
else
	$(error brew command not found)
endif

install-emacs-mac-icon:
	mkdir -p /tmp/emacs-macos-icon-main
	test -f /tmp/emacs-macos-icon-main/emacs.icns || curl -fsSL https://github.com/c9rgreen/emacs-macos-icon/archive/refs/heads/main.tar.gz | tar -C /tmp -xf -
	install -m 0644 -p /tmp/emacs-macos-icon-main/emacs.icns /Applications/Emacs.app/Contents/Resources/Emacs.icns

install-emacs-plus:
ifneq ($(BREW),)
	$(BREW) tap d12frosted/emacs-plus
	$(BREW) install --with-native-comp --with-c9rgreen-sonoma-icon emacs-plus
else
	$(error brew command not found)
endif

install-lsp: install-lsp-go install-lsp-java install-lsp-python

install-lsp-go:
ifneq ($(BREW),)
	$(BREW) install gopls
else
	go install golang.org/x/tools/gopls@latest
endif

install-lsp-java:
	mkdir -p $(JDT_LS_HOME)
	FILE=`curl -fsSL https://download.eclipse.org/jdtls/milestones/$(JDT_LS_VERSION)/latest.txt`; \
		curl -fsSL https://download.eclipse.org/jdtls/milestones/$(JDT_LS_VERSION)/$$FILE | \
		tar -C $(JDT_LS_HOME) -zxf -
	@echo "eclipse jdt ls $(JDT_LS_VERSION) installed in $(COLOR)$(JDT_LS_HOME)$(NO_COLOR)"
	@echo "emacs/eglot requires the following environment variables:"
	@echo "- $(COLOR)JAVA_HOME$(NO_COLOR) must contain the path to a jdk installation"
	@echo "- $(COLOR)PATH$(NO_COLOR) must contain $(COLOR)$(JDT_LS_HOME)/bin$(NO_COLOR)"

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
