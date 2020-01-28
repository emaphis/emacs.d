;; set-python.el -- Settings for Python
;;
;; Filename: set-python.el
;;
;; Copyright (c) 2020 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Feb 4, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, python, programming.
;; Compatibility: emacs 26.3
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
  (progn  ; python programmers like 72 columns
    (set-fill-column 72)))

;; Python company completion
;; http://tkf.github.io/emacs-jedi/latest/
;; Requires: `pip install jedi`
;; Company backend for Python jedi
;; https://github.com/syohex/emacs-company-jedi
(use-package company-jedi
  :defer t
  :ensure t
  :init
  (setq-default
   jedi:complete-on-dot t
   jedi:get-in-function-call-delay 0.2))

;; Used by virtualenvwrapper.el
;;(setq venv-location (expand-file-name "~/.envs"))   ;; Change with the path to your virtualenvs
;; Used python-environment.el and by extend jedi.el
;; (setq python-environment-directory venv-location)

(message "end python.el")
(provide 'set-pthon)
;;; set-python.el ends here
