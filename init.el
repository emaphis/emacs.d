;;; init.el ---  Emacs' intital configuration file.
;;
;; Filename: init.el
;;
;; Copyright (c) 2014 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 16 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 24.4
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file sets up 'package' managment and
;; loads various configuration files.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; License:
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages and repositories
;;;
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    ;; base editing packages and settings
    ;; based on Technomancy's better-defaults.el
    ;; customized in /custom/set-base.el
    cl-lib
    dash
    s
    ido-hacks
    ido-ubiquitous
    idomenu
    smex
    magit  ;; yes, I consider vc to be part of base.
    markdown-mode
    popup
    win-switch
    rainbow-mode
    ace-jump-mode
    multiple-cursors
    undo-tree

    ;;; themes
    cyberpunk-theme
    gandalf-theme
    zenburn-theme
    solarized-theme
    monokai-theme

    ;; general programming modes including
    ;; emacs lisp addon modes.
    ;; ./custom/set-programming.el and
    ;; ./custom/set-elisp.el
    idle-highlight-mode
    yasnippet
    smartparens
    flycheck
    company
    rainbow-delimiters
    elisp-slime-nav

    ;;; clojure packages customized in
    ;;; ./custom/set-clojure.el
    clojure-mode
    cider
    clojure-mode-extra-font-locking
    midje-mode
    4clojure

    ;; haskell modules
    ;; .custom/set-haskell.el
    haskell-mode
    ghc
    company-ghc

    ;; scala programming modes
    ;; set in ./custom/set-scala.el
    scala-mode2
    ensime

    ;; java mode
    ;; ./custom/set-java.el
    emacs-eclim


    ) "Packages managed as elpa repositories.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; non packaged (vendor) code goes here:
;;;
(add-to-list 'load-path "~/.emacs.d/vendor")

;;; vendor/better-defaults.el
;;;  provides: ido, uniquify, better settings
(load "better-defaults.el")
; TODO: ido-use-virual-buffers?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  customizations for emacs and various emacs modes.
;;;
(add-to-list 'load-path "~/.emacs.d/custom")

;;; general editing settings
;;; continuation of better-defaults
(load "set-base.el")

;;; general programming settings
(load "set-programming.el")

;;; elisp mode settings
(load "set-elisp.el")

;;; clojure settings
(load "set-clojure.el")

;;; haskell settings
(load "set-haskell.el")

;;; scala language settings
(load "set-scala.el")

;;; java mode settings
(load "set-java.el")


;;; Keep emacs custom-settings in separate file
(setq custom-file "~/.emacs.d/custom/set-custom.el")
(load custom-file)


(message "end init.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
