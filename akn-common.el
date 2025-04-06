;; Standard stuff
(require 'ibuffer)
;; (require 'cl)
;; (require 'bbdb)
(require 'fortune)
(require 'generic-x)
(require 'haskell-mode-autoloads)
(require 'groovy-mode)
(require 'gtags)
(require 'smart-mode-line)
(require 'toml-mode)
(require 'qrencode)
(require 'package)

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
(savehist-mode 1)

;; Automode list
(autoload 'rust-mode "rust-mode" nil t)

;;
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.wsdl\\|.xsd" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.rc\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.mak" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.bin$" . hexl-mode))
(add-to-list 'auto-mode-alist '("\\.js" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.rs" . rust-mode))
(add-to-list 'auto-mode-alist '("\\.rs" . rust-mode))
(add-to-list 'auto-mode-alist '("\\.toml" . toml-mode))
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
;; Powerline
(setq sml/theme 'powerline)
(sml/setup)

;; Use-package
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package typescript-mode
  :mode ("\\.tsx?\\'" . typescript-mode))
