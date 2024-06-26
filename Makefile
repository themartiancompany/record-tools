# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/record-tools
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share/record-tools

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard record-tools/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-configs install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-scripts:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 record-tools/audiorecord "$(BIN_DIR)"
	install -vDm 755 record-tools/camera-mode "$(BIN_DIR)"
	install -vDm 755 record-tools/record "$(BIN_DIR)"

install-configs:

	install -vdm 755 "$(DATA_DIR)/configs"
	install -vDm 755 configs/ffmpeg_options "$(DATA_DIR)/configs"

.PHONY: check install install-configs install-doc install-scripts shellcheck
