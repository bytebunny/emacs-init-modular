(require 'package)

(setq package-list '( tangotango-theme
                      use-package
                      magit
                      auctex auto-complete-auctex auctex-latexmk ac-math
                    ) ); list the packages to be installed (space separated).
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")) )

(package-initialize); activate all the packages (in particular autoloads)

(when (not package-archive-contents); fetch the list of packages available
    (package-refresh-contents))

(dolist (package package-list); install the missing packages
  (unless (package-installed-p package)
    (package-install package)))

;; Use exec-path-from-shell package to copy env variables from the shell:
(use-package exec-path-from-shell
  :config ; execute code after the package is loaded
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(load-theme 'tangotango t)

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)

;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'setup-auctex)
(require 'setup-yml)
(require 'setup-python)
(require 'setup-markup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
   '(flycheck yaml-mode gh-md markdown-mode magit helm-projectile helm-swoop helm-descbinds company-c-headers sr-speedbar exec-path-from-shell function-args zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'default-frame-alist '(fullscreen . fullscreen)) ; Start fullscreen mode.
