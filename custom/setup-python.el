(setq python-shell-interpreter "python")

;Open .py and .pyw in python-mode
(setq auto-mode-alist
      (cons '("\\.\\(py\\|pyw\\)$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

(setq package-list '( epc ; for jedi configuration
                      url anaconda-mode ; for anaconda-mode.
                      company-jedi ; auto-completion.
                      ) ); list the packages to be installed (space separated).
(dolist (package package-list); install the missing packages
  (unless (package-installed-p package)
    (package-install package)))

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-to-list 'company-backends 'company-jedi)

;(setq jedi:setup-keys t)
;(setq jedi:complete-on-dot t)

(provide 'setup-python)
