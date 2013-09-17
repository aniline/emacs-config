;;; C and other developmen env.

;; Jungo needs breaking of /any/ statement or line to be intended
;; by 4 characters (irrespective of the expression parenthesising
;; context - So this kludge 
(defun c-lineup-arglist-jungo-kludge (argelem)
  (if (eq (c-langelem-2nd-pos c-syntactic-element) (c-langelem-2nd-pos (car c-syntactic-context)))
      c-basic-offset 0))

;; Jungo Style
(c-add-style "jungo" '(
		    (c-basic-offset . 4) ;; Basic offset if 4
		    (c-comment-only-line-offset 0 . 0)
		    (c-hanging-braces-alist
		     (substatement-open before after)
		     (arglist-cont-nonempty))
		    (c-offsets-alist
		     (statement-block-intro . +)
		     (knr-argdecl-intro . 4)
		     (substatement-open . 0)
		     (substatement-label . 0)
		     (label . 0)
		     (case-label . 0)
		     (statement-case-intro . +)
		     (statement-case-open . +)
		     (statement-cont . +)
		     (arglist-intro . c-lineup-arglist-intro-after-paren)
		     (arglist-cont . +)
		     (arglist-cont-nonempty . c-lineup-arglist-jungonnn-kludge) ;; Zee kludge
		     (arglist-close . c-lineup-arglist)
		     (inline-open . 0)
		     (brace-list-open . 0)
		     (brace-list-entry . 0)
		     (topmost-intro-cont first c-lineup-topmost-intro-cont c-lineup-gnu-DEFUN-intro-cont))
		    (c-block-comment-prefix . "")))

;; Untabified.
(c-add-style "android" '("java" (c-tab-always-indent . 1) (indent-tabs-mode . ())))

(add-hook 'java-mode-hook '(lambda () (c-set-style "android")))

;; The default was code also - Muhahahah !!
(setq c-ignore-auto-fill '(string))

;; ID utils
(autoload 'gid "idutils")

;; Extras
(add-hook 'c-mode-hook '(lambda () (define-key c-mode-map (kbd "C-c C-v C-c") 'compile)))
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'auto-fill-mode)

;; Not used (setq global-senator-minor-mode t)

