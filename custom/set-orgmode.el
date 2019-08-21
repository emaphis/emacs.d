;;; set-orgmode.el -- Orgmode settings
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, org-mode
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Some org-mode settings
;;
;;; Code:

(use-package org-bullets
  :ensure
  :disabled
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;;; org babel stuff - may move it to it's own module
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)


(provide 'set-orgmode)
(message "... set-orgmode ends ...")
;;; set-orgmode.el ends here
