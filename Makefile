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
RM          := rm
RMDIR       := $(RM) -r

CASKDIR     := $(PWD)/.cask
EXTRASDIR   := $(PWD)/extras
SRCDIR      := $(PWD)/src
TESTSDIR    := $(PWD)/tests

EMACFLAGS   := --batch -q --no-site-file
EMACSCMD     = $(EMACS) $(EMACFLAGS)
TESTFLAGS   := -L $(PWD) --traceback full
TESTCMD      = $(BUTTERCUP) $(TESTFLAGS)


all: clean compile


cask-%:
	$(CASK) exec $(MAKE) $(*)


clean-%:
	$(FIND) $(SRCDIR)/$(*) -iname "*.elc" -delete

clean-cask:
	if [ -d $(CASKDIR) ] ; then $(RMDIR) $(CASKDIR) ; fi

clean: clean-cask clean-el-fetch


compile-%:
	$(EMACSCMD) \
		--directory $(SRCDIR)/$(*) \
		--eval "(byte-recompile-directory \"$(SRCDIR)/$(*)\" 0)"

compile: compile-el-fetch


test-%:
	$(TESTCMD) \
		-L $(SRCDIR)/$(*) \
		-L $(TESTSDIR)/$(*) \
		--directory $(TESTSDIR)/$(*)

test: test-el-fetch


install-%: compile-%
	$(EMACSCMD) \
		--eval "(require 'package)" \
		--eval "(package-install-file \"$(SRCDIR)/$(*)\")"

install: install-el-fetch


run:
	$(EMACSCMD) --script $(EXTRASDIR)/el-fetch-console
