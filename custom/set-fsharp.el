;;; set-fsharp.el -- FSharp settings on Windows
;;
;; Copyright (c) 2019,24 Ed Maphis
;;
;; Created: Feb 7, 2019
;; Updated: May 11, 2024
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, fsharp, programming
;; Compatibility: Emacs 29.2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  FSharp settings on Windows, using eglot.
;;
;;  See: https://arialdomartini.github.io/emacs-fsharp
;;
;; Install F#  lsp server manually: dotnet tool install --global fsautocomplete

;;; Code:

;;; FSharp
(use-package fsharp-mode
  :defer t
  :ensure t)

(use-package eglot-fsharp
  :ensure t
  :after fsharp-mode
  :config

  ;; Install fsautocomplete manually.
 ;; (add-hook 'fsharp-mode-hook #'eglot-ensure)  ;; let eglot install server.
  )


;; (use-package treesit-auto
;;   :config
;;   (global-treesit-auto-mode))


;; (use-package fsharp-ts-mode
;;   :ensure t
;;   :hook ((fsharp-ts-mode . fsharp-ts-repl-minor-mode)
;;          (fsharp-ts-mode . fsharp-ts-dotnet-mode)
;;          (fsharp-ts-mode . eglot-ensure)
;;          (fsharp-ts-mode . prettify-symbols-mode))
;;   :config
;;   (require 'fsharp-ts-eglot)
;;   (require 'fsharp-ts-lens)
;;   (require 'fsharp-ts-info)
;;   (add-hook 'fsharp-ts-mode-hook #'fsharp-ts-lens-mode)
;;   (add-hook 'fsharp-ts-mode-hook #'fsharp-ts-info-mode)
;;   (setq fsharp-ts-guess-indent-offset t))


(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
