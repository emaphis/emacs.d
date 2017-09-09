;;; set-haskell-cabal.el ---  My Emacs' Haskell settings for cabal.
;;
;; Filename: haskell.el
;;
;; Copyright (c) 2017 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sep 6 2017
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings Haskell Cabal GHCi GHC-MOD
;; Compatibility: Emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  My haskell settings, largely derived from the excellent tutorial:
;;  https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md
;;  Using Cabal, GHCi, GHC-MOD for my development environment.
;;
;; (*** NOTE: haven't set up ghc-mode yet)
;;
;; Trouble shooting:
;;   If the REPL ever goes funny, you can clear the command queue via:
;; M-x haskell-process-clear
;;   Alternatively, you can just restart the process:
;; M-x haskell-process-restart
;;   Dump the  haskell-process  state:
;; M-: (haskell-process)
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

;;; the 'use-package' version is shamelessly lifted from:
;;; "https://github.com/lunaryorn/.emacs.d/blob/master/init.el"
;;; customization directions here: https://github.com/haskell/haskell-mode/wiki
;;; also: https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md

;;; things to setup in stack to use this mode:
;;; $ stack install hasktags stylish-haskell present hlint hoogle
;;;                structured-haskell-mode

;;; Haskell mode settings:


;; Imports
;(define-key haskell-mode-map (kbd "<f8>") 'haskell-navigate-imports)

(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

;;(setq haskell-compile-cabal-build-command "stack build") ; if using stack

;;; haskell-interactive-mode
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
;; haskell-mode (interactive) bindings
;;(define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
;;(define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; cabal-mode bindings
(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; GHCi process type
(custom-set-variables '(haskell-process-type 'cabal-repl))


(message "end haskell-cabal.el")
(provide 'set-haskell-cabal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-haskell-cabal.el ends here
