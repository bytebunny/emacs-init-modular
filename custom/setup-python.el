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
  (global-company-mode 1) ; enable in all buffers.
  )

;; Completion back-end for Python JEDI.
(use-package company-jedi
  :ensure t ; install if not present
  :init ; execute before the package is loaded
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:setup) ; manually installing requirements from ~/emacs.d/elpa/jedi*/ might be necessary.
  )

;; Automatically format the buffer according to Python's PEP8
(use-package py-autopep8
  :ensure t ; install if not present
  :init ; execute before the package is loaded
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  )

;; Use IPython as Python shell. Pressing C-c C-p opens a new buffer with IPython interpreter.
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "-i")

(provide 'setup-python)
