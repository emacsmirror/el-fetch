BUTTERCUP   := buttercup
CASK        := cask
EMACS       := emacs
FIND        := find
RM          := rm
RMDIR       := $(RM) -r

EXTRASDIR   := $(PWD)/extras
SRCDIR      := $(PWD)/src
TESTSDIR    := $(PWD)/tests

CASKDIR     := $(PWD)/.cask
CACHEDIR    := $(PWD)/.cache
IDIR        := $(CACHEDIR)/image
BINIDR      := $(IDIR)/usr/bin
EMACSIDIR   := $(IDIR)/usr/share/emacs/site-lisp

EMACSFLAGS  := --batch -q --no-site-file
EMACSCMD     = $(EMACS) $(EMACSFLAGS)
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
	if [ -d $(CACHEDIR) ] ; then $(RMDIR) $(CACHEDIR) ; fi


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
	$(EMACSCMD) --script $(EXTRASDIR)/bin/el-fetch


image-bin-%:
	if [ -f $(EXTRASDIR)/bin/$(*) ] ; then \
		mkdir -p $(BINIDR) ; cp -r $(EXTRASDIR)/bin/$(*) $(BINIDR) ; fi

image-lib-%:
	mkdir -p $(EMACSIDIR)
	cp -r $(SRCDIR)/$(*) $(EMACSIDIR)

image-site-gentoo-%:
	mkdir -p $(EMACSIDIR)/site-gentoo.d
	cp -r $(EXTRASDIR)/gentoo/50$(*)-gentoo.el $(EMACSIDIR)/site-gentoo.d

image-%:
	$(MAKE) image-bin-$(*) image-lib-$(*) image-site-gentoo-$(*)

image: image-el-fetch
