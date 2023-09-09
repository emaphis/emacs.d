;;; set-fsharp.el -- FSharp settings on Windows
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;rr55
;; Keywords: emacs settings, fsharp, programming, eglot
;; Compatibility: emacs 28.2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  FSharp settings on Windows, using egot.
;;
;;; Code:


;;; Eglot
(use-package eglot
  :defer
  :ensure t)

;;; FSharp
(use-package fsharp-mode
  :defer t
  :ensure t
  :config
  (require 'eglot)
  (require 'eglot-fsharp)
  (add-hook 'fsharp-mode-hook #'highlight-indentation-mode)
  (add-hook 'fsharp-mode-hook #'eglot-fsharp)
  )


(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
