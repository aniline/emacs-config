;;; C and other developmen env.
(require 'cc-fonts)

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
		     (arglist-cont-nonempty . c-lineup-arglist-jungo-kludge) ;; Zee kludge
		     (arglist-close . c-lineup-arglist)
		     (inline-open . 0)
		     (brace-list-open . 0)
		     (brace-list-entry . 0)
		     (topmost-intro-cont first c-lineup-topmost-intro-cont c-lineup-gnu-DEFUN-intro-cont))
		    (c-block-comment-prefix . "")))

;; Shamelessly copied gtkdoc patterns to include "\" prefix and
;; match keywords on the starting line like, say
;; /** @brief...
(defconst doxygen-font-lock-doc-comments
  (let ((symbol "[a-zA-Z0-9_]+")
	(header "^ \\* "))
    `((,(concat header "\\("     symbol "\\):[ \t]*$")
       1 ,c-doc-markup-face-name prepend nil)
      (,(concat                  symbol     "()")
       0 ,c-doc-markup-face-name prepend nil)
      (,(concat header "\\(" "@" symbol "\\):")
       1 ,c-doc-markup-face-name prepend nil)
      (,(concat "[#%@\\]" symbol)
       0 ,c-doc-markup-face-name prepend nil))
    ))

(defconst doxygen-font-lock-doc-protection
  `(("< \\(public\\|private\\|protected\\) >"
     1 ,c-doc-markup-face-name prepend nil)))

(defconst doxygen-font-lock-keywords
  `((,(lambda (limit)
	(c-font-lock-doc-comments "/\\*[*!]<?[ \t]" limit
	  doxygen-font-lock-doc-comments)
	(c-font-lock-doc-comments "/\\*[*!]$" limit
	  doxygen-font-lock-doc-comments)
	(c-font-lock-doc-comments "/\\*< " limit
	  doxygen-font-lock-doc-protection)
	))))

;; Untabified, For auto-newline
(c-add-style "work" '("jungo"
		      (c-basic-offset . 4)
		      (c-comment-only-line-offset 0 . 0)
		      (c-tab-always-indent . 1)
		      (indent-tabs-mode . ())
		      (c-hanging-braces-alist
		       (defun-open before after)
		       (defun-close before)
		       (inline-open before after)
		       (inline-close before)
		       (block-open before after)
		       (block-close before)
		       (substatement-open before after)
		       (statement-case-open before after)
		       (namespace-open before after)
		       (namespace-close before))
		      (c-offsets-alist
		       (arglist-intro . c-lineup-arglist-intro-after-paren)
		       (arglist-cont . c-lineup-arglist)
		       (arglist-cont-nonempty . c-lineup-arglist)
		       (arglist-close . c-lineup-arglist)
		       (statement-case-open . 0)
		       (case-label . +))
                      (c-doc-comment-style .
                                           ((java-mode . javadoc)
                                            (pike-mode . autodoc)
                                            (c-mode . doxygen)))))

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

