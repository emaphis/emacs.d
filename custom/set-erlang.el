;;; set-erlang.el ---  Emacs' erlang settings file.
;;
;; Filename: set-erlang.el
;;
;; Copyright (c) 2016
;;
;; Author: Ed Maphis
;;
;; Created: Tuesday, January 27, 2015
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings erlang
;; Compatibility: emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;   Using Erlang downloade from
;;   https://www.erlang-solutions.com/resources/download.html
;;   erlang-mode from Melpa
;;   following this set up:
;;      https://gist.github.com/jaseemabid/75f5607304a8186ba228
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

(use-package erlang
  :init
  (add-to-list 'auto-mode-alist '("\\.P\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.E\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.S\\'" . erlang-mode))
  :config
  (add-hook 'erlang-mode-hook
            (lambda ()
              (setq mode-name "erl"
                    erlang-compile-extra-opts '((i . "../include"))
                    erlang-root-dir "/usr/lib/erlang"))))

;; edts

;(use-package edts
;  :init
;  (setq edts-inhibit-package-check t
;        edts-man-root "~/.emacs.d/edts/doc/18.2.1"))


(message "end set-erlang.el")
(provide 'set-erlang)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-erlang.el ends here

