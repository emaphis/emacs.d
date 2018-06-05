;;; set-erlang.el ---  Emacs' erlang settings file.
;;
;; Filename: set-erlang.el
;;
;; Copyright (c) 2018
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
;; Look here: http://www.lambdacat.com/post-modern-emacs-setup-for-erlang/
;;

;;; Code:

;; (use-package erlang
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.P\\'" . erlang-mode))
;;   (add-to-list 'auto-mode-alist '("\\.E\\'" . erlang-mode))
;;   (add-to-list 'auto-mode-alist '("\\.S\\'" . erlang-mode))
;;   :config
;;   (add-hook 'erlang-mode-hook
;;             (lambda ()
;;               (setq mode-name "erl"
;;                     erlang-compile-extra-opts '((i . "../include"))
;;                     erlang-root-dir "/usr/lib/erlang"))))

(use-package erlang
  :ensure t
  :defer t
  :config
  (when (eq system-type 'windows-nt)
    (setq erlang-root-dir "c:/apps/erl9.2")
    (add-to-list 'exec-path "c:/apps/erl9.2/bin")))

;; edts

;(use-package edts
;  :init
;  (setq edts-inhibit-package-check t
;        edts-man-root "~/.emacs.d/edts/doc/18.2.1"))

;; distel
;;(push "~/.emacs.d/distel/elisp/" load-path)
;;(require 'distel)
;;(distel-setup)

;; prevent annoying hang-on-compile
;;(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
;;(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
;; (setq erl-nodename-cache
;;       (make-symbol
;;        (concat
;;         "emacs@"
;;         ;; Mac OS X uses "name.local" instead of "name", this should work
;;         ;; pretty much anywhere without having to muck with NetInfo
;;         ;; ... but I only tested it on Mac OS X.
;;                 (car (split-string (shell-command-to-string "hostname"))))))

;; (push "~/.emacs.d/company-distel/" load-path)
;; (require 'company-distel)
;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends 'company-distel))


(message "end set-erlang.el")
(provide 'set-erlang)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-erlang.el ends here
