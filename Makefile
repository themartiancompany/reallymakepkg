#
# SPDX-License-Identifier: AGPL-3.0-or-later

TERMUX_PREFIX=/data/data/com.termux

_PROJECT=reallymakepkg
PREFIX ?= /usr
ifeq ($(strip $(TERMUX_VERSION)),'')
PREFIX := $(TERMUX_PREFIX)/usr
endif


BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)

FILES=$(wildcard $(_PROJECT))
DOC_FILES=$(wildcard *.rst)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 $(_PROJECT)/$(_PROJECT) "$(BIN_DIR)/$(_PROJECT)"
	install -vDm 755 $(_PROJECT)/recipe-get "$(BIN_DIR)/recipe-get"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

uninstall:

	rm "$(BIN_DIR)/$(_PROJECT)"


.PHONY: check install install-scripts install-doc shellcheck uninstall
