#
# SPDX-License-Identifier: AGPL-3.0-or-later

TERMUX_PREFIX=/data/data/com.termux

PREFIX ?= /usr
ifeq ($(TERMUX_VERSION),)
PREFIX=$(TERMUX_PREFIX)/usr
endif


BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share

FILES=$(wildcard reallymakepkg)
DOC_FILES=$(wildcard *.rst)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 reallymakepkg/reallymakepkg "$(BIN_DIR)/reallymakepkg"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

uninstall:

	rm "$(BIN_DIR)/reallymakepkg"


.PHONY: check install install-scripts install-doc shellcheck uninstall
