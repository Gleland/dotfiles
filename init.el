;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(require 'use-package)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)
;;
;;
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))
(setq org-ellipsis "⤵")
;;
(defun glt-reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;; global key bindings
(global-set-key (kbd "C-c C-l") 'glt-reload-init-file)    ; Reload .emacs file


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (leuven-theme use-package org-bullets auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'leuven t) ;; https://github.com/fniessen/emacs-leuven-theme 
