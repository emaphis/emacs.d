;;; set-nerdfonts.el -- Set up and use nerd fonts
;;
;; Copyright (c) 2024 Maphis
;;
;; Created: Dec 12, 2024
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 29.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Set up Nerd Fonts.
;;  Use icon fonts in various places
;;
;;; Code:

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(provide 'set-nerdfonts)
(message "... set-nerdfonts ends ...")
;;; set-template.el ends here
