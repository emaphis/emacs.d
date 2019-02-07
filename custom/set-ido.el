;;; set-ido.el -- Ido navagation mode settings
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, navagation, ido-mode
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Ido and smex mode settings
;;
;;; Code:

;; TODO: ;;(setq ido-use-filename-at-point nil) 
;;(ido-ubiquitous-mode 1)

(use-package ido
  :ensure t
  :config
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10
        ido-save-directory-list-file (expand-file-name "ido.hist" maph-savefile-dir)
        ido-default-file-method 'selected-window
        ido-auto-merge-work-directories-length -1)
  (ido-mode +1))

;; see ido-completing-read
;; https://github.com/DarwinAwardWinner/ido-ubiquitous#version-40-changes
(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode +1))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode +1)
  ;; disable ido faces to see flx highlights
  (setq ido-use-faces nil))


;;; smex
(use-package smex
  :ensure t
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ;; This is your old M-x.
         ("C-c C-c M-x". execute-extended-command)))

;;; *** C-f   Confirm create file in 'smex' ***



(provide 'set-ido)
(message "... set-ido ends ...")
;;; set-ido.el ends here
