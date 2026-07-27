;;; set-corfu.el -- Corfu settings  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 206 Maphis
;;
;; Created: July 25, 2026
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 31.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Set up Corfu completion and related packages
;;
;;; Code:


;;; corfu.el - Completion Overlay Region Function
;;; https://github.com/minad/corfu
(use-package corfu
  :commands (corfu-mode global-corfu-mode)

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))

  :custom
  (corfu-cycle t)            ;; Enable cycling for `corfu-next/rpevious'
  (corfu-auto t)             ;; Enable auto completion
  ;; Hide commands in M-x which do not apply to the current mode.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Disable Ispell completion function. As an alternative try `cape-dict'.
  (text-mode-ispell-word-completion nil)
  ;;(tab-always-indent 'complete)
  (corfu-popupinfo-mode 1)

  :config
  ;; Enable auto completion, configure delay, trigger and quitting
  (setq corfu-auto t
      corfu-auto-delay 0.2
      corfu-auto-trigger "." ;; Custom trigger characters
      corfu-quit-no-match 'separator) ;; or t
  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (global-corfu-mode))

;;; Cape, or Completion At Point Extensions, extends the capabilities of
;;; in-buffer completion. It integrates with Corfu or the default completion UI,
;;; by providing additional backends through completion-at-point-functions.
(use-package cape
  :commands (cape-dabbrev cape-file cape-elisp-block)
  :bind ("C-c p" . cape-prefix-map)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))


;; Use Dabbrev with Corfu!
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))


(provide 'set-corfu)
(message "... set-corfu ends ...")
;;; set-corfu.el ends here
