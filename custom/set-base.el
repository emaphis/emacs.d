;;; set-base.el ---  Emacs' set-base file.
;; 
;; Filename: set-base.el
;;
;; Copyright (c) 2014 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Aug 16 23:24:41 2014 (-0400)
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 24.4
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;;  
;; Provides basic settings not set in vendor/better-setting.el
;; These settings are mostly useful for base text editing. Any modes
;; that don't realy belong to a programming type mode will most
;; likely be included here. Yes, I consider version control to be
;; a base editing function.
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

;;; ido and smex settings
;(setq ido-use-filename-at-point nil) ;; TODO
(ido-ubiquitous-mode 1)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;;    C-f   Confirm create file in 'smex'


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; misc settings

;;; display column number in mode-line
(column-number-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; some key bindings

;;; Window switching.
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;;; Jump to a definition in the current file.
(global-set-key (kbd "C-x C-i") 'idomenu)

;;; toggle menu bar mode
(global-set-key (kbd "<f7>") 'menu-bar-mode)

;;; magit
(global-set-key (kbd "C-x g") 'magit-status)



(provide 'set-base)
(message "end set-base.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-base.el ends here

