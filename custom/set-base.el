;;; set-base.el ---  Emacs' set-base file.
;;
;; Filename: set-base.el
;;
;; Copyright (c) 2016 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 16 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Provides basic settings not set in vendor/better-setting.el
;; These settings are mostly useful for base text editing.  Any modes
;; that don't realy belong to a programming type mode will most
;; likely be included here.
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
;(ido-ubiquitous-mode 1)

(use-package ido
  :ensure t
  :config
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-use-filename-at-point 'guess)
  (ido-mode +1))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode +1))

;; TODO: look at flex-ido

(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; smex
(use-package smex
  :ensure t
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  :bind (("M-x" . smex)  ; This is your old M-x.
         ("M-X" . smex-major-mode-commands)
      ;;   ("C-c C-c M-x". execute-extended-command--last-typed)
         ))

;;; *** C-f   Confirm create file in 'smex' ***


;;; ace jump mode
(use-package ace-jump-mode
  :ensure t
  :bind ("C-c SPC" . ace-jump-mode))

;;; multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-ths)
         ("C-c C-<" . mc-mark-all-like-this)))


;;; Insert Date:
(require 'calendar)

(defun insdate-insert-current-date (&optional omit-day-of-week-p)
  "Insert today's date using the current locale.
  With a prefix argument, the date is inserted without the day of
  the week."
  (interactive "P*")
  (insert (calendar-date-string (calendar-current-date) nil
                                omit-day-of-week-p)))
;;; insert date
(global-set-key (kbd "C-x M-d") #'insdate-insert-current-date)


;(use-package calendar
;  :ensure t
;  :config
;  (defun insdate-insert-current-date (&optional omit-day-of-week-p)
;    "Insert today's date using the current locale.
;     With a prefix argument, the date is inserted without the day of
;     the week."
;     (iteractive "P*")
;     (insert (calendar-date-string (calendar-current-date) nil
;                                   omit-day-of-week-p)))
;  :bind ("C-x M-d" .  insdate-insert-current-date)
;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; misc settings

;;; display column number in mode-line
(column-number-mode t)

;;; Highlight current line
(global-hl-line-mode +1)

;;; Display the column number in the mode line.
(column-number-mode t)

;;; flyspell   TODO: check whether I should use aspell.
;(require 'flyspell)
;(add-hook 'text-mode-hook  (lambda ()(flyspell-mode +1)))
(use-package flyspell
  :config
  (add-hook 'text-mode-hook #'flyspell-mode)
  (add-hook 'prog-mode-hook #'flyspell-prog-mode))


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


;;; open key bind documentation
(global-set-key (kbd "C-h C-d")
                (lambda ()
                  (interactive)
                  (find-file-other-window "~/.emacs.d/doc/key-bind.org")))


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

