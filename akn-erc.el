;;; ERC

(require 'erc)
(require 'erc-log)

(setq erc-nick akn-nick
      erc-user-full-name akn-name
      erc-server akn-erc-default-server
      erc-email-userid akn-user
      erc-prompt-for-password nil)

(setq 
 erc-auto-query t
 erc-fill-mode t
 erc-fill-static-center 15
 erc-fill-column 100 
 erc-fill-function 'erc-fill-static
 erc-timestamp-only-if-changed-flag nil
 erc-timestamp-format "%H:%M "
 erc-fill-prefix "      "
 erc-log-channels-directory "~/.erc/logs/"
 erc-save-buffer-on-part t
 erc-log-insert-log-on-open nil
 erc-insert-timestamp-function 'erc-insert-timestamp-left)

(defun irc ()
  (interactive)
  (when (y-or-n-p "Connect ? ") 
    (erc "irc.freenode.net" 6667 akn-nick akn-name t "")
    (erc "localhost" 6667 akn-nick akn-user t "")))

;; Pool of colors to use when coloring IRC nicks.
(setq erc-colors-list '("green" "CadetBlue1" "red" "olive drab" 
			"chocolate1" "dark magenta" "maroon1" "khaki" 
			"light gray" "olive drab" "aquamarine" "thistle"))

;; special colors for some people
(setq erc-nick-color-alist '(("John" . "blue")
			     ("Bob" . "red")
			     ))

(defun erc-get-color-for-nick (nick)
  "Gets a color for NICK. If NICK is in erc-nick-color-alist, use that color, else hash the nick and use a random color from the pool"
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
	     (substring (md5 nick) 0 6) 16)
	    (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  "Modifies the color of nicks according to erc-get-color-for-nick"
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "[0-9:\s]+<\\([^>]*\\)>.*$")
	(let ((nick (match-string 1)))
	  (put-text-property (match-beginning 1) (match-end 1) 'face
			     (cons 'foreground-color
				   (erc-get-color-for-nick nick)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)

