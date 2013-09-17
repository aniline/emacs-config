;; All the win32 stuff goes here.
(defvar cygroot "c:/ccg" 
  "The directory which is mounted as the root on cygwin.")

(defun cyg-to-emacs (path &optional root)
  (if (eq (aref path 0) ?\/) (concat (if root root cygroot) path) path))

(progn (load "gnuserv")
       (gnuserv-start))
(progn
  (add-to-list 'Info-directory-list (cyg-to-emacs "/usr/share/info/"))
  (add-to-list 'Info-directory-list (cyg-to-emacs "/usr/info/")))
