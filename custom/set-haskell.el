;;; haskell.el ---  My Emacs' Haskell settings.
;;
;; Filename: haskell.el
;;
;; Copyright (c) 2016 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 25 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings Haskell
;; Compatibility: Emacs 25.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  My Haskell settings for Haskell stack
;;  https://commercialhaskell.github.io/intero/
;;  https://gist.github.com/snoyberg/3807bac2cdf276fd0aecd2f26916e025
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

;;; Code:

;;; Haskell mode settings:


;; (use-package haskell-mode               ; Haskell major mode
;;   :ensure t
;;   :defer t
;;   :config  ; like haskell-mode-hook
;; ;  (add-hook 'haskell-mode-hook #'haskell-decl-scan-mode) ; IMenu support
;;   (add-hook 'haskell-mode-hook #'haskell-auto-insert-module-template))


;; (use-package hindent                    ; Haskell indentation
;;   :ensure t
;;   :defer t
;;   :init
;;   (add-hook 'haskell-mode-hook #'hindent-mode)
;;   :config
;;   ;(validate-setq hindent-style "gibiansky")
;;   )

(use-package intero
  :ensure t
  :defer t
  :init
  (add-hook 'haskell-mode-hook 'intero-mode))

(message "end haskell.el")
(provide 'set-haskell)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-haskell.el ends here

