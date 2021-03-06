(setq use-package-verbose t)
(setq use-package-always-ensure t);; will download by defaul if not available on machine

(use-package auto-package-update
    ;;update packages every 4 days :ensure t
    :config
    (setq auto-package-update-delete-old-versions t
    auto-package-update-interval 4)
    (auto-package-update-maybe))

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
	    "N" 'neotree-toggle
	    "b" 'helm-mini
	    "f" 'helm-find-files
            "t" 'glt-open-todos))

(use-package evil
    :config
    (evil-mode 1))

(use-package evil-search-highlight-persist
    :config
    (global-evil-search-highlight-persist t))

(global-hl-line-mode)

(use-package evil-goggles
    :config
    (evil-goggles-mode)

(evil-goggles-use-diff-faces)
(setq evil-goggles-blocking-duration 0.100) ;; default is nil, i.e. use `evil-goggles-duration'
(setq evil-goggles-async-duration 0.300)) ;; default is nil, i.e. use `evil-goggles-duration'

(defun glt-reload-init-file ()
    (interactive)
    (load-file "~/.emacs.d/init.el"))

(defun glt-open-init-file ()
    (interactive)
    (find-file "~/.emacs.d/glt-init.org"))

(defun glt-open-todos ()
    (interactive)
    (find-file "~/Dropbox/org/todo.org"))

(defun glt-json-format ()
    (interactive) ; JSON tool - from http://irreal.org/blog/?p=354#comment-79015
    (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

    
(defadvice load-theme (before theme-dont-propagate activate)
  "Disable theme before loading new one."
  (mapc #'disable-theme custom-enabled-themes))

(defun switch-theme (theme)
    (interactive
    (list
    (intern (completing-read "Load custom theme: "
    (mapc 'symbol-name
    (custom-available-themes))))))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme theme t))

(use-package helm
    :config
    (helm-mode 1)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
    (bind-key "C-x C-f" 'helm-find-files)

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
(global-set-key (kbd "C-c i") 'glt-open-init-file)    ; open .emacs file

;(use-package evil-magit
;    :config
;    (setq evil-magit-state 'normal))
;
;(use-package magit)

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
(define-key global-map (kbd "C-c c") 'glt-org-task-capture)

(use-package auto-compile
	:config (auto-compile-on-load-mode))

(setq org-src-fontify-natively t) ;; Pretty code blocks)
;;(setq org-src-tab-acts-natively t)

(use-package org-bullets
    :init
    (add-hook 'org-mode-hook 'org-bullets-mode))

(org-babel-do-load-languages
    'org-babel-load-languages
    '((emacs-lisp . t)
	(python . t)
	(latex . t)
	(ruby . t)))

(use-package which-key
    :config
    (which-key-mode))
    
(use-package smooth-scrolling
    :config
    (smooth-scrolling-mode 1)
    (setq smooth-scroll-margin 10))

(use-package powerline-evil
    :config
    (powerline-evil-vim-color-theme))

(global-auto-revert-mode t) ;; reloads file if different on disk
(global-visual-line-mode t) ; word wrapping https://stackoverflow.com/questions/3281581/how-to-word-wrap-in-emacs
(setq explicit-shell-file-name "/bin/zsh")
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
(global-nlinum-mode t)
(setq backup-directory-alist '(("." . "~/.emacs/backups/")))

(setq tab-width 4)

;;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; display inline images always
(setq org-image-actual-width nil) ;; https://stackoverflow.com/questions/11670654/how-to-resize-images-in-org-mode
(setq org-display-inline-images t)
(setq org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
;;;; transparent title bar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . light))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)
;; Theme
;; highlight color visual
(set-face-attribute 'region nil :background "#B4D6ED")
;;(switch-theme 'leuven)

(setq tramp-default-method "ssh")

(use-package auto-package-update
    ;;update packages every 4 days
    :ensure t
    :config
    (setq auto-package-update-delete-old-versions t
    auto-package-update-interval 4)
    (auto-package-update-maybe))
