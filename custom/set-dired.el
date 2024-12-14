;;; set-dired.el -- Set up built-in Dired mode
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
;;  Set up built-in Dired mode
;;
;;; Code:


;; The default presentation of Dired contains lots of details.
;; We use  `dired-hide-details-mode` to hide those. They can be toggled on/off at
;; any time with `M-x dired-hide-details-mode`,
(use-package dired
  :ensure nil ;; built-in
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

;; The dired-subtree package provides commands to quickly view the contents
;; of a folder with the TAB key.
(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

;; We set up Dired to move deleted files to the system trash. The trashed
;; package is then useful to provide a Dired-like interface for that compartment
(use-package trashed
  :ensure t
  :commands (trashed)
  :config
  (setq trashed-action-confirmer 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))


(provide 'set-dired)
(message "... set-dired ends ...")
;;; set-template.el ends here
