;;; console-test.el --- -*- lexical-binding: t; no-byte-compile: t;-*-


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


(describe "Console"
  :var ((executable (expand-file-name "../../extras/el-fetch-console"
                                      (file-name-directory load-file-name))))
  (when (file-executable-p executable)
    (it "Any output"
      (expect (stringp (shell-command-to-string executable))))
    (it "Contains CPU"
      (expect (string-match-p ".*CPU.*" (shell-command-to-string executable))))
    (it "Spoofed SHELL"
      (expect (let ((process-environment
                     (append '("SHELL=emacs") process-environment)))
                (split-string (shell-command-to-string executable) "\n" t))
              :to-contain "Shell    : emacs"))))
