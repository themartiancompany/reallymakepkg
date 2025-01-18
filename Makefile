#
# SPDX-License-Identifier: AGPL-3.0-or-later

TERMUX_PREFIX=/data/data/com.termux

_PROJECT=reallymakepkg
PREFIX ?= /usr
ifeq ($(strip $(TERMUX_VERSION)),'')
PREFIX := $(TERMUX_PREFIX)/usr
endif


BIN_DIR=$(DESTDIR)$(PREFIX)/bin
CONF_DIR=$(DESTDIR)$(PREFIX)/etc
DATA_DIR=$(DESTDIR)$(PREFIX)/share
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)

FILES=$(wildcard $(_PROJECT))
DOC_FILES=$(wildcard *.rst)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install: install-scripts install-configs install-doc

install-scripts:

	install \
	  -vDm755 \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)"
	install \
	  -vDm755 \
	  "$(_PROJECT)/recipe-get" \
	  "$(BIN_DIR)/recipe-get"

install-configs:

	install \
	  -vDm644 \
	  "configs/makepkg.android.conf" \
	  "$(CONF_DIR)/$(_PROJECT)/makepkg.android.conf"
	install \
	  -vDm644 \
	  "configs/makepkg.gnu.conf" \
	  "$(CONF_DIR)/$(_PROJECT)/makepkg.gnu.conf"

install-doc:

	install \
	  -vDm644 \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

uninstall:

	rm \
	  "$(BIN_DIR)/$(_PROJECT)"
	rm \
	  "$(BIN_DIR)/recipe-get"
	rm \
	  -r \
	  "$(DATA_DIR)/$(_PROJECT)"
	rm \
	  -r \
	  "$(DOC_DIR)"

.PHONY: check install install-scripts install-configs install-doc shellcheck uninstall
