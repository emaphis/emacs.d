;;; set-programming.el ---  General programming settings.  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2019, 2026
;;
;; Author: Ed Maphis
;;
;; Created: Aug 16 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, programming
;; Compatibility: emacs 31.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  Settings and modes of general usefulness for programming.
;;  Modes and setting for specific languages will go in it's
;;; own file.
;;

;;; Code:

;;; show function name in mode-line.
(which-function-mode 1)

;;; hi-light TODO:
(use-package hl-todo
  :ensure t
  :config
  (setq hl-todo-highlight-puntuation ":")
  (global-hl-todo-mode))

;; (use-package aggressive-indent
;;   :ensure t
;;   :config
;;   (global-aggressive-indent-mode 1))

;;; temp
;; (setq aggressive-indent-region-function
;;       #'(lambda (x y) (let ((inhibit-message t)) (indent-region x y))))

;;; yasnippet
;;  http://joaotavora.github.io/yasnippet/
(use-package yasnippet
  :ensure t
  ;;:pin melpa-stable
  :init
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets" user-emacs-directory)))
  ;; (yas-global-mode 1)  ; TODO: error.
  )

;; https://github.com/AndreaCrotti/yasnippet-snippets
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet
  ;;:pin melpa-stable
  )


;;; smartparens
;; (use-package smartparens
;;   :config
;;   (progn
;;     (require 'smartparens-config)
;;    (setq sp-base-key-bindings 'paredit)
;;    (sp-use-paredit-bindings)
;;    ; (setq sp-base-key-bindings 'smartparens)
;;     ;(sp-use-smartparens-bindings)
;;     (smartparens-global-mode t)
;;     (show-smartparens-global-mode t) ; highlights matching pairs
;;     ))

;; http://mumble.net/~campbell/emacs/paredit/paredit.html
;; http://pub.gajendra.net/src/paredit-refcard.pdf
(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  ;; enable in the *scratch* buffer
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode))

(define-key paredit-mode-map (kbd "C-c f") #'paredit-forward-slurp-sexp) ; bunged up keyboard


(use-package paren
  :config
  (show-paren-mode +1))

(use-package idle-highlight-mode
  :ensure t)


(use-package flymake
  :ensure nil  ; built in
  :bind (([f8] . flymake-goto-next-error)
         ([f7] . flymake-goto-prev-error))
  :hook (prog-mode . (lambda () (flymake-mode t)))
  :config (remove-hook 'flymake-diagnostic-functions #'flymake-proc-legacy-flymake))


;;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))  ; every one is doing it.


(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :hook ('prog-mode . rainbow-mode))


;;; https://projectile.mx/projectile/index.html
;;; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  (setq projectile-completion-system 'ivy)
  )


;; Of course make sure you are rigged of counsel-mode
(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1))

;; NOTE: Give me back my 4 spaces tab insert using Corfu/eglot setup.
(defun insert-four-spaces ()
  "Insert exactly four spaces (for when Tab belongs to Corfu/Eglot)."
  (interactive)
  (insert "    "))

;; Recommended bindings - pick what feels natural
(global-set-key (kbd "C-c SPC")     #'insert-four-spaces)   ; safe and easy
;;(global-set-key (kbd "<backtab>")   #'insert-four-spaces)   ; Shift+Tab
;; (global-set-key (kbd "M-SPC")    #'insert-four-spaces)   ; uncomment if you want


(message "end set-programming.el")
(provide 'set-programming)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-programming.el ends here
