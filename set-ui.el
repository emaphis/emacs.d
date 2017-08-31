;;; set-ui.el --- some basic UI settings.
;; Created: Tuesday, October 4, 2016

;;; Commentary:
;; set basic UI setting early in the process


;;; CODE:

;; I'll keep menu-bar for the time being.
;(menu-bar-mode -1)

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
;;(setq-default tab-width 4)            ;; but maintain correct appearance


(load-theme 'zenburn t)
;(load-theme 'leuven t)

;; nothing like experimenting with fonts!
(set-frame-font "Consolas 10")
;(set-frame-font "Consolas Bold 11")
;(set-frame-font "Ubuntu Mono 11")
;(set-frame-font "Ubuntu Mono Bold 11")b
;(set-frame-font "Ubuntu Light 11")
;(set-frame-font "Inconsolata 11")
;(set-frame-font "DejaVu Sans Mono Book 10")
;(set-frame-font "FreeMono 11")
;(set-frame-font "Liberation Mono 10")
;(set-frame-font "Nimbus Mono L 11")
;(set-frame-font "Source Code Pro 9")


;;; display column number in mode-line
(column-number-mode t)

;;; Highlight current line
(global-hl-line-mode +1)


(provide 'set-ui)
;;; set-ui.el ends here
