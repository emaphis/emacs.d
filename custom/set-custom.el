;;; set-custom -- Emacs customizations
;; Copyright © 2016 Ed Maphis

;;; Commentary:

;;; Code:



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("7809c67a87ab1c4fc5f4df85676c52a58f7503057d6c6a5b5afb20a76fb82926" "69f7e8101867cfac410e88140f8c51b4433b93680901bb0b52014144366a08c8" "628dbccd3a8ff105fff72bdb855c8fdb63d004784b7710113cc70197e70b9f90" "046e442b73846ae114d575a51be9edb081a1ef29c05ae5e237d5769ecfd70c2e" "e87f48ec4aebdca07bb865b90088eb28ae4b286ee8473aadb39213d361d0c45f" "5953bffbb85160e62a2c4ec248d831e3eca8c7c511d17b4fec0e740a521c46f5" "67f0f440afa2e68d9d00219b5a56308761af45832fb60769d2b2fd36e3fead45" "aba75724c5d4d0ec0de949694bce5ce6416c132bb031d4e7ac1c4f2dbdd3d580" "dad40020beea412623b04507a4c185079bff4dcea20a93d8f8451acb6afc8358" "a0415d8fc6aeec455376f0cbcc1bee5f8c408295d1c2b9a1336db6947b89dd98" "91818004de3790e44b329ff5a4018004e1f6f8ff21dc56cdfcb6011322bb8715" "73c9d15440a12552459f4f73cf0d7c7a0255ec042ff66a3717574ec0be8fae7c" "fcfccb3b0fa683ccd3ec31123b7eabd0dfafa1a13daa2ce207ade8b002cc567e" "3b750103c60f1e57b2748df5a4637d63da1076919b552ccc5c967444c2402b34" "34eedeff4f88404f8c7f7c7f45b3328b9bec171f6d9eede8e231cad4996eafb8" "ddff22007104a1317014e48ff3d4911a83771a4ccf57185ccebf7f91339dbfb8" "0f7fa4835d02a927d7d738a0d2d464c38be079913f9d4aba9c97f054e67b8db9" "dc0805693792ab7a53ad59087ffbe358828629e7933a6523df9dcc6202a37815" "295e7432a47e9fd4c5c141fe19e0dff68ad770fc6d886163574b7b393c98a655" "21388667ce5ee0b375e6282f0d6c6b61588da6604d343bbb19389e6a54d3d00d" "c7f364aeea0458b6368815558cbf1f54bbdcc1dde8a14b5260eb82b76c0ffc7b" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "83c118cbcc517539597657b57c6743e394f03ea20405937c7ae2b691ec2718c1" "039c01abb72985a21f4423dd480ddb998c57d665687786abd4e16c71128ef6ad" "c5692610c00c749e3cbcea09d61f3ed5dac7a01e0a340f0ec07f35061a716436" "3b0cb7b97752956ce63f0884f77ccd42dc0f2a61b935302c38e11099f2f282e2" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "ca55e8e76fd261eeae73fe79c6e23bfcb95b4c690f2ad97c1348b48aa1f761d7" "20a8ec387dde11cc0190032a9f838edcc647863c824eed9c8e80a4155f8c6037" "b4e4d25e64c06bb4cf8c4b47bbd73aba63238a9ff59213312f6fad8dce846ae4" "ff3f946bfe6aff61d1297379f67fdae707c743827a7d59f6ec7eabdb39447db9" "7ea491e912d419e6d4be9a339876293fff5c8d13f6e84e9f75388063b5f794d6" "96c56bd2aab87fd92f2795df76c3582d762a88da5c0e54d30c71562b7bf9c605" "c03971de0943d7ad6a7ca5bab3c92801fc57e2a73e5e3c0da4cbff38cc3049c1" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "b055150f79035245ae2a0d22d75eed138343223604e83c9d3babad28c9268589" "235fefd1566948a6205fa5beb7f1eb6da59227d44fa586d3a5e556b140716284" "8313c35da6a8f66f1998bba544e2300dac2c4f16fe5972227a0e27fd1fe630fb" "3efa9b1da5ed44ccb1d04f737cbe2680fe145c4406f16545d2deacb9dc3dd142" "23f1d50c7687a59aabf9773e40413e97e5c29b3b22c065f7c866cfcfc4538343" "ec97d13a44407f66b4a501efc5cb5feebc454f1bbe3e7431d05092ad191f474f" "04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" "98652f9f882a78e6634dc1fa2bb9281990cf17e54b52f196ed028b61a3135132" "170bb47b35baa3d2439f0fd26b49f4278e9a8decf611aa33a0dad1397620ddc3" "a11461fe87d19070c59cfa93e6f780420040853d439a396f72e3de9cf88ba674" "068da66dd5ef78a0fe9245895740a0ba472369032b29bc55df1e7b9db025e46c" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" "fa2af0c40576f3bde32290d7f4e7aa865eb6bf7ebe31eb9e37c32aa6f4ae8d10" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "c72a772c104710300103307264c00a04210c00f6cc419a79b8af7890478f380e" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "130319ab9b4f97439d1b8fd72345ab77b43301cf29dddc88edb01e2bc3aff1e7" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "6952b5d43bbd4f1c6727ff61bc9bf5677d385e101433b78ada9c3f0e3787af06" "4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "14f0fbf6f7851bfa60bf1f30347003e2348bf7a1005570fd758133c87dafe08f" "51897d0e185a9d350a124afac8d5e95cda53e737f3b33befc44ab02f2b03dab1" "dbb643699e18b5691a8baff34c29d709a3ff9787f09cdae58d3c1bc085b63c25" "32e3693cd7610599c59997fee36a68e7dd34f21db312a13ff8c7e738675b6dfc" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "f64c9f8b4241b680b186f4620afb9c82fa2a76cf4498a7431f90db59bb1892eb" "12ced60b9eec2ec25d781a556c1ecf2c582700439f56ca18c281b3fb7670e5e6" "75cd4234cc08d4ccf3ddef8fb763b9e145d4e68d3c938a3502d892c72f71e007" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" default))
 '(fci-rule-color "#073642")
 '(global-display-line-numbers-mode t)
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-sexp-background-color "#efebe9")
 '(lsp-diagnostics-attributes
   '((unnecessary :foreground "cornsilk4")
     (deprecated :strike-through t)))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(org-drill-done-count-color "#663311")
 '(org-drill-failed-count-color "#880000")
 '(org-drill-mature-count-color "#005500")
 '(org-drill-new-count-color "#004488")
 '(package-selected-packages
   '(geiser-chez geiser eglot-java eglot-jl scala-mode sly cider-eval-sexp-fu flymake-kondor corfu embark-consult embark orderless marginalia consult vertico eros highlight-indentation eglot-fsharp eglot eglot-fharp clojure-mode flyspell-correct paredit yasnippet-snippets racket-mode modus-vivendi-theme modus-operandi-theme dap-mode company-erlang fill-column-indicator ivy-erlang-complete faff-theme rainbow-delimiters dante parchment-theme zenburn-theme flycheck-irony irony-eldoc company-irony-c-headers company-irony emidje cider which-key nimbus-theme wttrin lorem-ipsum ace-window inf-ruby org-bullets org-bullet try hl-todo expand-region beacon smooth-scroll smooth-scrolling projectile company-jedi jedi flycheck-joker utop merlin tuareg erlang fsharp-mode yasnippet haskell-mode ess-site ess intero hl-sexp highlight-sexp moe-theme toxi-theme leuven-theme win-switch undo-tree solarized-theme sml-mode smartparens rainbow-mode monokai-theme markdown-mode magit idomenu ido-ubiquitous ido-hacks idle-highlight-mode gandalf-theme ensime elisp-slime-nav edts cyberpunk-theme company-ghc ace-jump-mode))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ff8059")
     (40 . "#feacd0")
     (60 . "#f78fe7")
     (80 . "#f4923b")
     (100 . "#eecc00")
     (120 . "#cfdf30")
     (140 . "#f8dec0")
     (160 . "#bfebe0")
     (180 . "#44bc44")
     (200 . "#70c900")
     (220 . "#6ae4b9")
     (240 . "#4ae8fc")
     (260 . "#00d3d0")
     (280 . "#c6eaff")
     (300 . "#2fafff")
     (320 . "#79a8ff")
     (340 . "#00bcff")
     (360 . "#b6a0ff")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["black" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(xterm-color-names-bright
   ["gray35" "#f4923b" "#70c900" "#cfdf30" "#79a8ff" "#f78fe7" "#4ae8fc" "white"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(message "end set-custom.el")

(provide 'set-custom)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-custom.el ends here
