;;; set-ess.el ---  Emacs' R programming file.
;;
;; Filename: set-ess.el
;;
;; Copyright (c) 2015
;;
;; Author: Ed Maphis
;;
;; Created: Monday, February 2, 2015
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; Provides setting for 'R' programming using
;;   Emacs Speaks Statistics mode
;;   http://ess.r-project.org/
;;   TODO:  check out polymode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; License:
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package ess-site
 ; :ensure t
  :defer t
  :commands R)

(message "end set-ess.el")
(provide 'set-ess)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-ess.el ends here

