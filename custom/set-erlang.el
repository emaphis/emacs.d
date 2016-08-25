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
;;   Using erlang downloade from erlang.org
;;   erlang-mode using local copy
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

;; Set up erlang mode -- use local copy
;(setq load-path (cons "/usr/lib/erlang/lib/tools-2.8.3/emacs"  load-path))
;(setq erlang-root-dir "/usr/lib/erlang")
;(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;(setq erlang-man-root-dir "/usr/lib/erlang/man")
;(require 'erlang-start)


;; Set up flycheck
;; advice from: http://www.lambdacat.com/post-modern-emacs-setup-for-erlang/
;;(flycheck-define-checker erlang-otp
;;  "An Erlang syntax checker using the Erlang interpreter."
;;  :command ("erlc" "-o" temporary-directory "-Wall"
;;            "-I" "../include" "-I" "../../include"
;;            "-I" "../../../include" source)
;;  :error-patterns
;;  ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
;;   (error line-start (file-name) ":" line ": " (message) line-end)))

;;(add-hook 'erlang-mode-hook
;;          (lambda ()
;;            (flycheck-select-checker 'erlang-otp)
;;            (flycheck-mode)))

;;(require 'erlang-flymake)

;; edts
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (company-mode -1)
  (flycheck-mode -1)
  (require 'edts-start))


(message "end set-erlang.el")
(provide 'set-erlang)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-erlang.el ends here

