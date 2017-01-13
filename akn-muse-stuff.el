(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)
(require 'muse-blosxom)
(require 'muse-colors)
(require 'muse-wiki)
(require 'planner)
(require 'planner-id)

;; Wiki and Planner Mode stuff
(setq emacs-wiki-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"bash.css\" />")
;; (setf emacs-wiki-publishing-header (concat emacs-wiki-publishing-header "<!-- pub header -->"))
(setq emacs-wiki-default-page "index")
;; (add-to-list 'emacs-wiki-projects 
;; 	     '("Puma" 
;; 	       (emacs-wiki-directories  "~/work/EPAY/puma/pwiki") 
;; 	       (emacs-wiki-publishing-directory . "~/work/EPAY/puma/WebWiki")))

;; Muse Mode
(setq muse-project-alist
      '(("Hcoop webpages"		; Hcoop
	 ("~/hcoop/Pages/" :default "index")
	 (:base "html" :path "~/hcoop/public_html"))
	("Plans"			; Plans
	 ("~/Plans/" 
	  :default "Work"
	  :major-mode planner-mode
	  :visit-link planner-visit-link)
	 (:base "html" :path "~/hcoop/public_html/plans")))
      muse-html-header "~/hcoop/html.head"
      muse-html-footer "~/hcoop/html.tail"
      muse-file-extension "muse"
      muse-blosxom-base-directory "~/hcoop/blosxom")

(add-hook 'planner-mode-hook '(lambda () (define-key planner-mode-map (kbd "C-c C-g") 'planner-update-task)))
(setq planner-project "Plans")
(planner-insinuate-calendar)
(defvaralias 'remember-annotation-functions 'planner-annotation-functions)
(setq remember-save-after-remembering t)
(setq remember-handler-functions '(remember-planner-append))

