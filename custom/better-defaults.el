;;; better-defaults.el --- Fixing weird quirks and poor defaults

;; Copyright © 2013-2016 Phil Hagelberg and contributors

;; Author: Phil Hagelberg
;; URL: https://github.com/technomancy/better-defaults
;; Version: 0.1.3
;; Created: 2013-04-16
;; Keywords: convenience

;; This file is NOT part of GNU Emacs.

;;; Commentary:
;; general settings before use-package

;;; Code:

(setq user-full-name "Ed Maphis"
      user-mail-address "emaphis85@gmail.com")

;; save dir  ???
(defconst maph-savefile-dir (expand-file-name "savefile" user-emacs-directory))

;; create the savefile dir if it doesn't exist
(unless (file-exists-p maph-savefile-dir)
  (make-directory maph-savefile-dir))


;; Newline at end of file
(setq require-final-newline t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; set coding system to prevent annoying interruptions
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)


;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))


;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; highlight the current line
(global-hl-line-mode +1)


(progn
  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  ;; https://www.emacswiki.org/emacs/SavePlace
  (save-place-mode 1)

  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer) ;; replace buffer-menu with ibuffer
  (global-set-key (kbd "M-z") 'zap-up-to-char)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        require-final-newline t
        visible-bell t
        load-prefer-newer t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))

(message "... end better-defaults ...")
(provide 'better-defaults)
;;; better-defaults.el ends here
