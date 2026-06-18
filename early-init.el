;;; set-ui.el --- some basic UI settings.  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2026 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Tuesday, October 4, 2016
;;
;;; Commentary:
;; Stuff that should be set early in the Emacs init process.
;;
;;; CODE:

(message "... early-init ...")

;; Virtual machine pparameters.
;; See: https://www.reddit.com/r/emacs/comments/brc05y/is_lspmode_too_slow_to_use_for_anyone_else/eofulix/
;; And: https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(message "... end early-init ...")
(provide 'early-init)
;;; early-init.el ends here
