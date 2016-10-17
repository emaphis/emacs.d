;;; set-clojure.el --- clojure module settings file
;;
;; Filename: set-clojure.el
;;
;; Copyright (c) 2016 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 18 9:41:00 2014 (-0400)
;; Updated: Sun May 22, 2016
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: Emacs settings Clojure
;; Compatibility: Emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  Emacs modules and settings for clojure development.
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

;;; customizations are mostly from: http://cider.readthedocs.io/en/latest/

;;(require 'clojure-mode)
(use-package clojure-mode
;  :ensure t
  :defer t
  :config
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  ;;(add-hook 'clojure-mode-hook #'hl-sexp-mode)
  )


;;(require 'cider)
(use-package cider
;  :ensure t
  :defer t
  :config
  ;; Mode related stuff
  (add-hook 'cider-mode-hook #'company-mode)
  ;; REPL related stuff
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-result-prefix ";; => ")
  ;;(add-hook 'cider-mode-hook #'eldoc-mode) ; maybe don't need?
  (add-hook 'cider-repl-mode-hook #'company-mode))

;; outputs value of sexp in the edit buffer
;;(global-set-key (kbd "M-p") 'cider-eval-print-last-sexp)

;;(use-package clj-refactor)

(message "end set-clojure.el")
(provide 'set-clojure)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-clojure.el ends here
