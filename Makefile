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

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install:

	install -vDm 755 reallymakepkg/reallymakepkg "$(BIN_DIR)/reallymakepkg"

uninstall:

	rm "$(BIN_DIR)/reallymakepkg"


.PHONY: check install shellcheck uninstall
