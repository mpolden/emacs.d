CURDIR ?= $(.CURDIR)
BREW ?= $(shell command -v brew 2> /dev/null)
BREW_EMACS_FLAGS ?= --with-native-comp
JDT_LS_VERSION ?= 1.12.0
JDT_LS_HOME ?= $(CURDIR)/eclipse.jdt.ls-$(JDT_LS_VERSION)

LN_FLAGS := -sfn
COLOR := \033[32;01m
NO_COLOR := \033[0m

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d

install-emacs:
ifneq ($(BREW),)
	$(BREW) tap railwaycat/emacsmacport
	$(BREW) install emacs-mac $(BREW_EMACS_FLAGS)
	ln -s `$(BREW) --prefix`/opt/emacs-mac/Emacs.app /Applications/Emacs.app || true
else
	$(error brew command not found)
endif

install-lsp: install-lsp-go install-lsp-java install-lsp-python install-lsp-rust

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
		tar -C $(JDT_LS_HOME) -xf -
	@echo "eclipse jdt ls $(JDT_LS_VERSION) installed in $(COLOR)$(JDT_LS_HOME)$(NO_COLOR)"
	@echo "emacs/eglot requires the following environment variables:"
	@echo "- $(COLOR)JAVA_HOME$(NO_COLOR) must contain the path to a jdk installation"
	@echo "- $(COLOR)PATH$(NO_COLOR) must contain $(COLOR)$(CURDIR)/eclipse.jdt.ls/bin$(NO_COLOR)"
	ln -nsf $(notdir $(JDT_LS_HOME)) $(CURDIR)/eclipse.jdt.ls

install-lsp-python:
	python3 -m pip install --user -U python-lsp-server

install-lsp-python-more:
	python3 -m pip install --user -U python-lsp-black pylsp-mypy

install-lsp-rust:
ifneq ($(BREW),)
	$(BREW) install rust-analyzer
else
	$(error brew command not found)
endif

update:
	git pull --rebase --quiet

clean:
	rm -rf elpa/*
