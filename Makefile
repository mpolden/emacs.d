CURDIR ?= $(.CURDIR)
BREW ?= $(shell command -v brew 2> /dev/null)
ECLIPSE_JDT ?= $(CURDIR)/eclipse.jdt.ls

LN_FLAGS := -sfn
COLOR := \033[32;01m
NO_COLOR := \033[0m

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d

install-emacs:
ifdef BREW
	brew tap railwaycat/emacsmacport
	brew install --with-mac-metal --with-emacs-big-sur-icon emacs-mac
else
	$(error brew command not found)
endif

install-lsp: install-lsp-go install-lsp-java install-lsp-python install-lsp-rust

install-lsp-go:
	go install golang.org/x/tools/gopls@latest

install-lsp-java:
	mkdir -p $(ECLIPSE_JDT)
	curl -fsSL https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz | \
		tar -C $(ECLIPSE_JDT) -xf -
	@echo "eclipse jdt installed in $(COLOR)$(ECLIPSE_JDT)$(NO_COLOR)"
	@echo "eglot needs the following environment variables set:"
	@echo "- $(COLOR)JAVA_HOME$(NO_COLOR) containing the path to a jdk installation"
	@printf -- "- $(COLOR)CLASSPATH$(NO_COLOR) containing $(COLOR)%s$(NO_COLOR)\n" \
		$(ECLIPSE_JDT)/plugins/org.eclipse.equinox.launcher_*.jar

install-lsp-python:
	python3 -m pip install --user -U python-language-server

install-lsp-rust:
	rustup component add rls

update:
	git pull --rebase --quiet

clean:
	rm -rf elpa/*
