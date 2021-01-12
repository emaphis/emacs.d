;;; set-elisp.el ---  Emacs lisp programming customizations.
;;
;; Copyright (c) 2019,2021
;;
;; Author: Ed Maphis
;;
;; Created: Aug 18 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: Emacs 27.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Elisp programming mode customizations.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;

;;; Code:

;;; Company mode and flycheck turned on by defualt.

;;; turn on eldoc mode (I think this is now default in 25)

(use-package lisp-mode
  :init
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda () (idle-highlight-mode t))))

;;; ielm - elisp repl
(use-package ielm
  :init
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode))

;;; slime nav
(use-package elisp-slime-nav
  :ensure t
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook #'elisp-slime-nav-mode)))

;;; evaluation overlays
;;; https://github.com/xiongtx/eros
;;(use-package )


(message "end set-elisp.el")
(provide 'set-elisp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-elisp.el ends here
