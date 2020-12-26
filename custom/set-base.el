;;; set-base.el ---  Emacs' set-base file.
;;
;; Filename: set-base.el
;;
;; Copyright (c) 2020 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Aug 16 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 27.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Provides basic text editing utilities and document modes.
;; These settings and better-defaults provide basic functionality.
;; Any modes aren't really useful for programming type mode will most
;; likely be included here.
;;

;;; Code:

;; TODO: list-buffers vs. ibuffer
;;(defalias #'list-buffers #'ibuffer)


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


;; TODO: smooth scrolling
;; (use-package smooth-scrolling
;;   :ensure
;;   :config
;;   (smooth-scrolling-mode 1))


(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  ;;(setq beacon-color "#666600")
  )


(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))


;;; Documentation modes

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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


;;; Find unbound keys
;;  https://www.emacswiki.org/emacs/unbound.el
(load "unbound.el")

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

;;; revert buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

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
(message "... end set-base.el ...")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-base.el ends here
