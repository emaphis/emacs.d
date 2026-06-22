;;; set-ui.el --- some basic UI settings. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2020,26 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Tuesday, October 4, 2016
;;
;;; Commentary:
;; set basic UI settings early in the process
;;
;;; CODE:

;; I don't mind the splash screen.
;; (setq inhibit-splash-screen t)

;; <F7> toggles the menu-bar
;;(menu-bar-mode -1)


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
;;(set-frame-font "Consolas 11")
;;(set-frame-font "Cascadia Code 10")
;;(set-frame-font "Ubuntu Mono 10")
;;(set-frame-font "Consolas Bold 11")
;;(set-frame-font "IBM Plex Mono 9")
;;(set-frame-font "Inconsolata 11")
;;(set-frame-font "DejaVu Sans Mono Book 11")
;;(set-frame-font "Nimbus Mono L 11")
;;(set-frame-font "Source Code Pro 10")
;;(set-frame-font "JetBrains Mono Medium")
;;(set-frame-font "Liberation Mono 10")

(set-face-attribute 'default nil
  :font "Cascadia Code"
  :height 100
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "DejaVu Sans"
  :height 100
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "Cascadia Code"
  :height 100
  :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)
;; |> <|


;;; display column number in mode-line
(column-number-mode t)

;;; global line number mode
;;(global-linum-mode -1)
(global-display-line-numbers-mode 1)

;;; Highlight current line
(global-hl-line-mode +1)


(provide 'set-ui)
(message "... set-ui ends ...")
;;; set-ui.el ends here
