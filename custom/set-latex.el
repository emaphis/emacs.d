;;; set-latex.el -- An Elisp file template
;;
;; Copyright (c) 2026 Maphis
;;
;; Created: April 14, 2026
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs LaTeX autex settings
;; Compatibility: emacs 30.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;; Setup LaTex mode
;;
;;; Code:


;;; set-latex.el --- LaTeX / AUCTeX settings

(use-package auctex
  :ensure t
  :defer t
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-engine 'xetex)          ; or 'luatex if you prefer

  :config
  ;; Basic viewer setup
  (setq TeX-view-program-list '(("PDF Tools" "emacsclient -n -e \"(pdf-tools-open-file \\\"%o\\\"\")")))
  (setq TeX-view-program-selection '((output-pdf "PDF Tools")))

  ;; Enable folding, math input, etc.
  (add-hook 'LaTeX-mode-hook #'TeX-fold-mode)
  (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook #'turn-on-reftex)

  ;; RefTeX (great for labels, citations, TOC)
  (use-package reftex
    :ensure t
    :config
    (setq reftex-plug-into-AUCTeX t
          reftex-label-alist '(AMSTeX)))  ; good for amsmath

  ;; Optional but very nice
  (setq TeX-source-correlate-mode t
        TeX-source-correlate-method 'synctex))

;;; Setup PDF tools
(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install))


(provide 'set-latex)
(message "... set-template ends ...")
;;; set-latex.el ends here
