;;; early-init.el --- some basic UI settings.  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2026 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Tuesday, October 4, 2016
;;
;;; Commentary:

;; Settings that have to be applied before the initial frame is
;; created and before package.el is initialized.

;;; CODE:

;; Virtual machine parameters.

;; See: https://emacsredux.com/blog/2025/03/28/speed-up-emacs-startup-by-tweaking-the-gc-settings/
;; Don't waste time on garbage collection during starup.
(setq gc-cons-threshold most-positive-fixnum)
;; mpf: 2305843009213693951

;; Restore to normal value after startup (e.g. 50MB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 50 1024 1024)  ;; 50 MB
                   gc-cons-percentage 0.2)))

;; the toolbar is just a waste of valuable screen estate; disabling it
;; via frame parameters here means the initial frame is never created
;; with one (calling tool-bar-mode later forces a frame resize)
(push '(tool-bar-lines . 0) default-frame-alist)

;; It's a waste of time to resize frame during startup.
(setq frame-inhibit-implied-resize t)

;; Setting *-resize-pixelwise to `t' lets frames/windows resize
;; smoothly at sub-character increments
(setq frame-resize-pixelwise t)

(provide 'early-init)
;;; early-init.el ends here
