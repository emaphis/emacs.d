;;; set-erlang.el ---  Emacs' erlang settings file.
;;
;; Copyright (c) 2020
;;
;; Author: Ed Maphis
;;
;; Created: Tuesday, January 27, 2015
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings erlang
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;   Using Erlang downloade from
;;   https://www.erlang-solutions.com/resources/download.html
;;   erlang-mode from Melpa
;;   following this set up:
;;       <https://adoptingerlang.org/docs/development/setup/>
;;

;;; Code:


(use-package erlang
  :ensure t
  :hook (after-save . ivy-erlang-complete-reparse)
  :custom (ivy-erlang-complete-erlang-root "c:/apps/erl10.6/")
  :mode (("\\.erl?$" . erlang-mode)
         ("rebar\\.config$" . erlang-mode)
         ("relx\\.confoig$" . erlang-mode)
         ("sys\\.config\\.src$" . erlang-mode)
         ("sys\\.config$" . erlang-mode)
         ("\\.config\\.src?$" . erlang-mode)
         ("\\.config\\.script?$" . erlang-mode)
         ("\\.hrl?$" . erlang-mode)
         ("\\.app?$" . erlang-mode)
         ("\\.app.src?$" . erlang-mode)
         ("\\Emakefile" . erlang-mode))
  :config
  (ivy-erlang-complete-init)
  (when (eq system-type 'windows-nt)  ; windows setup
    (setq erlang-root-dir "c:/apps/erl10.6")
    (add-to-list 'exec-path "c:/apps/erl10.6/bin")))

(use-package ivy-erlang-complere
  :defer t)

(use-package company-erlang
  :ensure t)

(message "end set-erlang.el")
(provide 'set-erlang)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-erlang.el ends here
