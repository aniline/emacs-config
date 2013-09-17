;; All the .*n.x/cygwin stuff goes here.
(server-start)
(progn 
  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp"))

(setq browse-url-mozilla-program "/opt/firefox/firefox")
(setq semanticdb-default-save-directory "~/.semantic.d")
(progn (set-fontset-font "fontset-default"
			 (cons (decode-char 'ucs #x0900)
			       (decode-char 'ucs #x097f))
			 "-*-gargi_1.7-*-*-r-*-8-*-*-*-*-*-iso10646-1")
       (set-fontset-font "fontset-default"
			 (cons (decode-char 'ucs #x0D00)
			       (decode-char 'ucs #x0D7f))
			 "-*-malayalam-*-*-*-*-*-*-*-*-*-*-iso10646-1"))
