;;; init.el ---  Emacs' intital configuration file.
;;
;; Copyright (c) 2023 Ed Maphis
;;
;; Created: Aug 16 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: Emacs 29.2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; This is an Emacs configuration.
;; There are many like it, but this one is mine.
;;
;; This file sets up 'package' managment and
;; loads various configuration modules segregated by topic.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages and repositories

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; keep the installed packages in .emacs.d/elpa;
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(package-initialize)

;; update package metadata when local cache is missing
(unless package-archive-contents
  (package-refresh-contents))


;;; use-package setup.
;;  included in Emacs 29.1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  customizations for emacs and various emacs modes.

;; custom settings
(add-to-list 'load-path "~/.emacs.d/custom")

;; stuff not on melpa
(add-to-list 'load-path "~/.emacs.d/vendor")

;;; load ui settings early
(load "~/.emacs.d/set-ui.el")

;;; provides: uniquify, better settings
;;; https://git.sr.ht/~technomancy/better-defaults
(load "better-defaults.el")

;;; general editing settings - Always keep
;;; continuation of better-defaults
(load "set-base.el")

;;; Navagation - Ido or Ivy
;;  Use one of either ido or ivy or vertico.
;;(load "set-ido.el")
;;(load "set-ivy.el")
(load "set-vertico.el")

;;; general programming settings
(load "set-programming.el")

;;; elisp mode settings
(load "set-elisp.el")

;;; clojure settings
(load "set-clojure.el")

;;; Org-mode settings
(load "set-orgmode.el")

;;; LSP modes - use Eglot as build in package
;;(load "set-lsp.el")

;;; haskell settings - one of two:
;;(load "set-haskell.el")
;;(load "set-haskell-cabal.el")

;;; erlang mode settings
;;(load "set-erlang.el")

;;; R settings
;;(load "set-ess.el")

;;; OCaml
;;(load "set-ocaml.el")

;;; Python with jedi
;;(load "set-python.el")

;;; Ruby with robe
;;(load "set-ruby.el")

;;; FSharp
(load "set-fsharp.el")

;;; Scala Mode
;;(load "set-scala.el")

;;; Common Lisp
;;(load "set-lisp.el")

;;; C++/C
;;(load "set-cpp.el")

;;; Scheme
;;(load "set-scheme.el")

;;; sml mode
;;(load "set-sml.el")

;;; Miscellaneous packages
;;(load "set-misc.el")

;;; Keep emacs custom-settings in separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


(message "end init.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
