;;; set-ui.el --- some basic UI settings.
;;
;; Copyright (c) 2020 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Tuesday, October 4, 2016
;; 
;;; Commentary:
;; set basic UI setting early in the process
;;
;;; CODE:

;; I don't mind the splash screen.
;; (setq inhibit-splash-screen t)

;; <F7> toggles the menu-bar
;;(menu-bar-mode -1)

;; Virtual machine pparameters.
;; See: https://www.reddit.com/r/emacs/comments/brc05y/is_lspmode_too_slow_to_use_for_anyone_else/eofulix/
;; And: https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; set  scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; tab settings
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 4)            ;; but maintain correct appearance

;;(load-theme 'zenburn t)
;;(load-theme 'leuven t)
;;(load-theme 'nimbus t)
;;(load-theme 'faff t)
(load-theme 'modus-vivendi t)

;; nothing like experimenting with fonts!
;;(set-frame-font "Consolas 10")
;;(set-frame-font "Cascadia Code 9")
(set-frame-font "Ubuntu Mono 10")
;;(set-frame-font "Consolas Bold 11")
;;(set-frame-font "IBM Plex Mono 9")
;;(set-frame-font "Inconsolata 11")
;;(set-frame-font "DejaVu Sans Mono Book 9")
;;(set-frame-font "Nimbus Mono L 11")
;;(set-frame-font "Source Code Pro 10")
;;(set-frame-font "JetBrains Mono Medium")
;;(set-frame-font "Liberation Mono 10")

;;; display column number in mode-line
(column-number-mode t)

;;; global line number mode
;;(global-linum-mode -1)
(global-display-line-numbers-mode 1)

;;; Highlight current line
(global-hl-line-mode +1)

(message "... end set-ui ...")
(provide 'set-ui)
;;; set-ui.el ends here
