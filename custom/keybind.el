;; key bindins

(defun nnr ()
  (interactive)
  (insert "r"))

(defun nnt ()
  (interactive)
  (insert "t"))

(defun nnf ()
  (interactive)
  (insert "f"))

(defun nng ()
  (interactive)
  (insert "g"))


(defun nn4 ()
  (interactive)
  (insert "4"))

(defun nn5 ()
  (interactive)
  (insert "5"))

(defun keys-set ()
  (interactive)
  (global-set-key (kbd "C-c C-d e") 'nnr)
  (global-set-key (kbd "C-c C-d y") 'nnt)
  (global-set-key (kbd "C-c C-d d") 'nnf)
  (global-set-key (kbd "C-c C-d h") 'nng)
  (global-set-key (kbd "C-c C-d l") 'eglot))

(keys-set)

;;(global-set-key (kbd "C-c C-c  1") 'nn4)
;;(global-set-key (kbd "C-s 2") 'nn5)


;; ESC/META/ALT/CTRL/SHIFT

;; C-x
;; M-x
;; S-x
