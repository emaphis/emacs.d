;;; init.el ---  Emacs' intital configuration file.
;;
;; Filename: init.el
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Aug 16 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file sets up 'package' managment and
;; loads various configuration files.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

;; load ui settings early
(load "~/.emacs.d/set-ui.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages and repositories

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(package-initialize)

;; update package metadata when local cache is missing
(unless package-archive-contents
  (package-refresh-contents))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  customizations for emacs and various emacs modes.

;; custom settings
(add-to-list 'load-path "~/.emacs.d/custom")

;; stuff not on melpa
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;  provides: ido, uniquify, better settings
(load "better-defaults.el")


;;; use package

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

;;; general editing settings
;;; continuation of better-defaults
(load "set-base.el")

;;; general programming settings
(load "set-programming.el")

;;; elisp mode settings
(load "set-elisp.el")

;;; clojure settings
(load "set-clojure.el")

;;; haskell settings - one of two:
;;(load "set-haskell.el")
;;(load "set-haskell-cabal.el")

;;; scala language settings
;(load "set-scala.el")

;;; java mode settings
;(load "set-java.el")

;;; erlang mode settings
;;(load "set-erlang.el")

;;; R settings
;(load "set-ess.el")

;;; OCaml
;;(load "set-ocaml.el")

;;; Python with jedi
(load "set-python.el")

;;; FSharp
;; (use-package fsharp-mode
;;   :config
;;   (if (eq system-type 'windows-nt)
;;       (setq inferior-fsharp-program
;;             "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.1\\Framework\\v4.0\\fsi.exe\"")
;;     (setq fsharp-compile-command
;;           "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.1\\Framework\\v4.0\\fsc.exe\"")))

;;; Ruby
;;(use-package ruby-mode
;;  :config
;;  (add-hook 'ruby-mode-hook #'subword-mode))


;;(use-package robe
;;  :defer t
;;  :ensure t
;;  :init
;;  (progn
;;    (add-hook 'ruby-mode-hook #'robe-mode)
;;    (with-eval-after-load 'company
;;      (add-to-list 'company-backends 'company-robe))))

;;; SML stuff

;; (use-package sml-mode
;;   :defer t
;;   :mode "\\.sml\\'"
;;   :functions sml-prog-proc-send-buffer
;;   :config
;;   (defun my-sml-prog-proc-send-buffer ()
;;     "If sml repl exists, then restart it else create a new repl."
;;     (interactive)
;;     (when (get-buffer "*sml*")
;;       (with-current-buffer "*sml*"
;;         (when (get-process "sml")
;;           (comint-send-eof)))
;;       (sleep-for 0.2)
;;       (sml-run "sml" ""))
;;     (sml-prog-proc-send-buffer t))
;;   (bind-key "C-c C-b" 'my-sml-prog-proc-send-buffer sml-mode-map))

;; (require 'company-sml)
;; (add-hook 'company-sml 'company-sml-setup)

;; (use-package flycheck-sml)

;;; Keep emacs custom-settings in separate file
(setq custom-file "~/.emacs.d/custom/set-custom.el")
(load custom-file)

;(global-set-key (kbd "<f7>") 'menu-bar-mode)

(message "end init.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
