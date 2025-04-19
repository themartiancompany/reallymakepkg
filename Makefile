# SPDX-License-Identifier: AGPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

TERMUX_PREFIX ?= /data/data/com.termux

_PROJECT=reallymakepkg
PREFIX ?= /usr
CONF_DIR=$(DESTDIR)/etc

ifeq ($(strip $(TERMUX_VERSION)),'')
PREFIX := $(TERMUX_PREFIX)/usr
CONF_DIR=$(DESTDIR)$(PREFIX)/etc
endif

BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

FILES=$(wildcard $(_PROJECT))
DOC_FILES=\
  $(wildcard *.rst) \
  $(wildcard *.md)

_CHECK_TARGETS:=\
  shellcheck
_CHECK_TARGETS_ALL:=\
  check \
  $(_CHECK_TARGETS)
_INSTALL_TARGETS:=\
  install-scripts \
  install-configs \
  install-doc \
  install-man
_INSTALL_TARGETS_ALL:=\
  install \
  $(_INSTALL_TARGETS)
_PHONY_TARGETS:=\
  $(_CHECK_TARGETS_ALL) \
  $(_INSTALL_TARGETS_ALL) \
  uninstall

_INSTALL_FILE=install -Dm644
_INSTALL_DIR=install -dm755
_INSTALL_EXE=install -Dm755

all:

check: $(_CHECK_TARGETS)

shellcheck:
	shellcheck -s bash $(FILES)

install: $(_INSTALL_TARGETS)

install-scripts:

	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/recipe-get" \
	  "$(BIN_DIR)/recipe-get"

install-configs:

	$(_INSTALL_FILE) \
	  "configs/makepkg.android.conf" \
	  "$(CONF_DIR)/$(_PROJECT)/makepkg.android.conf"
	$(_INSTALL_FILE) \
	  "configs/makepkg.gnu.conf" \
	  "$(CONF_DIR)/$(_PROJECT)/makepkg.gnu.conf"

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-man:

	$(_INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	rst2man \
	  "man/$(_PROJECT).1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT).1"

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
	rm \
	  "$(MAN_DIR)/man1/$(PROJECT).1"

.PHONY: $(_PHONY_TARGETS)
