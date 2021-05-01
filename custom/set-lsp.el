;;; set-lsp.el -- Set up lsp modes for emacs.
;;
;; Copyright (c) 2020 Ed Maphis
;;
;; Created: Aug 11, 2020
;; Updated: April 30, 2021
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 27.2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Set up LSP for Emacs, starting with java-lsp.
;;
;;; Code:

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")  ; or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-intergration t))

(setq lsp-completion-provider :capf)


(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package dap-mode
  :after lsp-mode
  :config (dap-auto-configure-mode))

(use-package lsp-treemacs)


;;; Typescript
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))


;;; Java
;; (use-package lsp-java
;;   :config (add-hook 'java-mode-hook 'lsp))

;;(use-package dap-java)


(provide 'set-lsp)
(message "... set-lsp ends ...")
;;; set-lsp.el ends here
