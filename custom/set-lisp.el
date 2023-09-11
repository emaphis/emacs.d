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
;; Scheme with Geiser.
;;
;;; Code:

;; Common Lisp programming using SBCL
;; (use-package slime
;;   :ensure t
;;   :defer t
;;   :init
;;   (setq slime-contribs                     '(slime-fancy)
;;         slime-complete-symbol-function     'slime-fuzzy-complete-symbol
;;         slime-net-coding-system            'utf-8-unix)
;;   :config
;;   (add-hook 'slime-mode-hook #'paredit-mode)
;;   (add-hook 'slime-mode-hook #'rainbow-delimiters-mode)
;;   (load (expand-file-name "~/.roswell/helper.el"))
;;   (setq common-lisp-hyperspec-root "/usr/local/share/doc/hyperspec/HyperSpec/"
;;         common-lisp-hyperspec-symbol-table (concat common-lisp-hyperspec-root "Data/Map_Sym.txt")
;;         common-lisp-hyperspec-issuex-table (concat common-lisp-hyperspec-root "Data/Map_IssX.txt")))


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

(setq inferior-lisp-program "sbcl")


(provide 'set-lisp)
(message "... set-lisp ends ...")
;;; set-lisp.el ends here
