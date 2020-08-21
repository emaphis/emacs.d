;;; set-lsp.el -- Set up lsp modes for emacs.
;;
;; Copyright (c) 2020 Ed Maphis
;;
;; Created: Aug 11, 2020
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 26.3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Set up LSP for Emacs, starting with java-lsp.
;;
;;; Code:

(use-package lsp-mode
  :hook ((python-mode . lsp)
         (lsp-mode . lsp-enable-which-key-intergration))
  :config (setq lsp-completion-enable-additional-text-edit nil)
  :commands lsp)

(setq lsp-completion-provider :capf)


(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-java
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :after lsp-mode
  :config (dap-auto-configure-mode))

;;(use-package dap-java)

(use-package lsp-treemacs)


(provide 'set-lsp)
(message "... set-lsp ends ...")
;;; set-lsp.el ends here
