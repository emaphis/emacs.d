;;; set-programming.el ---  General programming settings.
;;
;; Filename: set-programming.el
;;
;; Copyright (c) 2016 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 16 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 25.1
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
(use-package yasnippet
  :init
  (progn
    (setq yas-snippet-dirs (list (expand-file-name "snippets" user-emacs-directory)))
    (setq yas-prompt-functions '(yas/ido-prompt))
    (setq yas-indent-line 'fixed)
    (yas-global-mode 1))
  :mode ("\\.yasnippet" . snippet-mode))


;;; smartparens
(use-package smartparens
  :config
  (progn
    (require 'smartparens-config)
   (setq sp-base-key-bindings 'paredit)
   (sp-use-paredit-bindings)
   ; (setq sp-base-key-bindings 'smartparens)
    ;(sp-use-smartparens-bindings)
    (smartparens-global-mode t)
    (show-smartparens-global-mode t) ; highlights matching pairs
    ))

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;;; company mode
(use-package company
  :ensure t
  :config (progn
            (global-company-mode 1)
            (setq company-tooltip-flip-when-above t)))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode))


;;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))  ; every one is doing it.

(use-package rainbow-delimiters)


(message "end set-programming.el")
(provide 'set-programming)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-programming.el ends here
