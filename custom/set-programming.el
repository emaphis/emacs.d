;;; set-programming.el ---  General programming settings.
;;
;; Filename: set-programming.el
;;
;; Copyright (c) 2017 Ed Maphis
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
;;  Settings and modes of general usefulness for programming.
;;  Modes and setting for specific languages will go in there
;;; own file.
;;

;;; Code:

;;; show function name in mode-line.
(which-function-mode 1)

;;; hi-light TODO:
(add-hook 'prog-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                   '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
                      1 font-lock-warning-face t)))))


;;; yasnippet
;; (use-package yasnippet
;;   :init
;;   (progn
;;     (setq yas-snippet-dirs (list (expand-file-name "snippets" user-emacs-directory)))
;;     (setq yas-prompt-functions '(yas/ido-prompt))
;;     (setq yas-indent-line 'fixed)
;;     (yas-global-mode 1))
;;   :mode ("\\.yasnippet" . snippet-mode))


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

(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  ;; enable in the *scratch* buffer
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode))

(use-package paren
  :config
  (show-paren-mode +1))

(use-package idle-highlight-mode
  :ensure t)

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; TODO:
;; (with-eval-after-load 'flycheck
;;   (flycheck-pos-tip-mode))

;;; company mode
(use-package company
  :ensure t
  :config (progn
            (global-company-mode 1)
            (setq company-tooltip-flip-when-above t)))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode))


;;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))  ; every one is doing it.

(use-package rainbow-delimiters
  :ensure t)


(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

;;; miscellaneous languages:


(use-package fsharp-mode
  :defer t)

;; C:\Program Files\dotnet\sdk\2.0.0\FSharp
;;(setq inferior-fsharp-program "\"C:\\Program Files\dotnet\sdk\2.0.0\FSharp\Fse.exe\"")
;;(setq fsharp-compiler "\"C:\Program Files\dotnet\sdk\2.0.0\FSharp\"")


;; Scheme programming
(use-package geiser
  :ensure t
  :defer t
  :config
  (add-hook 'scheme-mode-hook 'geiser-mode))

;; Common Lisp programming
(use-package slime
  :ensure t
  :defer t
  :init
  (setq slime-contribs                     '(slime-fancy)
        slime-complete-symbol-function     'slime-fuzzy-complete-symbol
        slime-net-coding-system            'utf-8-unix
        ;; slime-lisp-implementations
        ;; '((ccl64 ("/usr/local/bin/ccl64"))
        ;;   (sbcl  ("/usr/local/bin/sbcl"))
        ;;   (abcl  ("/usr/local/bin/abcl"))
        ;;   (clisp ("/usr/local/bin/clisp"))
        ;;   (ccl   ("/usr/local/bin/ccl")))
        )
  :config
  (add-hook 'slime-mode-hook #'paredit-mode)
  (add-hook 'slime-mode-hook #'rainbow-delimiters-mode)
  ;; (setq common-lisp-hyperspec-root         "/usr/local/share/doc/hyperspec/HyperSpec/"
  ;;       common-lisp-hyperspec-symbol-table (concat common-lisp-hyperspec-root "Data/Map_Sym.txt")
  ;;       common-lisp-hyperspec-issuex-table (concat common-lisp-hyperspec-root "Data/Map_IssX.txt"))
  )

(setq inferior-lisp-program "sbcl")


(message "end set-programming.el")
(provide 'set-programming)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-programming.el ends here
