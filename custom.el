;;; custom.el -- Emacs customizations
;; Copyright © 2016,24 Ed Maphis

;;; Commentary:
;;  Customary custom file for emacs

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(column-number-mode t)
 '(compilation-message-face 'default)
 '(create-lockfiles nil)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("a94e15f0a3fd9e86430b4b8dadffc58faa0310168bcbc4fd3c1b687cf25e1f5d"
     "6a4d13a6d49d70e3e2a590bae8467dbcb65728befb31c388edf43bcc369b51df"
     "c5e7a36784b1955b28a89a39fef7c65ddc455b8e7fd70c6f5635cb21e4615670"
     "cc3f311f61b7cee6c8a20a9799484fa61e4729a5607315122cac33c910407eec"
     "0dae3807ae732e44d9d9e97b0d05fef17fa2c718cc99dfa6d32440b5c0ea606c"
     "f079ef5189f9738cf5a2b4507bcaf83138ad22d9c9e32a537d61c9aae25502ef"
     "0cf95236abcf59e05b1ea69b4edd53d293a5baec4fe4c3484543fee99bfd2204"
     "3ce3e62344de33a73d3e78fcecd065abd23d38b9aa91bcb5087b8db03f6919a6"))
 '(fci-rule-color "#073642")
 '(global-display-line-numbers-mode t)
 '(highlight-symbol-colors
   (--map (solarized-color-blend it "#002b36" 0.25)
          '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16"
            "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F"
     "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"
     "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-sexp-background-color "#efebe9")
 '(lsp-diagnostics-attributes
   '((unnecessary :foreground "cornsilk4") (deprecated :strike-through t)))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198"
     "#d33682" "#6c71c4"))
 '(org-drill-done-count-color "#663311")
 '(org-drill-failed-count-color "#880000")
 '(org-drill-mature-count-color "#005500")
 '(org-drill-new-count-color "#004488")
 '(package-selected-packages
   '(ace-jump-mode avy beacon corfu counsel-projectile csv-mode dired-subtree
                   elisp-slime-nav embark-consult eros expand-region
                   flyspell-correct geiser-chez hl-todo idle-highlight-mode
                   imenu-anywhere ligature lorem-ipsum magit marginalia
                   markdown-mode multiple-cursors nerd-icons-completion
                   nerd-icons-corfu nerd-icons-dired orderless org-bullets
                   paredit racket-mode rainbow-delimiters rainbow-mode trashed
                   undo-tree vertico wttrin yaml-mode yasnippet-snippets))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ff8059") (40 . "#feacd0") (60 . "#f78fe7") (80 . "#f4923b")
     (100 . "#eecc00") (120 . "#cfdf30") (140 . "#f8dec0") (160 . "#bfebe0")
     (180 . "#44bc44") (200 . "#70c900") (220 . "#6ae4b9") (240 . "#4ae8fc")
     (260 . "#00d3d0") (280 . "#c6eaff") (300 . "#2fafff") (320 . "#79a8ff")
     (340 . "#00bcff") (360 . "#b6a0ff")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-log-types '((unlock-file)))
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900"
                 "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682"
                 "#00736F" "#2aa198" "#839496" "#657b83")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(message "end custom.el")
(provide 'custom)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom.el ends here
