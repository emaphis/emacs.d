;;; set-sml.el -- An Elisp file template
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: July 4, 2018
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, sml
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Settings for SML of NJ
;;  Using code if found on the Internet.
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
  (bind-key "C-c C-b" 'my-sml-prog-proc-send-buffer sml-mode-map))

(load "company-sml.el")
(add-hook 'company-sml 'company-sml-setup)

(use-package flycheck-sml)



(provide 'set-sml)
(message "... set-sml ends ...")
;;; set-sml.el ends here
