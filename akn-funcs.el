;;; My elisp functions in startup

;; Toggle 
(defun flip-xclip-behaviour () 
  "Toggle between X window clipboard behaviour"
  "One of the states clipboard is shared between (xterm/aterm/rxvt) and emacs"
  "and the other has gtk and newer clients in place of *terms"
  (interactive) 
  (setq x-select-enable-clipboard (not x-select-enable-clipboard))
  (let ((bang "")) 
    (if x-select-enable-clipboard (setq bang "true") (setq bang "false"))
    (message "x-select-enable-clipboard set to %s" bang)))

;; Functions for this and that
(defun kill-after-client-close ()
  "Kill Buffer after closing emacs client connection"
  (interactive)
  (progn (setq bogie (current-buffer))
	 (if (and (boundp 'server-buffer-clients)
		  server-buffer-clients)
	     (server-edit))
	 (kill-buffer bogie)))

;; Add multi-part
(defun add-mp () 
  "Duplicate the message to add html version as alternative"
  (interactive)
  (let ((sig-empty-line message-signature-insert-empty-line) (body-start (point-min)))
    (message-goto-body)
    (setq body-start (point))
    (message-goto-signature)
    (unless (eobp)
      (forward-line -1))
    (unless (= body-start (point))
      (setq body-str (buffer-substring-no-properties body-start (point)))
      (setq message-signature-insert-empty-line nil)
      (message-goto-body)
      (delete-region (point) (point-max))
      (insert "<#multipart type=alternative>\n"
	      "<#part type=text/plain>\n"
	      body-str)
      (message-insert-signature)
      (insert "\n<#part type=text/html>\n"
	      "<pre style=\"margin: 0px;\">\n"
	      body-str
	      "</pre><pre style=\"color:gray; margin: 0px;\">")
      (message-insert-signature)
      (insert "\n</pre>\n<#/multipart>"))
    (setq message-signature-insert-empty-line sig-empty-line)))

;; ====================
;; insert date and time

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
  (interactive)
  (insert (format-time-string current-date-time-format (current-time))))

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
  (interactive)
  (insert (format-time-string current-time-format (current-time))))
