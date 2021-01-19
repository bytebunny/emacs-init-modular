(require 'ac-math) ; this package has to be installed beforehand.
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`
(defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources))
  )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
(setq ac-disable-faces nil) ; Turns on auto-complete inside of quote marks and comments.
(setq ac-math-unicode-in-math-p t)
;; end auto-complete section.

(require 'auto-complete-auctex) ; Package has to be installed.
;; auctex recommended preferences (auctex package has to be already installed):
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
; Automatically insert ‘$...$’ in plain TeX files, and ‘\(...\)’ in LaTeX files by pressing $ (AUCTeX is needed):
(add-hook 'plain-TeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "\\(" "\\)"))))
; In AUCTeX, get a full featured 'LaTeX-section' command:
(setq LaTeX-section-hook
      '(LaTeX-section-heading
        LaTeX-section-title
        LaTeX-section-toc
        LaTeX-section-section
        LaTeX-section-label))
;(setq preview-gs-command "/usr/local/bin/gs") ; populate variable to enable preview of pdftex within Emacs.
; Activate RefTeX and make it interact with AUCTeX:
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(require 'auctex-latexmk)
(auctex-latexmk-setup)
(setenv "LANG" "en_US.UTF-8") ; Make LuaTeX recognise locale.
(setenv "LC_ALL" "en_US.UTF-8")

(provide 'setup-auctex)
