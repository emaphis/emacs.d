;;; set-fsharp.el -- FSharp settings on Windows
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;; Updated: April 30, 2023
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, fsharp, programming
;; Compatibility: Emacs 29.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  FSharp settings on Windows, using eglot.
;;
;;; Code:

;;; FSharp
(use-package fsharp-mode
  ;;:defer t
  :ensure t
  :config
  (require 'eglot-fsharp)
  (setq inferior-fsharp-program "dotnet fsi --readline-")
  ;(setq 'fsharp-mode-hook 'highlight-indent-guides-mode)
  ;(add-hook 'fsharp-mode-hook #'highlight-indentation-)
  )



(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
