;; All the .*n.x/cygwin stuff goes here.
(server-start)
(progn 
  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp"))

(setq browse-url-mozilla-program "/opt/firefox/firefox")
(setq semanticdb-default-save-directory "~/.semantic.d")
