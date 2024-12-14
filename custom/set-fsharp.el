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


(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
