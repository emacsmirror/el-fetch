;;; spoof-test.el --- -*- lexical-binding: t; no-byte-compile: t; -*-


;; This file is part of el-fetch.

;; el-fetch is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, version 3.

;; el-fetch is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with el-fetch.  If not, see <https://www.gnu.org/licenses/>.

;; Copyright (c) 2022, Maciej Barć <xgqt@riseup.net>
;; Licensed under the GNU GPL v3 License
;; SPDX-License-Identifier: GPL-3.0-only


(require 'buttercup)
(require 'el-fetch)
(require 'thingatpt)


(defun user-real-login-name ()
  "user")

(defun system-name ()
  "system")


(describe "Spoof"
  (it "user@system"
    (el-fetch)
    (goto-char (point-min))
    (expect (re-search-forward "user@system"))))
