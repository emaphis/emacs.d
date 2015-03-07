;;; set-base.el ---  Emacs' set-base file.
;;
;; Filename: set-base.el
;;
;; Copyright (c) 2014 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 16 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 24.4
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Provides basic settings not set in vendor/better-setting.el
;; These settings are mostly useful for base text editing. Any modes
;; that don't realy belong to a programming type mode will most
;; likely be included here. Yes, I consider version control to be
;; a base editing function.
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; License:
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;; ido and smex settings
;(setq ido-use-filename-at-point nil) ;; TODO
(ido-ubiquitous-mode 1)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;;    C-f   Confirm create file in 'smex'

;;; win-switch
(require 'win-switch)
(setq win-switch-feedback-background-color "lightyellow")
(setq win-switch-feedback-foreground-color "black")
(setq win-switch-window-threshold 1)
(setq win-switch-idle-time .7)
(global-set-key "\C-xo" 'win-switch-dispatch)


;;; ace jump mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)

;;; Insert Date:
(require 'calendar)

(defun insdate-insert-current-date (&optional omit-day-of-week-p)
  "Insert today's date using the current locale.
  With a prefix argument, the date is inserted without the day of
  the week."
  (interactive "P*")
  (insert (calendar-date-string (calendar-current-date) nil
                                omit-day-of-week-p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; misc settings


;;; display column number in mode-line
(column-number-mode t)

;;; Highlight current line
(global-hl-line-mode +1)

;;; Display the column number in the mode line.
(column-number-mode t)

;;; flyspell   TODO: check whether I should use aspell.
(require 'flyspell)
(add-hook 'text-mode-hook  (lambda ()(flyspell-mode +1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; some custom key bindings

;;; Window switching.
          (global-set-key (kbd "C-x O")     ;; back one
                          (lambda () (interactive) (other-window -1)))
          (global-set-key (kbd "C-x C-o")   ;; forward two
                          (lambda () (interactive) (other-window 2)))

;;; Jump to a definition in the current file.
(global-set-key (kbd "C-x C-i") 'idomenu)

;;; toggle menu bar mode
(global-set-key (kbd "<f7>") 'menu-bar-mode)

;;; toggle whitespace mode
(global-set-key (kbd "<f6>") 'whitespace-mode)

;;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; open key bind documentation
(global-set-key (kbd "C-h C-d")
                (lambda ()
                  (interactive)
                  (find-file-other-window "~/.emacs.d/doc/key-bind.org")))

;;; insert date
(global-set-key (kbd "C-x M-d") #`insdate-insert-current-date)

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (insert (format "%s" (eval (read (current-kill 0)))))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-x M-r") #'eval-and-replace)


(provide 'set-base)
(message "end set-base.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-base.el ends here

