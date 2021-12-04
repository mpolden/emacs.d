CURDIR ?= $(.CURDIR)
BREW ?= $(shell command -v brew 2> /dev/null)
JDT_LS_HOME ?= $(CURDIR)/eclipse.jdt.ls
JDT_LS_VERSION ?= 1.4.0-202109161824

LN_FLAGS := -sfn
COLOR := \033[32;01m
NO_COLOR := \033[0m

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d

install-emacs:
ifdef BREW
	brew install --cask emacs
else
	$(error brew command not found)
endif

install-lsp: install-lsp-go install-lsp-java install-lsp-python install-lsp-rust

install-lsp-go:
	go install golang.org/x/tools/gopls@latest

install-lsp-java:
	mkdir $(JDT_LS_HOME)
	curl -fsSL https://download.eclipse.org/jdtls/milestones/$(firstword $(subst -, ,$(JDT_LS_VERSION)))/jdt-language-server-$(JDT_LS_VERSION).tar.gz | \
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
