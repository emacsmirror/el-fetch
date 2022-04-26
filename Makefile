# This file is part of el-fetch.

# el-fetch is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.

# el-fetch is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with el-fetch.  If not, see <https://www.gnu.org/licenses/>.

# Copyright (c) 2022, Maciej Barć <xgqt@riseup.net>
# Licensed under the GNU GPL v3 License
# SPDX-License-Identifier: GPL-3.0-only


BUTTERCUP   := buttercup
CASK        := cask
EMACS       := emacs
FIND        := find

SRC         := $(PWD)/src
TESTS       := $(PWD)/tests

EMACFLAGS   := --batch -q --no-site-file
EMACSCMD     = $(EMACS) $(EMACFLAGS)
TESTFLAGS   := -L . --traceback full
TESTCMD      = $(BUTTERCUP) $(TESTFLAGS)


all: clean compile


cask-%:
	$(CASK) exec $(MAKE) $(*)


clean-%:
	$(FIND) $(SRC)/$(*) -iname "*.elc" -delete

clean: clean-el-fetch


compile-%:
	$(EMACSCMD) \
		--directory=$(SRC)/$(*) \
		--eval "(byte-recompile-directory \"$(SRC)/$(*)\" 0)"

compile: compile-el-fetch


test-%:
	$(TESTCMD) \
		-L $(SRC)/$(*) -L $(TESTS)/$(*) --directory $(TESTS)/$(*)

test: test-el-fetch


install-%: compile-%
	$(EMACSCMD) \
		--eval "(require 'package)" \
		--eval "(package-install-file \"$(SRC)/$(*)\")"

install: install-el-fetch


run:
	$(EMACSCMD) --script ./extras/el-fetch-console
