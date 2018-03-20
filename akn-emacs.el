;;; The main .emacs file.
 

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))
(defvar running-win32 (string-match "mingw\\|nt" (emacs-version)) "Are we running win32")
(defconst akn-config-dir "~/.emacs-config")

(add-to-list 'load-path akn-config-dir)
(add-to-list 'load-path "~/src/elisp")
(add-to-list 'load-path "~/src/elisp/rust-mode")
(add-to-list 'load-path "~/src/elisp/haskell-mode")
(add-to-list 'load-path "~/src/elisp/Emacs-Groovy-Mode")
(add-to-list 'load-path "~/src/elisp/smart-mode-line")
(add-to-list 'load-path "~/src/elisp/powerline")

;; Set constants and machine stuff
(setq akn-host-specific-file-name (concat "akn-host-" (system-name) ".el"))
(cond ((file-readable-p (concat akn-config-dir "/" akn-host-specific-file-name))
       (load akn-host-specific-file-name))
      (t (load "akn-host-template.el")))

;; You shall require 
(load "akn-common")
(load "akn-org")
(load "akn-funcs")
(load "akn-erc")
(load "akn-gnus")
(load "akn-dev")
(load "akn-keys")
(load "akn-custom")

(autoload 'rust-mode "rust-mode" nil t)

;; change for win32
(setq custom-file (concat akn-config-dir "/" "akn-custom.el"))

;; My stuff in this.
(if (not running-win32) (load "akn-unix") (load "akn-win32"))

