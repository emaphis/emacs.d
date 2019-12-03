;;; set-scala.el ---  settings for Taureg and Meriling mose
;;
;; Filename: set-ocaml.el
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Wed Sep 28 9:05:41 2016 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings ocaml
;; Compatibility: emacs 26.3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  settings for taureg mode, merlin mode, utop mode
;;
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
;; Sugestions from:
;;   https://github.com/ocaml/tuareg
;;   https://github.com/the-lambda-church/merlin/wiki/emacs-from-scratch
;;   https://github.com/kuwze/emacs-reasonml-ocaml/blob/master/init.el.org

;; opam install tuareg
;; opam install merlin
;; opam install utop
;; opam install ocp-indent

;;; Code:

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))))

(load "C:/Users/emaphis/home/.opam/ocaml-variants.4.08.0+mingw64c/share/emacs/site-lisp/tuareg-site-file")

;;(use-package ocp-indent)

;; tuareg provides ocaml mode
(use-package tuareg
  :ensure
  :config
  ;;(add-hook 'before-save-hook 'ocp-indent-buffer nil t)
  (add-hook 'tuareg-mode-hook #'electric-pair-local-mode)
  :mode ("\\.ml[ily?$]" . tuareg-mode))

;; Setup environment variables using opam
;(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
;  (setenv (car var) (cadr var)))

;; merlin provides ide capability
(use-package merlin
  :ensure t
  :custom
  (merlin-command 'opam)
  (company-quickhelp-mode t)
  :config
  ;; Start merlin on ocaml files
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  (add-hook 'merlin-mode-hook #'company-mode)
 ; (setq merlin-error-after-save nil)
  )

;; utop provides an advanced repl
(use-package utop
  :ensure
  :config
  (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
  (add-hook 'tuareg-mode-hook 'utop-minor-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-ocaml.el ends here
