;;; set-cpp.el -- Setting for C++ and C
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: July 6, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings c++, c
;; Compatibility: emacs 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Settings for C++ and C for Clang using irony-mode
;;  Example:
;;   https://github.com/Sarcasm/.emacs.d/blob/544591c02faa019872a48ffecfe559014a43380a/init.d/cc.el
;;
;;; Code:

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))


(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))


;; Windows performance tweaks
;;
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package irony-eldoc
  :ensure t
  :config
  (add-hook 'irony-mode #'irony-eldoc))


;; TODO:  see company-irony-cheaders



(provide 'set-cpp)
(message "... set-cpp ends ...")
;;; set-cpp.el ends here
