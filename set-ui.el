;;; set-ui.el --- some basic UI settings.
;; Created: Tuesday, October 4, 2016

;;; Commentary:
;; set basic UI setting early in the process


;;; CODE:

(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;(load-theme 'zenburn t)
(load-theme 'leuven t)

;; nothing like experimenting with fonts!
;(set-frame-font "Consolas 11")
;(set-frame-font "Consolas Bold 11")
;(set-frame-font "Ubuntu Mono 11")
;(set-frame-font "Ubuntu Mono Bold 11")
;(set-frame-font "Ubuntu Light 11")
;(set-frame-font "Inconsolata 11")
;(set-frame-font "DejaVu Sans Mono Book 10")
;(set-frame-font "FreeMono 11")
;(set-frame-font "Liberation Mono 10")
;(set-frame-font "Nimbus Mono L 11")
(set-frame-font "Source Code Pro 9")


(provide 'set-ui)
;;; set-ui.el ends here
