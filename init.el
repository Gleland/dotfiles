(setq find-file-visit-truename t)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives'("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
 
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
 
(require 'use-package)
(require 'ob-tangle)
 
(org-babel-load-file (expand-file-name "~/.emacs.d/glt-init.org"))
