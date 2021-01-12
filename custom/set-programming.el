;;; set-programming.el ---  General programming settings.
;;
;; Copyright (c) 2019, 2021
;;
;; Author: Ed Maphis
;;
;; Created: Aug 16 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, programming
;; Compatibility: emacs 27.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  Settings and modes of general usefulness for programming.
;;  Modes and setting for specific languages will go in there
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

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))


;;; yasnippet
;;  http://joaotavora.github.io/yasnippet/
(use-package yasnippet
  :ensure t
  ;;:pin melpa-stable
  :init
  (setq yas-snippet-dirs (list (expand-file-name "snippets" user-emacs-directory)))
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


;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

;; TODO:  maybe try flycheck-inline
;;; Show Flycheck errors in tooltip
(use-package flycheck-pos-tip
  :ensure t
  ;;:disabled t
  :after flycheck
  :config (flycheck-pos-tip-mode))


;;; company mode
;;  http://company-mode.github.io/
(use-package company
  :ensure t
  :config
  (progn
    (global-company-mode 1)
    (setq company-tooltip-flip-when-above t)))

(use-package company-quickhelp
  :ensure t
  :after company
  :bind (:map company-active-map
              ("C-c h" . company-quickhelp-manual-begin))
  :config
  (company-quickhelp-mode 1))


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


(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  ;;(setq projectile-completion-system 'ivy)
  )

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1))


(message "end set-programming.el")
(provide 'set-programming)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-programming.el ends here
