(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((c-mode . "work")
     (c++-mode . "work")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(custom-safe-themes
   '("2b74e86510c833e92488a42c4214645b6c9d4b63ae2255ba0818bf242e80712a" default))
 '(epg-debug nil)
 '(haskell-mode-hook '(turn-on-haskell-indent))
 '(ibuffer-display-summary nil)
 '(ibuffer-formats
   '((mark modified read-only " "
           (name 18 18 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :right :elide)
           " " filename)
     (mark " "
           (name 16 -1)
           " " filename)))
 '(ibuffer-saved-filter-groups nil t)
 '(ibuffer-saved-filters
   '(("html5"
      ((or
        (mode . html-mode)
        (mode . css-mode)
        (mode . js-mode))))
     ("work"
      ((or
        (mode . c-mode)
        (mode . c++-mode)
        (mode . java-mode))))
     ("irc"
      ((mode . erc-mode)))
     ("gnus"
      ((or
        (mode . message-mode)
        (mode . mail-mode)
        (mode . gnus-group-mode)
        (mode . gnus-summary-mode)
        (mode . gnus-article-mode))))
     ("programming"
      (mode . c-mode))))
 '(ibuffer-saved-limits
   '(("work"
      ((or
        (mode . java-mode)
        (mode . c-mode)
        (mode . c++-mode))))
     ("gnus"
      ((or
        (mode . message-mode)
        (mode . mail-mode)
        (mode . gnus-group-mode)
        (mode . gnus-summary-mode)
        (mode . gnus-article-mode))))
     ("programming"
      ((or
        (mode . emacs-lisp-mode)
        (mode . cperl-mode)
        (mode . c-mode)
        (mode . java-mode)
        (mode . idl-mode)
        (mode . lisp-mode))))))
 '(indent-tabs-mode nil)
 '(org-babel-load-languages '((plantuml . t)))
 '(org-bullets-bullet-list '("◉" "◎" "●" "○"))
 '(org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
 '(package-selected-packages
   '(lsp-java typescript-mode yaml-mode xref use-package tabbar session qml-mode pod-mode muttrc-mode mutt-alias lsp-mode initsplit htmlize graphviz-dot-mode go-mode folding eproject diminish dash-functional csv-mode company color-theme-modern cmake-mode browse-kill-ring boxquote bm bar-cursor apache-mode))
 '(sml/show-eol t)
 '(woman-fill-column 112))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "LemonChiffon" :foreground "black"))))
 '(erc-action-face ((t (:foreground "PaleGreen2" :weight bold))))
 '(erc-current-nick-face ((t (:foreground "Yellow" :weight bold))))
 '(erc-direct-msg-face ((t (:foreground "LemonChiffon"))))
 '(erc-input-face ((t (:foreground "snow2"))))
 '(erc-inverse-face ((t (:background "White" :foreground "Black"))))
 '(erc-nick-default-face ((t (:foreground "SteelBlue2" :weight bold))))
 '(erc-nick-msg-face ((t (:foreground "PaleTurquoise2" :weight bold))))
 '(erc-notice-face ((t (:foreground "SteelBlue1" :weight bold))))
 '(erc-timestamp-face ((t (:foreground "Green"))))
 '(fringe ((((class color) (background dark)) (:background "DarkSlateGray"))))
 '(gnus-group-mail-low-empty ((((class color) (background dark)) (:foreground "aquamarine4"))))
 '(gnus-header-content ((((class color) (background dark)) (:foreground "LightGoldenrod"))))
 '(gnus-header-newsgroups ((((class color) (background dark)) (:foreground "yellow"))))
 '(gnus-header-subject ((((class color) (background dark)) (:foreground "gold"))))
 '(gnus-signature ((t (:foreground "khaki" :slant normal))))
 '(highlight ((t (:background "#204040"))))
 '(ibuffer-deletion-face ((t (:foreground "Orange"))))
 '(info-menu-star ((((class color)) (:foreground "Orange"))))
 '(info-xref ((((class color) (background dark)) (:foreground "cyan"))))
 '(isearch ((((class color) (background dark)) (:background "PeachPuff" :foreground "DarkGreen"))))
 '(message-cited-text ((((class color) (background dark)) (:foreground "orange"))) t)
 '(message-header-cc ((t (:foreground "turquoise3" :weight bold))))
 '(message-header-name ((((class color) (background dark)) (:foreground "turquoise"))))
 '(message-header-other ((((class color) (background dark)) (:foreground "#ff8040"))))
 '(message-header-subject ((((class color) (background dark)) (:foreground "orange"))))
 '(message-header-to ((t (:foreground "turquoise1" :weight bold))))
 '(message-header-xheader ((((class color) (background dark)) (:foreground "skyblue1"))))
 '(message-mml ((((class color) (background dark)) (:foreground "khaki"))))
 '(message-separator ((((class color) (background dark)) (:foreground "skyblue3"))))
 '(mode-line ((t (:background "black" :foreground "PaleGoldenRod" :box nil))))
 '(mode-line-highlight ((t (:box (:line-width 1 :color "black")))))
 '(mode-line-inactive ((t (:inherit mode-line :background "Gray20" :foreground "grey50"))))
 '(planner-high-priority-task-face ((t (:foreground "tomato"))))
 '(planner-low-priority-task-face ((t (:foreground "Skyblue"))))
 '(region ((((class color) (background dark)) (:background "DarkGreen")))))
