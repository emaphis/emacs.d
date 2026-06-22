;;; custom.el -- Emacs customizations  -*- lexical-binding: t; -*-
;; Copyright © 2016,26 Ed Maphis

;;; Commentary:
;;  Customary custom file for emacs

;;; Code:







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("28f3ac0f5fade64dc7e27abe9d32e7d85576c40940977e8e319f25055d3a28b7"
     "2493d0ad0bb94bd2ad297a6d76288751a532fd6d8d6af694ac14008caa6b7fa2"
     "3d3ce81b573122ae3173d8e88866b33ec6302c1dd7fed2939257fdfb9d52e005"
     "36a321671d7808b18f0d6552c10430aa77025285a536b9ca9e2f4bac890b8887"
     "8a015b9c62f50bf58bf2e71c875c060b0e217212b62d65b0b4a0cf7328dbb76c" default))
 '(package-selected-packages
   '(ace-jump-mode auctex avy beacon cape cider cider-eval-sexp-fu clojure-mode
                   corfu counsel-projectile csv-mode dired-subtree
                   elisp-slime-nav embark-consult eros exec-path-from-shell
                   expand-region faff-theme flymake-kondor flyspell-correct
                   fsharp-ts-mode geiser-chez hl-todo idle-highlight-mode
                   imenu-anywhere indent-bars leuven-theme ligature lorem-ipsum
                   macrostep magit marginalia markdown-mode multiple-cursors
                   nerd-icons-completion nerd-icons-corfu nerd-icons-dired
                   nimbus-theme orderless org-bullets paredit pdf-tools
                   racket-mode rainbow-delimiters rainbow-mode scala-mode sicp
                   sly-overlay sml-mode trashed treesit-auto undo-tree vertico
                   wttrin yaml-mode yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(message "end custom.el")
(provide 'custom)
