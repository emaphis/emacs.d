;;; set-elisp.el ---  Emacs lisp programming customizations.
;; 
;; Filename: set-elisp.el
;;
;; Copyright (c) 2016 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 18 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: Emacs 25.1
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;;  
;; Elisp programming mode customizations.
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

;;; Company mode and flycheck turned on by defualt.

;;; turn on eldoc mode (I think this is now default in 25)

(use-package lisp-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda () (idle-highlight-mode t))))

(use-package lisp-interaction-mode
  :init
  (add-hook 'lisp-interaction-mode-hook 'smartparens-strict-mode)
  (add-hook 'lisp-iteraction-mode-hook (lambda () (idle-highlight-mode t))))

(use-package ielm-mode
  :init
  (add-hook 'ielm-mode-hook 'smartparens-strict-mode))

;;; slime nav
(use-package elisp-slime-nav
  :ensure t
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook #'elisp-slime-nav-mode)))


(message "end set-elisp.el")
(provide 'set-elisp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-elisp.el ends here

