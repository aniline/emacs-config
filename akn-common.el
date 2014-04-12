;; Standard stuff
(require 'ibuffer)
(require 'cl)
(require 'bbdb)
(require 'fortune)
(require 'generic-x)
(require 'haskell-mode-autoloads)

;; Some Settings
(cond (window-system (mwheel-install)))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq fortune-file "/usr/share/games/fortunes/"
      global-font-lock-mode t
      make-backup-files nil
      next-line-add-newlines nil
      require-final-newline t
      scroll-conservatively 5
      transient-mark-mode t
      x-select-enable-primary t
      x-select-enable-clipboard t)

(toggle-case-fold-search)
(tool-bar-mode 0)

;; Automode list
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.wsdl\\|.xsd" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.rc\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.mak" . makefile-mode))
;(add-to-list 'auto-mode-alist '("\\.muse" . muse-mode))
(add-to-list 'auto-mode-alist '("\\.bin" . hexl-mode))
(add-to-list 'auto-mode-alist '("\\.js" . javascript-mode))

;; Ispell
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))
									;; Set-NU mode
(defface line-number-face 
  '((((type x)) (:foreground "gray" :background "black")))
  "Line numbers font coloring"
  :group 'basic-faces)
(setq setnu-line-number-face 'line-number-face)

;; No audio bell for some commands
(setq ring-bell-function 
      (lambda ()
	(unless (memq this-command '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
	  (ding))))

;; Generic simple modes for some not-frequently-edited files.
(setq generic-define-unix-modes t)
(define-generic-mode 
  'iptables-mode
  '("#")
  '("INPUT" "OUTPUT" "FORWARD" "PREROUTING" "POSTROUTING" )
  '(("ACCEPT" 1 font-lock-variable-name-face)
    ("REJECT" . font-lock-preprocessor)
    ("DROP"   . font-lock-preprocessor))
  '("/var/lib/iptables/active*")
   nil
  "A mode for iptables saved rules" )


;; Mostly ibuffer related stuffs
(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("dired"   (mode . dired-mode))
	       ("org" (or
		       (mode . org-mode)))
	       ("cdapp" (or
			 (mode . js-mode)
			 (mode . html-mode)
			 (mode . css-mode)
			 ))
	       ("love" (or
			(mode . c-mode)
			))
	       ))))
