;;; set-erlang.el ---  Emacs' erlang settings file.
;;
;; Filename: set-erlang.el
;;
;; Copyright (c) 2015
;;
;; Author: Ed Maphis
;;
;; Created: Tuesday, January 27, 2015
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings erlang
;; Compatibility: emacs 24.4
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary: provides erlang-mode
;;   Using erlang installed with fedora yum  - version R16.3
;;   erlang-mode installed with 'package'
;;
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

;; installed with package manager, so don't use local copy
;(setq load-path (cons "/usr/lib64/tools-2.6.13/emacs"
;                      load-path))
(setq erlang-root-dir "/usr/lib64/erlang")
(setq exec-path (cons "/usr/lib64/erlang/bin" exec-path))
(require 'erlang-start)

;; edts
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))


(message "end set-erlang.el")
(provide 'set-erlang)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-erlang.el ends here

