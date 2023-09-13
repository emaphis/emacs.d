;;; set-fsharp.el -- FSharp settings on Windows
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;; Updated: Sept 11, 2023
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, fsharp, programming
;; Compatibility: Emacs 29.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  FSharp settings on Windows, using egot.
;;
;;; Code:


;;; FSharp
(use-package fsharp-mode
  :defer t
  :ensure t
  :config
  (require 'eglot-fsharp)
  (setq inferior-fsharp-program "dotnet fsi --readline-")
  (add-hook 'fsharp-mode-hook #'highlight-indentation-mode)
  (add-hook 'fsharp-mode-hook #'eglot-fsharp)  )


(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
