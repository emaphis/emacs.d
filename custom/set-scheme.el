;;; set-scheme.el -- Scheme mode settings
;;
;; Copyright (c) 2021 Maphis
;;
;; Created: May 6, 2021
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings
;; Compatibility: emacs 27.2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Setting up scheme and racket
;;
;;; Code:


;;(set-variable (quote scheme-program-name) "scheme")

(use-package racket-mode
  :ensure t
  :defer t
  :config
  (add-hook 'racket-mode-hook #'paredit-mode)
  (add-hook 'racket-mode-hook #'rainbow-delimiters-mode))

;;; https://www.nongnu.org/geiser/
;; (use-package geiser
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'geiser-mode-hook #'paredit-mode)
;;   (add-hook 'geiser-mode-hook #'rainbow-delimiters-mode))


(provide 'set-scheme)
(message "... set-scheme ends ...")
;;; set-scheme.el ends here
