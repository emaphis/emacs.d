;;; set-lisp.el -- Common Lisp settings
;;
;; Copyright (c) 2019 Ed Maphis
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
;;  Common Lisp setup using Slime and SBCL
;; TODO: Try SLY
;; Scheme with Geiser.
;;
;;; Code:

;; Common Lisp programming using SBCL
(use-package slime
  :ensure t
  :defer t
  :init
  (setq slime-contribs                     '(slime-fancy)
        slime-complete-symbol-function     'slime-fuzzy-complete-symbol
        slime-net-coding-system            'utf-8-unix)
  :config
  (add-hook 'slime-mode-hook #'paredit-mode)
  (add-hook 'slime-mode-hook #'rainbow-delimiters-mode)
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq common-lisp-hyperspec-root         "/usr/local/share/doc/hyperspec/HyperSpec/"
        common-lisp-hyperspec-symbol-table (concat common-lisp-hyperspec-root "Data/Map_Sym.txt")
        common-lisp-hyperspec-issuex-table (concat common-lisp-hyperspec-root "Data/Map_IssX.txt")))

(setq inferior-lisp-program "sbcl")

;;; Scheme with Geiser.
(use-package geiser
  :ensure t
  :config
  ;;(add-hook gieser-mode-hook #'paredit-mode)
  ;;(add-hook geiser- #'rainbow-delimiters-mode)
  )

(provide 'set-lisp)
(message "... set-lisp ends ...")
;;; set-lisp.el ends here
