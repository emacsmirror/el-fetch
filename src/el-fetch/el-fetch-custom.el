;;; el-fetch-custom.el --- El-Fetch customization -*- lexical-binding: t -*-


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



;;; Commentary:


;; El-Fetch customization.



;;; Code:


(defgroup el-fetch nil
  "System information in Neofetch-like style."
  :group 'emacs)


(defmacro el-fetch-custom-information-defcustom (symbol-identifier information-part-comment)
  "Quick defcustom for El-Fetch information parts.
SYMBOL-IDENTIFIER is the variable to bind new defcustom.
INFORMATION-PART-COMMENT is used for defcustom docstring."
  `(defcustom ,symbol-identifier t
     ,(concat "Show information related to the " information-part-comment ".")
     :type 'boolean
     :group 'el-fetch))


(el-fetch-custom-information-defcustom el-fetch-custom-info-cpu
                                       "CPU")
(el-fetch-custom-information-defcustom el-fetch-custom-info-memory
                                       "memory (RAM)")
(el-fetch-custom-information-defcustom el-fetch-custom-info-device
                                       "device model")
(el-fetch-custom-information-defcustom el-fetch-custom-info-distro
                                       "system distribution")
(el-fetch-custom-information-defcustom el-fetch-custom-info-kernel
                                       "system kernel")
(el-fetch-custom-information-defcustom el-fetch-custom-info-shell
                                       "SHELL")

(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-version
                                       "GNU Emacs version")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-user-dir
                                       "GNU Emacs user directory")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-pkgs
                                       "GNU Emacs installed packages")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-load-path
                                       "GNU Emacs load path")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-font
                                       "GNU Emacs font")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-theme
                                       "GNU Emacs theme")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-bars
                                       "GNU Emacs bars")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-frame
                                       "GNU Emacs frame")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-completion
                                       "GNU Emacs completion framework")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-buffers
                                       "GNU Emacs buffers")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-processes
                                       "GNU Emacs processes")
(el-fetch-custom-information-defcustom el-fetch-custom-info-emacs-uptime
                                       "GNU Emacs uptime")

(el-fetch-custom-information-defcustom el-fetch-custom-info-group-memory-use
                                       "GNU Emacs internal memory use")


(provide 'el-fetch-custom)



;;; el-fetch-custom.el ends here
