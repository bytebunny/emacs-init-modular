;;; setup-help --- help and info

;;; Commentary:
;; taken from https://tuhdo.github.io/emacs-tutor3.html

(provide 'setup-help)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Help-> Discover my major ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package discover-my-major
  :ensure t ; install if missing
  :config ; execute after the package is loaded
  ;; A quick major mode help with discover-my-major
  (global-unset-key (kbd "C-h h")) ; original "C-h h" displays "hello world" in different languages
  ;; bind `C-h h m` to `discover-my-major`
  (define-key 'help-command (kbd "h m") 'discover-my-major)
  )
