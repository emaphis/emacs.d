;;; set-fsharp.el -- FSharp settings on Windows
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, fsharp, programming
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  FSharp settings on Windows.
;;
;;; Code:

;;; FSharp
(use-package fsharp-mode
  :config
  (if (eq system-type 'windows-nt)
      (setq inferior-fsharp-program
            "\"C:\\Program Files\\dotnet\\sdk\\2.1.503\\FSharp\\fsi.exe\"")
    (setq fsharp-compile-command
          "\"C:\\Program Files\\dotnet\\sdk\\2.1.503\\FSharp\\fsc.exe\"")))

;; "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.1\\Framework\\v4.0\\fsi.exe\""
;; "\"C:\\Program Files\\dotnet\\sdk\\2.1.503\\FSharp\\fsi.exe\""

;; "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.1\\Framework\\v4.0\\fsc.exe\""
;; "\"C:\\Program Files\\dotnet\\sdk\\2.1.503\\FSharp\\fsc.exe\""


(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
