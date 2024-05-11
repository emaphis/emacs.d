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
;;; Code:

;;; FSharp
(use-package fsharp-mode
  :defer t
  :ensure t
  :config
  (setq inferior-fsharp-program "dotnet fsi --readline-")
  ;;(setq 'fsharp-mode-hook 'highlight-indent-guides-mode)
  ;;(add-hook 'fsharp-mode-hook #'highlight-indentation-)
  )

(use-package eglot-fsharp
  :ensure t
  :after fsharp-mode
  :config
  (setq eglot-fsharp-server-install-dir "~/.dotnet/tools/")

  ;; Start Eglot server manually for now.
  ;;(add-hook 'fsharp-mode-hook #'eglot-ensure)

  ;; This fixes https://github.com/fsharp/emacs-fsharp-mode/issues/341
  ;; The original function used to prefix "dotnet" to the fsautocomplete path
  (defun eglot-fsharp--path-to-server ()
    "Return FsAutoComplete path."
    (file-truename (concat eglot-fsharp-server-install-dir "fsautocomplete"
                           (if (eq system-type 'windows-nt) ".exe" ""))))
  )

(provide 'set-fsharp)
(message "... set-fsharp ends ...")
;;; set-fsharp.el ends here
