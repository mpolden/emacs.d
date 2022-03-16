CURDIR ?= $(.CURDIR)
BREW ?= $(shell command -v brew 2> /dev/null)
BREW_EMACS_FLAGS ?= --cask
JDT_LS_HOME ?= $(CURDIR)/eclipse.jdt.ls
JDT_LS_VERSION ?= 1.8.0

LN_FLAGS := -sfn
COLOR := \033[32;01m
NO_COLOR := \033[0m

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d

install-emacs-head: BREW_EMACS_FLAGS=--HEAD --with-native-comp
install-emacs-head: install-emacs
	ln -s `$(BREW) --prefix`/opt/emacs-mac/Emacs.app /Applications/Emacs.app || true
	ln -s `$(BREW) --prefix`/opt/emacs-mac/lib/emacs/*/native-lisp /Applications/Emacs.app/Contents/native-lisp

install-emacs:
ifneq ($(BREW),)
	$(BREW) tap railwaycat/emacsmacport
	$(BREW) install $(BREW_EMACS_FLAGS) emacs-mac
# https://github.com/railwaycat/homebrew-emacsmacport/issues/279
	codesign --remove-signature /Applications/Emacs.app
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
	mkdir $(JDT_LS_HOME)
	FILE=`curl -fsSL https://download.eclipse.org/jdtls/milestones/$(JDT_LS_VERSION)/latest.txt`; \
		curl -fsSL https://download.eclipse.org/jdtls/milestones/$(JDT_LS_VERSION)/$$FILE | \
		tar -C $(JDT_LS_HOME) -xf -
	@echo "eclipse jdt ls $(JDT_LS_VERSION) installed in $(COLOR)$(JDT_LS_HOME)$(NO_COLOR)"
	@echo "emacs/eglot needs the following environment variables set:"
	@echo "- $(COLOR)JAVA_HOME$(NO_COLOR) containing the path to a jdk installation"
	@printf -- "- $(COLOR)CLASSPATH$(NO_COLOR) containing $(COLOR)%s$(NO_COLOR)\n" \
		$(JDT_LS_HOME)/plugins/org.eclipse.equinox.launcher_*.jar

install-lsp-python:
	python3 -m pip install --user -U python-lsp-server

install-lsp-python-more:
	python3 -m pip install --user -U python-lsp-black pylsp-mypy

install-lsp-rust:
	rustup component add rls

update:
	git pull --rebase --quiet

clean:
	rm -rf elpa/*
