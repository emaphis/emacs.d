;;; set-misc.el -- Miscellaneous settings and packages  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2026 Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 31.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Miscellaneous Packages
;;
;;; Code:

;; Regular fill text:
;;; https://github.com/jschaf/emacs-lorem-ipsum
;; C-c l p - lorem-ipsum-insert-paragraphs
;; C-c l s - lorem-ipsum-insert-sentences
;; C-c l l - lorem-ipsum-insert-list
(use-package lorem-ipsum
  :config
  (lorem-ipsum-use-default-bindings))


;;; weather from wttr.in
(use-package wttrin
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Painesville,Ohio"
                                "Chardon,Ohio"))
  (setq wttrin-default-accept-language '("Accept-Language" . "en-US")))


(provide 'set-misc)
(message "... set-misc ends ...")
;;; set-misc.el ends here
