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
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay 0.25)          ; slightly more relaxed than 0.2
  (corfu-auto-prefix 2)            ; start after 2 characters (good balance)
  (corfu-auto-trigger ".")         ; still trigger immediately after .
  (corfu-quit-no-match 'separator)
  (corfu-preselect 'prompt)
  (corfu-preview-current nil)      ; optional: less visual noise
  (corfu-on-exact-match nil)       ; don't auto-insert exact matches

  :config
  (global-corfu-mode)

  ;; Popup documentation
  (corfu-popupinfo-mode 1)
  (setq corfu-popupinfo-delay '(0.5 . 0.2)))  ; first show after 0.5s, then update faster


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


(use-package yasnippet-capf
  :ensure t
  :after (cape yasnippet)
  :config
  ;; Optional: make it available globally too
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))


(defun my/eglot-capf ()
  "Combine Eglot + Yasnippet (and optionally other Cape backends)."
  (setq-local completion-at-point-functions
              (list (cape-capf-super
                     #'eglot-completion-at-point
                     #'yasnippet-capf
                     ;; optional extras:
                     #'cape-dabbrev
                     #'cape-file))))

(add-hook 'eglot-managed-mode-hook #'my/eglot-capf)


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
