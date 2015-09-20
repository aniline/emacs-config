;; Key bindings go here.
;; Global Keys

(global-set-key [delete] 'delete-char)
(global-set-key (kbd "C-x n") 'goto-line)
(global-set-key (kbd "C-x ,") 'cvs-examine)
(global-set-key (kbd "C-x /") 'replace-regexp)
(global-set-key (kbd "C-x |") 'linum-mode)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [kp-delete] 'delete-char)
(global-set-key (kbd "C-x 9") 'flip-xclip-behaviour)
(global-set-key (kbd "C-c d d") '(lambda () (interactive) (dict (word-at-point))))

;; Org-mode Key bindings

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Extras

(global-set-key (kbd "C-c C-0 C-d") 'insert-current-date-time)
(global-set-key (kbd "C-c C-0 C-t") 'insert-current-time)

;; GTAGS

(global-set-key (kbd "M-*") 'gtags-pop-stack)
(global-set-key (kbd "M-.") 'gtags-find-tag)
