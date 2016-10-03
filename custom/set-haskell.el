;;; haskell.el ---  My Emacs' Haskell settings.
;;
;; Filename: haskell.el
;;
;; Copyright (c) 2016 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 25 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings Haskell
;; Compatibility: Emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  My haskell settings, largely derived from the excellent tutorial:
;;  https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md
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

;;; customization directions here: https://github.com/haskell/haskell-mode/wiki
;;; also: https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md

;;; things to setup in cabal to use this mode:
;;; $ cabal install hasktags stylish-haskell present ghc-mod hlint hoogle
;;;                structured-haskell-mode

;; setup custom PATH
;;(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
;;(add-to-list 'exec-path "~/.cabal/bin")


;;; Haskell mode settings:

;;(require 'haskell-mode)

(use-package haskell-mode
  :ensure t
;  :defer t
  :init
 ; :config
 ; (custom-set-variables
 ;  '(haskell-process-suggest-remove-import-lines t)
 ;  '(haskell-process-auto-import-loaded-modules t)
 ;  '(haskell-process-log t)
 ;  '(haskell-process-type 'stack-ghci)
 ;  )
  (progn (setq haskell-mode-hook nil)
         (add-hook 'haskell-mode-hook #'interactive-haskell-mode)
;         (add-hook 'haskell-mode-hook #'hindent-mode)
         (add-hook 'haskell-mode-hook #'flycheck-mode))
;  :bind (("C-c C-l" . 'haskell-process-load-or-reload)
;         ("C-`" . 'haskell-interactive-bring)
;         ("C-c C-t" . 'haskell-process-do-type)
;         ("C-c C-i" . 'haskell-process-do-info)
;         ("C-c C-c" . 'haskell-process-cabal-build)
;         ("C-c C-k" . 'haskell-interactive-mode-clear)
;         ("C-c c"   . 'haskell-process-cabal))
  
  )

;(use-package haskell-interactive-mode)

;(add-hook 'haskell-mode-hook 'my-haskell-hook)

;(defun my-haskell-hook ()
;  (flycheck-mode 1)
;  "This is my haskell mode hook")


;; haskell interactive suttings
;(require 'haskell-interactive-mode)
;(require 'haskell-process)
;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;(custom-set-variables
;  '(haskell-process-suggest-remove-import-lines t)
;  '(haskell-process-auto-import-loaded-modules t)
;  '(haskell-process-log t))

;(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

(define-key haskell-mode-map [f8] 'haskell-navigate-imports)

;(custom-set-variables
; '(haskell-process-type 'stack-ghci))

;; Intero setup <http://commercialhaskell.github.io/intero/>
;(add-hook 'haskell-mode-hook 'intero-mode)


;; ghc-mod stuff
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-to-list 'company-backends 'company-ghc)


(message "end haskell.el")
(provide 'set-haskell)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-haskell.el ends here

