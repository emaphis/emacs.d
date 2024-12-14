;;; set-clojure.el --- clojure module settings file
;;
;; Filename: set-clojure.el
;;
;; Copyright (c) 2023 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Aug 18 2014
;; Updated: May 21 2024
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: Emacs settings, Clojure, Programming
;; Compatibility: Emacs 29.2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  Emacs modules and settings for clojure development.
;;

;;; Code:

;;; customizations are mostly from: https://docs.cider.mx/cider/index.html


;;(require 'clojure-mode)
(use-package clojure-mode
  :ensure t
  :defer t
  :config
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  ;;(require 'flycheck-clj-kondo)
  )


;;(require 'cider)
(use-package cider
  :ensure t
  :defer t
  :config
  ;; Mode related stuff
  (add-hook 'cider-mode-hook #'eldoc-mode)
  ;; REPL related stuff
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-result-prefix ";; => ")
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))


;; (use-package clj-refactor
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'clojure-mode-hook (lambda ()
;;                                  (clj-refactor-mode 1)
;;                                  ;; insert keybinding here
;;                                  ))
;;   (cljr-add-keybindings-with-prefix "C-c C-r")
;;   (setq yas-minor-mode 1))

(use-package cider-eval-sexp-fu
  :ensure t
  :defer t)

;;; Linters
(use-package flymake-kondor
  :ensure t
  :defer t
  :hook (clojure-mode . flymake-kondor-setup))

;;(require #'flymake-kondor)
(add-hook 'clojure-mode-hook #'flymake-kondor-setup)


(message "...end set-clojure.el")
(provide 'set-clojure)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-clojure.el ends here
