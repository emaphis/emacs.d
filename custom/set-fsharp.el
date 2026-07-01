;;; set-fsharp.el -- FSharp settings on Windows  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2019,26 Ed Maphis
;;
;; Created: Feb 7, 2019
;; Updated: June 24, 2026
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, fsharp, programming
;; Compatibility: Emacs 31.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  FSharp settings on Windows, using eglot, and fharp-ts-mode.
;;
;;  See: https://arialdomartini.github.io/emacs-fsharp
;;
;; Install F#  lsp server manually: dotnet tool install --global fsautocomplete

;;; Code:

;;; FSharp

;; See: https://bbatsov.github.io/fsharp-ts-mode/
(use-package fsharp-ts-mode
  ;;:ensure t
  :hook ((fsharp-ts-mode . fsharp-ts-repl-minor-mode)
         (fsharp-ts-mode . fsharp-ts-dotnet-mode)
         (fsharp-ts-mode . eglot-ensure)
         ;;(fsharp-ts-mode . prettify-symbols-mode) ;; using a font with ligatures
         )
  :config
  (require 'fsharp-ts-eglot)
  (require 'fsharp-ts-lens)
  (require 'fsharp-ts-info)
  (add-hook 'fsharp-ts-mode-hook #'fsharp-ts-lens-mode)
  (add-hook 'fsharp-ts-mode-hook #'fsharp-ts-info-mode)
  (setq fsharp-ts-eglot-pipeline-hints t)
  (add-hook 'fsharp-ts-mode-hook #'eglot-inlay-hints-mode)
  (setq fsharp-ts-guess-indent-offset t))


(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
