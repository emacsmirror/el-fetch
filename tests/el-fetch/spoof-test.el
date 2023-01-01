;;; spoof-test.el --- -*- lexical-binding: t; no-byte-compile: t; -*-


;; This file is part of el-fetch.

;; el-fetch is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, version 3, or
;; (at your option) any later version.

;; el-fetch is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with el-fetch.  If not, see <https://www.gnu.org/licenses/>.

;; Copyright (c) 2022-2023, Maciej Barć <xgqt@riseup.net>
;; Licensed under the GNU GPL v3 License
;; SPDX-License-Identifier: GPL-3.0-or-later



(require 'buttercup)
(require 'el-fetch)
(require 'thingatpt)


(describe "Spoof"
  (it "user@system"
    (fset 'user-real-login-name (lambda () "user"))
    (fset 'system-name (lambda () "system"))
    (el-fetch)
    (goto-char (point-min))
    (expect (re-search-forward "user@system")))
  (it "Uptime"
    (fset 'emacs-uptime (lambda () "spoof"))
    (el-fetch)
    (goto-char (point-min))
    (expect (re-search-forward "spoof in Emacs")))
  (it "Shell"
    (fset 'getenv (lambda (&rest rest) "emacs"))
    (el-fetch)
    (goto-char (point-min))
    (expect (re-search-forward "Shell +: emacs"))))
