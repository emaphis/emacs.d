;; set-python.el -- An Elisp file template
;;
;; Filename: set-python.el
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Feb 4, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, python, programming.
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  Python settings.
;;  use packages 'jedi' for autocompletion for Python code
;;  Install: pip install jedi epc
;;
;;; Code:


(use-package python
  :ensure t
  :commands python-mode
  :config
  (progn  ; python programmers like 7no2 columns
    (set-fill-column 72)))

(use-package jedi
  :ensure t
  :commands jedi:setu
  :init
  (progn
    (setq jedi:use-shortcuts t)
    (setq jedi:complete-on-dot t)))

(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook
	    (lambda () (add-to-list 'company-backends 'company-jedi))))

(message "end python.el")
(provide 'set-pthon)
;;; set-python.el ends here
