;;; set-misc.el -- Miscellaneous settings and packages
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 27.1
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
  :ensure t
  :config
  (lorem-ipsum-use-default-bindings))


;;; weather from wttr.in
(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Painesville,Ohio"
                                "Chardon,Ohio"))
  (setq wttrin-default-accept-language '("Accept-Language" . "en-US")))


(provide 'set-misc)
(message "... set-misc ends ...")
;;; set-misc.el ends here
