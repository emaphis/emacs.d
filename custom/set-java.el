;;; set-java.el ---  Emacs' set-java file.
;;
;; Filename: set-java.el
;;
;; Copyright (c) 2014 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Sat Sept 3 18:12 2014 (-0400)
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
;; download and install eclim: http://eclim.org/install.html
;; requirements: JDK 1.7 or greater, Eclipse 4.4 (Luna)
;; download eclim: http://sourceforge.net/projects/eclim/files/eclim/
;; run installer: $ java -jar eclim_2.4.0.jar
;; now install emacs eclim: https://github.com/senny/emacs-eclim
;; now start the server in ~/eclipse/eclimd
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

(require 'eclim)
(global-eclim-mode)

;;; control eclim:
(require 'eclimd)

;;; nonstandard eclipse installation area:
(custom-set-variables
  '(eclim-eclipse-dirs '("~/eclipse.bck"))
  '(eclim-executable "~/eclipse.bck/eclim"))

;;; Displaying compilation error messages in the echo area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;;; Company-mode
;(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flymake settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flymake)

;;(setq flymake-log-level -1) ;; 3 is debug

;; On the fly checkstyle & pmd checking
(defun my-java-flymake-init ()
  (list "java-check.sh"
        (list (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-with-folder-structure))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.java$" my-java-flymake-init flymake-simple-cleanup))


(message "end set-java.el")
(provide 'set-java)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-java.el ends here

