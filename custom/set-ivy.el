;;; set-ivy.el -- Ivy, Counsel, Swiper settngs
;;
;; Copyright (c) 2019 Ed Maphis
;;
;; Created: Feb 7, 2019
;;
;; URL: https://github.com/emaphis/emacs.d
;;
;; Keywords: emacs settings, navigation.
;; Compatibility: emacs 27.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;;  Ivy, Swiper, Counsel settings
;;  Use in place of IDO.
;;
;;; Code:

;; last recently used sorting.
(use-package smex)


(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "s-w") 'ace-window)
  (global-set-key [remap other-window] #'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))


(use-package ivy
  :ensure t
  ;; :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy)
  (global-set-key (kbd "C-x b" ) 'ivy-switch-buffer)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

;;; search utility
(use-package swiper
  :ensure t
  :config
  (global-set-key (kbd "\C-s") 'swiper)
  (global-set-key (kbd "\C-r") 'swiper))

;;; jump to chars in buffer
(use-package avy
  :ensure t
  :bind
  ("C-:" . avy-goto-char)
  ("C-'" . avy-goto-char-2))

;;; Spell checking with ivy
;; https://github.com/d12frosted/flyspell-correct
(use-package flyspell-correct
  :ensure t
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

(use-package flyspell-correct-ivy
  :after flyspell-correct)

;;; TODO: try ivy-rich
;; https://github.com/Yevgnen/ivy-rich
(use-package ivy-rich
  :ensure t
  :init
  (ivy-rich-mode 1))


(provide 'set-ivy)
(message "... set-ivy ends ...")
;;; set-ivy.el ends here
