;;; set-scala.el ---  settings for Taureg and Meriling mose
;;
;; Filename: set-ocaml.el
;;
;; Copyright (c) 2016 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Wed Sep 28 9:05:41 2016 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings ocaml
;; Compatibility: emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  settings for taureg mode and merlin mode
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

;; opam install tuareg
;; opam install merlin
;;

;;; Code:

(use-package tuareg
  :ensure
  :mode ("\\.ml[ily?$]" . tuareg-mode) )

;; Setup environment variables using opam
;(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
;  (setenv (car var) (cadr var)))

(use-package merlin
  :config
  (bind-keys :map merlin-mode-map
             ("M-." . merlin-locate)
             ("M-," . merlin-pop-stack))
  ;; Start merlin on ocaml files
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)
  ;; Use opam switch to lookup ocamlmerlin binary
  (setq merlin-command 'opam))

;(use-package utop
;  :config
;  (add-hook 'tuareg-mode-hook 'utop-minor-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-ocaml.el ends here
