;;; set-sml.el -- An Elisp file template  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2019, Ed Maphis
;;
;; Created: July 4, 2018
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, sml
;; Compatibility: emacs 30.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Settings for SML of NJ
;;  Using code if found on the Internet.
;;  Trying out Eglot and Millet modes
;;; Code:


(use-package sml-mode
  :defer t
  :mode "\\.sml\\'"
  :functions sml-prog-proc-send-buffer
  :config
  (defun my-sml-prog-proc-send-buffer ()
    "If sml repl exists, then restart it else create a new repl."
    (interactive)
    (when (get-buffer "*sml*")
      (with-current-buffer "*sml*"
        (when (get-process "sml")
          (comint-send-eof)))
      (sleep-for 0.2)
      (sml-run "sml" ""))
    (sml-prog-proc-send-buffer t))
  (bind-key "C-c C-b" 'my-sml-prog-proc-send-buffer sml-mode-map)
  (push (lambda () electric-indent-local-mode 1) sml-mode-hook))


(use-package eglot
  :ensure t
  :hook ((sml-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((sml-mode) "millet-ls")))


(provide 'set-sml)
(message "... set-sml ends ...")
;;; set-sml.el ends here
