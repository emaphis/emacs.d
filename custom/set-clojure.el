;;; set-clojure.el --- clojure module settings file
;;
;; Filename: set-clojure.el
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Aug 18 2014
;; Updated: Aug 13 2020
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: Emacs settings, Clojure, Programming
;; Compatibility: Emacs 27.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  Emacs modules and settings for clojure development.
;;

;;; Code:

;;; customizations are mostly from: http://cider.readthedocs.io/en/latest/


;;(require 'clojure-mode)
(use-package clojure-mode
  :ensure t
  :defer t
  :config
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (require 'flycheck-clj-kondo)
  ;;(add-hook 'clojure-mode-hook #'hl-sexp-mode)
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

;; TODO: check out this package:
;; <https://github.com/wandersoncferreira/ivy-clojuredocs>

;; (use-package cider-eval-sexp-fu
;;   :ensure t
;;   :defer t)

;;; Linters
;; (use-package flycheck-joker
;;   :ensure t)

(use-package flycheck-clj-kondo
  :ensure t
  :defer t)


(message "...end set-clojure.el")
(provide 'set-clojure)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-clojure.el ends here
