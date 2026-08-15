;;; set-base.el ---  Emacs' set-base file.  -*- lexical-binding: t; -*-
;;
;; Filename: set-base.el
;;
;; Copyright (c) 2014, 2026 Ed Maphis
;;
;; Author: Ed Maphis
;;
;; Created: Aug 16 2014
;;
;; URL: https://github.com/emaphis/emacs.d
;;d
;; Keywords: emacs settings
;; Compatibility: emacs 31.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;which;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Provides basic text editing utilities and document modes.
;; These settings and better-defaults provide basic functionality.
;; Any modes aren't really useful for programming type mode will most
;; likely be included here.
;;

;;; Code:


(use-package imenu-anywhere
  :bind (("C-c i" . imenu-anywhere)
         ("s-i" . imenu-anywhere)))


;;; ace jump mode
(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))


;;; multiple cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-ths)
         ("C-c C-<" . mc-mark-all-like-this)))


;;; (global-whitespace-mode)
(use-package whitespace
  :ensure nil   ; part of emacs
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail)))

;; Wrap lines at 80 characters
(setq-default fill-column 80)
(global-display-fill-column-indicator-mode 1)

;;; Which key
;;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :config (which-key-mode +1)
  (setq which-key-idle-delay 1.2))


(use-package undo-tree
  :config
  ;; autosave the undo-tree history
  (setq undo-tree-history-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq undo-tree-auto-save-history t))


(use-package beacon
  :config
  (beacon-mode 1)
  ;;(setq beacon-color "#666600")
  )


(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))


;;; Documentation modes

;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	     ("\\.md\\'" . markdown-mode)
	     ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package yaml-mode
  :defer t)

(use-package csv-mode
  :mode "\\.csv\\'")

;;; Insert Date:
(require 'calendar)

(defun insdate-insert-current-date (&optional omit-day-of-week-p)
  "OMIT-DAY-OF-WEEK-P Insert today's date using the current locale.
With a prefix argument, the date is inserted without the day of
the week."
  (interactive "P*")
  (insert (calendar-date-string (calendar-current-date) nil
                                omit-day-of-week-p)))
;;; insert date
(global-set-key (kbd "C-x M-d") #'insdate-insert-current-date)


;;(use-package calendar
;;  :config
;;  (defun insdate-insert-current-date (&optional omit-day-of-week-p)
;;    "Insert today's date using the current locale.
;;     With a prefix argument, the date is inserted without the day of
;;     the week."
;;     (iteractive "P*")
;;     (insert (calendar-date-string (calendar-current-date) nil
;;                                   omit-day-of-week-p)))
;;  :bind ("C-x M-d" .  insdate-insert-current-date)
;;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; misc settings

;;; flyspell - use hunspell instead of ispell
;; NOTE: Use the ezwinports: https://sourceforge.net/projects/ezwinports/  -OR-
;; https://github.com/iquiw/hunspell-binary/
;; https://emacs.stackexchange.com/questions/80908/using-hunspell-in-emacs-on-windows-10
;; Other versions don't seem to work
(use-package ispell
  :init
  (setenv "DICTIONARY" "en_US")
  (setenv "DICPATH" "C:\\apps\\dict")
  :if (eq system-type 'windows-nt)
  :custom ((ispell-program-name "c:/apps/hunspell/bin/hunspell.exe")
           (ispell-local-dictionary "en_US")
           (ispell-local-dictionary-alist
            '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))))

;; https://github.com/d12frosted/flyspell-correct
(use-package flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))


;;; Find unbound keys
;;  https://www.emacswiki.org/emacs/unbound.el
(load "unbound.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; some custom key bindings

;;; Window switching.
(global-set-key (kbd "C-x O")     ;; back one
                (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x C-o")   ;; forward two
                (lambda () (interactive) (other-window 2)))

;;; Jump to a definition in the current file.
(global-set-key (kbd "C-x C-i") 'idomenu)

;;; toggle menu bar mode
(global-set-key (kbd "<f7>") 'menu-bar-mode)

;;; toggle whitespace mode
(global-set-key (kbd "<f6>") 'whitespace-mode)

;;; revert buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;;; open key bind documentation
(global-set-key (kbd "C-h C-d")
                (lambda ()
                  (interactive)
                  (find-file-other-window "~/.emacs.d/doc/key-bind.org")))


(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (insert (format "%s" (eval (read (current-kill 0)))))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-x M-r") #'eval-and-replace)

;; Font settings for Cascadia / Fira Code
;; This assumes you've installed the package via MELPA.
;; https://github.com/mickeynp/ligature.el/wiki
;; (use-package ligature
;;   :config
;;   ;; Enable the "www" ligature in every possible major mode
;;   (ligature-set-ligatures 't '("www"))
;;   ;; Enable traditional ligature support in eww-mode, if the
;;   ;; `variable-pitch' face supports it
;;   (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
;;   ;; Enable all Cascadia and Fira Code ligatures in programming modes
;;   (ligature-set-ligatures 'prog-mode
;;                         '(;; == === ==== => =| =>>=>=|=>==>> ==< =/=//=// =~
;;                           ;; =:= =!=
;;                           ("=" (rx (+ (or ">" "<" "|" "/" "~" ":" "!" "="))))
;;                           ;; ;; ;;;
;;                           (";" (rx (+ ";")))
;;                           ;; && &&&
;;                           ("&" (rx (+ "&")))
;;                           ;; !! !!! !. !: !!. != !== !~
;;                           ("!" (rx (+ (or "=" "!" "\." ":" "~"))))
;;                           ;; ?? ??? ?:  ?=  ?.
;;                           ("?" (rx (or ":" "=" "\." (+ "?"))))
;;                           ;; %% %%%
;;                           ("%" (rx (+ "%")))
;;                           ;; |> ||> |||> ||||> |] |} || ||| |-> ||-||
;;                           ;; |->>-||-<<-| |- |== ||=||
;;                           ;; |==>>==<<==<=>==//==/=!==:===>
;;                           ("|" (rx (+ (or ">" "<" "|" "/" ":" "!" "}" "\]"
;;                                           "-" "=" ))))
;;                           ;; \\ \\\ \/
;;                           ("\\" (rx (or "/" (+ "\\"))))
;;                           ;; ++ +++ ++++ +>
;;                           ("+" (rx (or ">" (+ "+"))))
;;                           ;; :: ::: :::: :> :< := :// ::=
;;                           (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
;;                           ;; // /// //// /\ /* /> /===:===!=//===>>==>==/
;;                           ("/" (rx (+ (or ">"  "<" "|" "/" "\\" "\*" ":" "!"
;;                                           "="))))
;;                           ;; .. ... .... .= .- .? ..= ..<
;;                           ("\." (rx (or "=" "-" "\?" "\.=" "\.<" (+ "\."))))
;;                           ;; -- --- ---- -~ -> ->> -| -|->-->>->--<<-|
;;                           ("-" (rx (+ (or ">" "<" "|" "~" "-"))))
;;                           ;; *> */ *)  ** *** ****
;;                           ("*" (rx (or ">" "/" ")" (+ "*"))))
;;                           ;; www wwww
;;                           ("w" (rx (+ "w")))
;;                           ;; <> <!-- <|> <: <~ <~> <~~ <+ <* <$ </  <+> <*>
;;                           ;; <$> </> <|  <||  <||| <|||| <- <-| <-<<-|-> <->>
;;                           ;; <<-> <= <=> <<==<<==>=|=>==/==//=!==:=>
;;                           ;; << <<< <<<<
;;                           ("<" (rx (+ (or "\+" "\*" "\$" "<" ">" ":" "~"  "!"
;;                                           "-"  "/" "|" "="))))
;;                           ;; >: >- >>- >--|-> >>-|-> >= >== >>== >=|=:=>>
;;                           ;; >> >>> >>>>
;;                           (">" (rx (+ (or ">" "<" "|" "/" ":" "=" "-"))))
;;                           ;; #: #= #! #( #? #[ #{ #_ #_( ## ### #####
;;                           ("#" (rx (or ":" "=" "!" "(" "\?" "\[" "{" "_(" "_"
;;                                        (+ "#"))))
;;                           ;; ~~ ~~~ ~=  ~-  ~@ ~> ~~>
;;                           ("~" (rx (or ">" "=" "-" "@" "~>" (+ "~"))))
;;                           ;; __ ___ ____ _|_ __|____|_
;;                           ("_" (rx (+ (or "_" "|"))))
;;                           ;; Fira code: 0xFF 0x12
;;                           ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
;;                           ;; Fira code:
;;                           "Fl"  "Tl"  "fi"  "fj"  "fl"  "ft"
;;                           ;; The few not covered by the regexps.
;;                           "{|"  "[|"  "]#"  "(*"  "}#"  "$>"  "^="))
;;   ;; Enables ligature checks globally in all buffers. You can also do it
;;   ;; per mode with `ligature-mode'.
;;   (global-ligature-mode t))


;; Jetbrains mono
(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode
                          '("--" "---" "==" "===" "!=" "!==" "=!="
                            "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
                            "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
                            "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                            "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
                            "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
                            "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
                            "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
                            "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
                            "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                            "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
                            ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
                            "<:<" ";;;"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))


(provide 'set-base)
(message "... end set-base.el ...")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-base.el ends here
