(load-library "smtpmail")
(bbdb-initialize 'gnus 'message)

(setq smtpmail-smtp-service 25
      smtpmail-smtp-server "localhost"
      smtpmail-debug-info t)
(setq user-mail-address akn-mail
      user-full-name    akn-name
      message-sendmail-f-is-evil t
      message-send-mail-function 'smtpmail-send-it
      gnus-summary-line-format "%U%R%z%(%[%6L: %-18,18f%]% %-32,32B %-60,60S\n"
      nnrss-use-local t
      mml-insert-mime-headers-always t)

(defun akn-set-tree-chars ()
  "Set the fancy tree characters based on availability of windowing system"
  (if window-system
      (setq gnus-sum-thread-tree-root "* "
	    gnus-sum-thread-tree-single-indent "* "
	    gnus-sum-thread-tree-leaf-with-other "├─+"
	    gnus-sum-thread-tree-vertical "│ "
	    gnus-sum-thread-tree-single-leaf "└─┬+"
	    gnus-sum-thread-tree-false-root "~*")
    (setq gnus-sum-thread-tree-root "* "
	  gnus-sum-thread-tree-single-indent "* "
	  gnus-sum-thread-tree-leaf-with-other "|-+"
	  gnus-sum-thread-tree-vertical "| "
	  gnus-sum-thread-tree-single-leaf "`-++"
	  gnus-sum-thread-tree-false-root "~*")))

(require 'message)
(add-hook 'message-send-hook 'ispell-message)
(add-hook 'message-mode-hook '(lambda () (define-key message-mode-map (kbd "C-'") 'bbdb-complete-name)))
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-summary-mode-hook 'akn-set-tree-chars)

(require 'ifile-gnus)
(setq ifile-classification-mode 'full-classification)
(setq nnmail-split-fancy
      '(|
	(: ifile-recommend)))
(setq nnmail-split-methods
      'nnmail-split-fancy)
(set-language-environment "UTF-8")

(bbdb-insinuate-message)

(defun my-sig ()
  (let ((my-sig-str ""))
    (save-excursion
      (fortune-in-buffer t fortune-file)
      (set-buffer fortune-buffer-name)
      (goto-char (point-min))
      (goto-char (point-min))
      (insert-file-contents "~/.signature")
      (setq my-sig-str (buffer-string)))
    my-sig-str))

(setq gnus-select-method '(nnml "private")
      mail-sources akn-mail-sources
      mail-signature 'my-sig
      message-signature 'my-sig
      gnus-message-archive-method
      '(nnfolder "archive"
		 (nnfolder-directory "~/Mail/archive")
		 (nnfolder-get-new-mail nil)
		 (nnfolder-inhibit-expiry t))
      gnus-message-archive-group "archive")
