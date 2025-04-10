;;; set-lisp.el -- Common Lisp settings
;;
;; Copyright (c) 2019, 2023  Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, common lsip
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Common Lisp setup using Sly and SBCL
;;
;;; Code:

;; Common Lisp programming using SBCL

(use-package lisp-mode
  :init
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook (lambda () (idle-highlight-mode t))))


;; Common Lisp programming using SBCL and Sly
(use-package sly
  :ensure t
  :init
  )

;; Enables the overlay of Common Lisp evaluation results directly into the buffer
;; https://github.com/fosskers/sly-overlay
(use-package sly-overlay
  :ensure t)


(setq inferior-lisp-program "sbcl")


(provide 'set-lisp)
(message "... set-lisp ends ...")
;;; set-lisp.el ends here
