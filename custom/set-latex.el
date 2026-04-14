;;; set-latex.el --- LaTeX / AUCTeX settings -*- lexical-binding: t; -*-

;;; Commentary:
;;; Created after a long hard fought afternoon with Grok.Requires MikTex and
;;; SumatrqPDF to be installed in fixed paths.

;;; CODE:

;;; === MiKTeX PATH FIX ===
(let ((miktex-bin "C:/Apps/MiKTeX/miktex/bin/x64"))
  (when (file-directory-p miktex-bin)
    (add-to-list 'exec-path miktex-bin t)
    (setenv "PATH" (concat miktex-bin ";" (getenv "PATH")))))

(require 'tex-mik)

;; Manually register XeLaTeX (needed for custom MiKTeX)
(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-command-list
                  '("XeLaTeX" "xelatex -interaction=nonstopmode %s"
                    TeX-run-command t t :help "Run xelatex") t)
     (add-to-list 'TeX-engine-alist
                  '(xetex "XeLaTeX" "xelatex" "xelatex" "xelatex"))))

(use-package auctex
  :ensure t
  :defer t
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-engine 'xetex
        TeX-source-correlate-mode t
        TeX-source-correlate-method 'synctex)

  :config
  ;; SumatraPDF (your custom location)
  (setq TeX-view-program-list
        '(("SumatraPDF" ("\"C:/Apps/SumatraPDF/SumatraPDF.exe\""
                         " -reuse-instance"
                         (mode-io-correlate " -forward-search %b %n ")
                         " %o"))))
  (setq TeX-view-program-selection '((output-pdf "SumatraPDF")))

  (add-hook 'LaTeX-mode-hook #'TeX-fold-mode)
  (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
  (add-hook 'LaTeX-mode-hook #'TeX-source-correlate-mode))

(use-package reftex
  :ensure t
  :config
  (setq reftex-plug-into-AUCTeX t
        reftex-label-alist '(AMSTeX)))

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode))

(provide 'set-latex)
;;; set-latex.el ends here
