;;; set-ruby.el -- Ruby Settings
;;
;; Copyright (c) 2020 Ed Maphis
;;
;; Created: Jul 4, 2018
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, Ruby, Programming
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Ruby settings using inferior Ruby
;;
;;; Code:

;;; Ruby
(use-package ruby-mode
  :config
  (add-hook 'ruby-mode-hook #'subword-mode))

(use-package inf-ruby
  :ensure t
  :config
  (add-hook 'ruby-mode-hook #'inf-ruby-minor-mode))

;;(use-package robe
;;  :defer t
;;  :ensure t
;;  :init
;;  (progn
;;    (add-hook 'ruby-mode-hook #'robe-mode)
;;    (with-eval-after-load 'company
;;      (add-to-list 'company-backends 'company-robe))))



(provide 'set-ruby)
(message "... set-ruby ends ...")
;;; set-ruby.el ends here
