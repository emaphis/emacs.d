;;; set-latex.el --- LaTeX / AUCTeX settings -*- lexical-binding: t; -*-

;;; === HARD-CODED MiKTeX PATH (your exact install) ===
(let ((miktex-bin "C:/Apps/MiKTeX/miktex/bin/x64"))
  (when (file-directory-p miktex-bin)
    (add-to-list 'exec-path miktex-bin t)
    (setenv "PATH" (concat miktex-bin ";" (getenv "PATH")))
    (message "✅ MiKTeX path added: %s" miktex-bin)))

(require 'tex-mik)   ; MiKTeX support

;; Manually ensure XeLaTeX is available (Windows + custom MiKTeX fix)
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
  ;; === SumatraPDF - Excellent for Windows ===
  (setq TeX-view-program-list
        '(("SumatraPDF" ("\"C:/Apps/SumatraPDF/SumatraPDF.exe\""
                         " -reuse-instance"
                         (mode-io-correlate " -forward-search %b %n ")
                         " %o"))))

  (setq TeX-view-program-selection
        '((output-pdf "SumatraPDF")))
  ;;(setq TeX-view-program-list '(("PDF Tools" "emacsclient -n -e \"(pdf-tools-open-file \\\"%o\\\"\")")))
  ;;(setq TeX-view-program-selection '((output-pdf "PDF Tools")))

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
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (setq pdf-view-resize-factor 1.15
        pdf-view-display-size 'fit-page))



(provide 'set-latex)
;;; set-latex.el ends here
