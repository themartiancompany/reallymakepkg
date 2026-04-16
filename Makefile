# SPDX-License-Identifier: AGPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025, 2026  Pellegrino Prevete
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

ifeq ($(strip $(TERMUX_VERSION)),'')
  CONF_DIR=$(DESTDIR)/etc
else
  PREFIX := $(TERMUX_PREFIX)/usr
  CONF_DIR=$(DESTDIR)$(TERMUX_PREFIX)/usr/etc
endif

BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

FILES=\
  $(wildcard \
      $(_PROJECT)/*)
DOC_FILES=\
  $(wildcard \
      *.rst) \
  $(wildcard \
      *.md)

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

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_DIR=\
  install \
    -vdm755
_INSTALL_EXE=\
  install \
    -vDm755

all:

check: $(_CHECK_TARGETS)

shellcheck:

	shellcheck \
	  -s \
	    "bash" \
	  $(FILES)

install: $(_INSTALL_TARGETS)

install-scripts:

	for _file in $(FILES); do \
          _file_name="$$( \
	    basename \
	      "$${_file}")"; \
	  $(_INSTALL_EXE) \
	    "$(_PROJECT)/$${_file_name}" \
	    "$(BIN_DIR)/$${_file_name}"; \
	done

install-configs:

	$(_INSTALL_FILE) \
	  "configs/makepkg.android.conf" \
	  "$(CONF_DIR)/$(_PROJECT)/makepkg.android.conf"
	$(_INSTALL_FILE) \
	  "configs/makepkg.gnu.conf" \
	  "$(CONF_DIR)/$(_PROJECT)/makepkg.gnu.conf"
	$(_INSTALL_FILE) \
	  "configs/makepkg.windows.conf" \
	  "$(CONF_DIR)/$(_PROJECT)/makepkg.windows.conf"

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-man:

	$(_INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	for _file in $(FILES); do \
          _file_name="$$( \
	    basename \
	      "$${_file}")"; \
	  rst2man \
	    "man/$${_file_name}.1.rst" \
	    "$(MAN_DIR)/man1/$${_file_name}.1"; \
	done

uninstall:

	rm \
	  "$(BIN_DIR)/$(_PROJECT)"
	rm \
	  "$(BIN_DIR)/recipe-get"
	rm \
	  "$(BIN_DIR)/termux-install-shared"
	rm \
	  -r \
	  "$(DATA_DIR)/$(_PROJECT)"
	rm \
	  -r \
	  "$(DOC_DIR)"
	rm \
	  "$(MAN_DIR)/man1/$(PROJECT).1"

.PHONY: $(_PHONY_TARGETS)
