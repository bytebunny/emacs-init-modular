;;; setup-markup --- enable markup languages

(use-package markdown-mode
  :ensure t ; install if not present
  :commands (markdown-mode gfm-mode) ; GitHub Flavored Markdown
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  )

;; Set up the built-in rst-mode for reStructuredText
(setq auto-mode-alist
      (append '(("\\.txt\\'" . rst-mode)
                ("\\.rst\\'" . rst-mode)
                ("\\.rest\\'" . rst-mode)) auto-mode-alist))

(provide 'setup-markup)
