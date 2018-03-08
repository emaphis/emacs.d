;;; set-base.el ---  Emacs' set-base file.
;;
;; Filename: set-base.el
;;
;; Copyright (c) 2018 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Aug 16 2014
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

;;; Code:

;;; ido and smex settings

;(setq ido-use-filename-at-point nil) ;; TODO
;(ido-ubiquitous-mode 1)

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

(use-package imenu-anywhere
  :ensure t
  :bind (("C-c i" . imenu-anywhere)
         ("s-i" . imenu-anywhere)))



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


;;; Which key
(use-package which-key
  :ensure t
  :config (which-key-mode +1)
  (setq which-key-idle-delay 1.2))

(use-package undo-tree
  :ensure t
  :config
  ;; autosave the undo-tree history
  (setq undo-tree-history-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq undo-tree-auto-save-history t))


;;; Documentation modes

(use-package markdown-mode
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :defer t)


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

;;; flyspell
(use-package flyspell
   :config
   (when (eq system-type 'windows-nt)
     (add-to-list 'exec-path "c:/apps/hunspell/bin/"))
   (setq ispell-program-name "hunspell") ; use hunspell instead of ispell
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
