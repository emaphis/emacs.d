;;; set-clojure.el --- clojure module settings file
;;
;; Filename: set-clojure.el
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Aug 18 2014
;; Updated: Feb, 5 2018
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: Emacs settings, Clojure, Programming
;; Compatibility: Emacs 26.1
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
  ;;(add-hook 'clojure-mode-hook #'hl-sexp-mode)
  )


;;(require 'cider)
(use-package cider
  :ensure t
  :defer t
  :config
  ;; Mode related stuff
;  (add-hook 'cider-mode-hook #'company-mode)
  ;; REPL related stuff
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-result-prefix ";; => ")
  (setq cider-default-cljs-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))

;; outputs value of sexp in the edit buffer
;;(global-set-key (kbd "M-p") 'cider-eval-print-last-sexp)


;; (use-package clj-refactor
;;   :ensure t
;;   :config
;;   (add-hook 'clojure-mode-hook (lambda ()
;;                                  (clj-refactor-mode 1)
;;                                  ;; insert keybinding here
;;                                  ))
;;   (cljr-add-keybindings-with-prefix "C-c C-m")
;;   (setq cljr-warn-on-evaql nil))


(use-package flycheck-joker
  :ensure t)

(message "end set-clojure.el")
(provide 'set-clojure)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-clojure.el ends here
