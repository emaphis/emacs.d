;;; set-programming.el ---  General programming settings.
;;
;; Filename: set-programming.el
;;
;; Copyright (c) 2014 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 16 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 24.4
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  Settings and modes of general usefulness for programming.
;;  Modes and setting for specific languages will go in there
;;; own file.
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

;;; show function name in mode-line.
(which-function-mode 1)

;;; hi-light TODO:
(add-hook 'prog-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                   '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
                      1 font-lock-warning-face t)))))

;;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/snippets")))

;;; smart parens
(require 'smartparens-config)
(sp-use-smartparens-bindings)
(smartparens-global-mode t)
(show-smartparens-global-mode t) ; highlights matching pairs
(setq sp-highlight-pair-overlay nil) ; will experiment later



(message "end set-programming.el")
(provide 'set-programming)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-programming.el ends here
