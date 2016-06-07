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
;; Keywords: emacs settings clojure
;; Compatibility: emacs 24.4
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

(require 'clojure-mode)
(require 'cider)

;; REPL related stuff

;; REPL history file
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; nice pretty printing
(setq cider-repl-use-pretty-printing t)

;; nicer font lock in REPL
;;(setq cider-repl-use-clojure-font-lock t)

;; result prefix for the REPL
(setq cider-repl-result-prefix ";; => ")

;; never ending REPL history
(setq cider-repl-wrap-history t)

;; looong history
(setq cider-repl-history-size 3000)

;; eldoc for clojure
(add-hook 'cider-mode-hook #'eldoc-mode)

;; error buffer not popping up
(setq cider-show-error-buffer nil)

;; company mode for completion
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; paredit
;;(add-hook 'clojure-mode-hook #'paredit-mode)
;;(add-hook 'cider-repl-mode-hook #'paredit-mode)

;; hl-sexp
(add-hook 'clojure-mode-hook #'hl-sexp-mode)

;; flycheck for clojure
;(require 'flycheck-clojure)
;(eval-after-load 'flycheck '(flycheck-clojure-setup))

;; clojure refactor
;;(require 'multiple-cursors)
;;(require 'dash)
;;(require 'clj-refactor)

;;; midje stuff
;;; A function for creating midje facts from cider repl output:
;;  brittle: it requires that the cider-repl-result-prefix be set to "=>"
;;           and that the clojure buffer is before the repl in window order.
(defun cem-extract-midje-fact ()
  "Extract the repl output  and generate a midje fact."
  (interactive)
  (let (pt1 pt1 my-str)
    (setq pt1 (point))
    (search-forward "=>")
    (end-of-line)
    (setq pt2 (point))
    (setq my-str (buffer-substring pt1 pt2))
    (other-window -1)
    (insert (concat  "(fact "  my-str ")"))
    (newline)
    (previous-line)
    (tab-indent-or-complete)
    (next-line)
    (move-beginning-of-line 1)
    (tab-indent-or-complete)
    (other-window +1)
    (next-line)))

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (define-key cider-repl-mode-map
              (kbd "C-c a") 'cem-extract-midje-fact)))

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (fact 'defun)
     (facts 'defun)
     (against-background 'defun)
     (provided 0)))

(add-hook 'clojure-mode-hook 'midje-colorize)
(defun midje-colorize ()
  (flet ((f (keywords face)
            (cons (concat "\\<\\("
                          (mapconcat 'symbol-name keywords "\\|")
                          "\\)\\>")
                  face)))
    (font-lock-add-keywords
     nil
     (list (f '(fact facts future-fact future-facts tabular provided)
              'font-lock-keyword-face)
           (f '(just contains has has-suffix has-prefix
                     truthy falsey anything exactly roughly throws)
              'font-lock-type-face)
           '("=>\\|=not=>" . font-lock-negation-char-face) ; arrows
           '("\\<\\.+[a-zA-z]+\\.+\\>" . 'font-lock-type-face))))) ; metaconstants

;; outputs value of sexp in the edit buffer
(global-set-key (kbd "M-p") 'cider-eval-print-last-sexp)


(message "end set-clojure.el")
(provide 'set-clojure)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-clojure.el ends here
