(use-package ruby-mode
	:mode "\\.rb\\'"
	:interpreter "ruby")

;; The package is "python" but the mode is "python-mode":
(use-package python
	:mode ("\\.py\\'" . python-mode)
	:interpreter ("python3" . python-mode)
        :config (setq python-indent-offset 4))

(use-package evil-leader
	:config
	(setq evil-leader/in-all-states 1)
	(global-evil-leader-mode)
	(evil-leader/set-leader "<SPC>")
	(evil-leader/set-key
		"w" 'save-buffer
		"N" 'neotree-toggle))

(use-package evil
	:config
	(evil-mode 1))

(use-package evil-search-highlight-persist
	:config
	(global-evil-search-highlight-persist t))

(use-package evil-goggles
	:config
	(evil-goggles-mode)

	;; optionally use diff-mode's faces; as a result, deleted text
	;; will be highlighed with `diff-removed` face which is typically
	;; some red color (as defined by the color theme)
	;; other faces such as `diff-added` will be used for other actions
	(evil-goggles-use-diff-faces)
	;; this variable affects "blocking" hints, for example when deleting - the hint is displayed,
	;; the deletion is delayed (blocked) until the hint disappers, then the hint is removed and the
	;; deletion executed; it makes sense to have this duration short
	(setq evil-goggles-blocking-duration 0.100) ;; default is nil, i.e. use `evil-goggles-duration'
	;; this variable affects "async" hints, for example when indenting - the indentation
	;; is performed with the hint visible, i.e. the hint is displayed, the action (indent) is
	;; executed (asynchronous), then the hint is removed, highlighting the result of the indentation
	(setq evil-goggles-async-duration 0.300)) ;; default is nil, i.e. use `evil-goggles-duration'

(defun glt-reload-init-file ()
	(interactive)
	(load-file "~/.emacs.d/init.el"))

(defun glt-open-init-file ()
	(interactive)
	(find-file "~/.emacs.d/glt-init.org"))

(defun glt-json-format ()
	(interactive) ; JSON tool - from http://irreal.org/blog/?p=354#comment-79015
	(save-excursion
		(shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

(defun switch-theme (theme)
	;; This interactive call is taken from `load-theme'
	(interactive
	 (list
		(intern (completing-read "Load custom theme: "
					 (mapcar 'symbol-name
						 (custom-available-themes))))))
	(mapcar #'disable-theme custom-enabled-themes)
	(load-theme theme t))

(use-package helm
	:config
	(helm-mode 1)
	(global-set-key (kbd "M-x") 'helm-M-x)
	(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
	(bind-key "C-x C-f" 'helm-find-files)
	(bind-key "C-x b" 'helm-mini)

	(setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t)
					; tab completion
	:bind (:map helm-map
				("<tab>" . helm-execute-persistent-action)
				("C-z" . helm-select-action)))

(use-package helm-descbinds
	:config
	(helm-descbinds-mode))

(global-set-key (kbd "C-c C-l") 'glt-reload-init-file)    ; Reload .emacs file

(use-package evil-magit
	:ensure t
	 :config
	 (setq evil-magit-state 'normal))

(use-package magit
	:ensure t)

(require 'neotree)

(setq org-ellipsis "⤵")
;;https://orgmode.org/worg/org-faq.html#closing-outline-sections
(require 'org-inlinetask)

(setq org-todo-keywords
			'((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

(setq org-agenda-files '("~/Dropbox/org/"))

;; https://blog.aaronbieber.com/2016/01/30/dig-into-org-mode.html
(defun glt-pop-to-org-agenda (split)
	"visit the org agenda, in the current window or a split."
	(interactive "P")
	(org-agenda-list)
	(when (not split)
		(delete-other-windows)))


(setq org-capture-templates
			'(("a" "My TODO task format." entry
	 (file "~/Dropbox/todo.org")
	 "* TODO %? SCHEDULED: %t")))

(defun glt-org-task-capture ()
	"Capture a task with my default template."
	(interactive)
	(org-capture nil "a"))

(define-key global-map (kbd "C-c t a") 'glt-pop-to-org-agenda)
(global-set-key (kbd "C-c o") 
		(lambda () (interactive) 
			(find-file "~/Dropbox/org/todo.org")))
(define-key global-map (kbd "C-c c") 'glt-org-task-capture)

(use-package auto-compile
	:config (auto-compile-on-load-mode))

(setq org-src-fontify-natively t) ;; Pretty code blocks)
(setq org-src-tab-acts-natively t)

(use-package org-bullets
	:init
	(add-hook 'org-mode-hook 'org-bullets-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
	 (python . t)
	 (ruby . t)))

(use-package which-key
	:config
	(which-key-mode))


(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
;;https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-keyfreq.el
(unless (file-exists-p (file-truename keyfreq-file))
	(with-temp-buffer
		(insert "()")
		(write-file (file-truename keyfreq-file))))

(use-package powerline-evil
	:config
	(powerline-evil-vim-color-theme))

(desktop-save-mode 1);; re-open buffers when opening emacs again
(global-visual-line-mode t) ; word wrapping https://stackoverflow.com/questions/3281581/how-to-word-wrap-in-emacs
(setq explicit-shell-file-name "/bin/bash")
;;(setq shell-command-switch "-ic")
(fset 'yes-or-no-p 'y-or-n-p)

(defun my-terminal-visible-bell ()
	"A friendlier visual bell effect."
	(invert-face 'mode-line)
	(run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq visible-bell nil
			ring-bell-function #'my-terminal-visible-bell)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
(setq load-prefer-newer t)
(global-linum-mode t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

;;(setq-default indent-tabs-mode nil)
(setq tab-width 2)
;;(setq-default tab-always-indent 'complete)

;;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)
(use-package smart-tabs-mode)
(smart-tabs-insinuate 'python 'ruby)

(use-package all-the-icons)
;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
;; transparent title bar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;;(add-to-list 'default-frame-alist '(ns-appearance . light))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)
;; Theme
(switch-theme 'leuven)

(setq tramp-default-method "ssh")

(setq use-package-verbose t)
(setq use-package-always-ensure t);; will download by defaul if not available on machine

(use-package auto-package-update
		;;update packages every 4 days
		:ensure t
		:config
		(setq auto-package-update-delete-old-versions t
		auto-package-update-interval 4)
		(auto-package-update-maybe))

(defun shortened-path (path max-len)
      "Return a modified version of `path', replacing some components
      with single characters starting from the left to try and get
      the path down to `max-len'"
      (let* ((components (split-string (abbreviate-file-name path) "/"))
	     (len (+ (1- (length components))
		     (reduce '+ components :key 'length)))
	     (str ""))
	(while (and (> len max-len)
		    (cdr components))
	  (setq str (concat str (if (= 0 (length (car components)))
				    "/"
				  (string (elt (car components) 0) ?/)))
		len (- len (1- (length (car components))))
		components (cdr components)))
	(concat str (reduce (lambda (a b) (concat a "/" b)) components))))



;   - ban
;   - battery-empty
;   - battery-full
;   - battery-half
;   - battery-quarter
;   - battery-three-quarters
;   - btc
;   - chain-broken
;   - check
;   - chevron-right
;   - folder
;   - folder-o
;   - folder-open-o
;   - github
;   - hashtag
;   - key
; - keyboard
;   - undo
;   - upload
;   - usb
;   - wifi
;   - wrench


  ; - chevron-right


  (setq eshell-prompt-regexp "^[^#$\n]*[#$] "
	eshell-prompt-function
	(lambda nil
	  (concat
	   (user-login-name) "  "
	   (shortened-path (eshell/pwd) 10)
           (propertize " "  'face `(:foreground "blue"))
	   (if (= (user-uid) 0) "   " "  ")
	  )
	)
  )
