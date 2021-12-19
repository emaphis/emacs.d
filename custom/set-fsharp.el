;;; set-fsharp.el -- FSharp settings on Windows
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, fsharp, programming, eglot
;; Compatibility: emacs 27.2
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
  ;;(add-hook 'fsharp-mode-hook #'highlight-indentation-mode)
  ;;  (add-hook 'fsharp-mode-hook #'eglot-fsharp)
  )

(require 'eglot-fsharp)

;; (use-package eglot-fharp
;;   :defer t
;;   :ens)

;; "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.1\\Framework\\v4.0\\fsi.exe\""
;; "\"C:\\Program Files\\dotnet\\sdk\\2.1.503\\FSharp\\fsi.exe\""

;; "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.1\\Framework\\v4.0\\fsc.exe\""
;; "\"C:\\Program Files\\dotnet\\sdk\\2.1.503\\FSharp\\fsc.exe\""


(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
