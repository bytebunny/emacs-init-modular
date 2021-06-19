;;; setup-python --- customize Python environment

;; Color the mode line according to the status of Flycheck (see below) syntax.
(use-package flycheck-color-mode-line
  :ensure t) ; install if not present

;; On-the-fly syntax check.
; NOTE: On Windows, you might need to create a symlink for python3 for
; flycheck to be able to find Python checkers (e.g. flake8 and pylint).
(use-package flycheck
  :ensure t ; install if not present
  :init ; execute before the package is loaded
  (global-flycheck-mode)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
  )

;; Text completion framework
(use-package company
  :ensure t ; install if not present
  :config ; execute code after the package is loaded
  (add-to-list 'company-backends 'company-jedi)
  )

;; Completion back-end for Python JEDI.
(use-package company-jedi
  :ensure t ; install if not present
  :init ; execute before the package is loaded
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:setup) ; manually installing requirements from ~/emacs.d/elpa/jedi*/ might be necessary.
  )

;; Emacs IPython Notebook
(use-package ein
  :ensure t ; install if not present
  :init
  (setq ein:output-area-inlined-images t) ; display images inside buffer
  )

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;                      "jupyter")

(provide 'setup-python)
