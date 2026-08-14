;;; init.el ---  Emacs' intital configuration file.  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2026 Ed Maphis
;;
;; Created: Aug 16 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: Emacs 31.1
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

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; keep the installed packages in .emacs.d/elpa;
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(package-initialize)


;; update package metadata when local cache is missing
(unless package-archive-contents
  (package-refresh-contents))


;;; load ui settings early
(load "~/.emacs.d/set-ui.el")

(setq user-full-name "Ed Maphis"
      user-mail-address "emaphis85@gmail.com")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  customizations for emacs and various emacs modes.

;; custom settings
(add-to-list 'load-path "~/.emacs.d/custom")

;; customizations not on melpa
(add-to-list 'load-path "~/.emacs.d/vendor")


;;; provides: uniquify, better settings
;;; https://git.sr.ht/~technomancy/better-defaults
(load "better-defaults.el")

;; Tell use-package to install if missing by default
;; Use `:ensure nil' in packages you *don't* want to install
(setq use-package-always-ensure t)
(setq use-package-verbose t)


;;; general editing settings - Always keep
;;; continuation of better-defaults
(load "set-base.el")

;;; Navagation - vetico, ido or ivy.
;;  Use one of either ido or ivy or vertico.
;;(load "set-ido.el")
;;(load "set-ivy.el")
(load "set-vertico.el")

;; Set nerd fonts
(load "set-nerdfonts.el")

;; Set dired options
(load "set-dired")

;;; general programming settings
(load "set-programming.el")

;;; Corfu completion
(load "set-corfu.el")

;;; elisp mode settings
(load "set-elisp.el")

;;; clojure settings
(load "set-clojure.el")

;;; Org-mode settings
(load "set-orgmode.el")

;;; Latex with Autex mode
(load "set-latex.el")

;;; FSharp
(load "set-fsharp.el")

;;; Scala Mode
(load "set-scala.el")

;;; Common Lisp
(load "set-lisp.el")

;;; Scheme
(load "set-scheme.el")

;;; sml mode
;(load "set-sml.el")

;;; Miscellaneous packages
(load "set-misc.el")

;;; Keep emacs custom-settings in separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


(message "end init.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
