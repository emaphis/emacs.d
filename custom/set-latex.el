;;; set-latex.el --- LaTeX / AUCTeX settings -*- lexical-binding: t; -*-
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


;;; LaTeX / AUCTeX settings

;;; Force Emacs to inherit full shell environment on Windows
(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(windows-nt))
    (setq exec-path-from-shell-check-startup-files nil)
    (exec-path-from-shell-initialize)))

;;; === MiKTeX PATH FIX - MUST BE FIRST ===
(let ((miktex-bin "C:/Apps/MiKTeX/miktex/bin/x64"))
  (when (file-directory-p miktex-bin)
    (add-to-list 'exec-path miktex-bin t) ; t = append at end
    (setenv "PATH" (concat miktex-bin ";" (getenv "PATH")))
    (message "✅ Added MiKTeX to exec-path: %s" miktex-bin)))


;; Important for MiKTeX + AUCTeX
(require 'tex-mik)   ; This loads MiKTeX-specific settings


(use-package auctex
  :ensure t
  :defer t
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-engine 'xetex               ; MiKTeX supports this well
        TeX-source-correlate-mode t
        TeX-source-correlate-method 'synctex)

  :config
  ;; SumatraPDF - best for Windows
  (setq TeX-view-program-list
        '(("SumatraPDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\""
                         " -reuse-instance"
                         (mode-io-correlate " -forward-search %b %n ")
                         " %o"))))

  (setq TeX-view-program-selection
        '((output-pdf "SumatraPDF")))

  ;; Hooks
  (add-hook 'LaTeX-mode-hook #'TeX-fold-mode)
  (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
  (add-hook 'LaTeX-mode-hook #'TeX-source-correlate-mode))



(use-package auctex
  :ensure t
  :defer t
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-engine 'xetex
        TeX-source-correlate-mode t
        TeX-source-correlate-method 'synctex))
  ;; ... rest of your auctex config

;; Optional: Keep pdf-tools as fallback / for inside-Emacs viewing
(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install))

(use-package reftex
  :ensure t
  :config
  (setq reftex-plug-into-AUCTeX t
        reftex-label-alist '(AMSTeX)))


(provide 'set-latex)
(message "... set-template ends ...")
;;; set-latex.el ends here
