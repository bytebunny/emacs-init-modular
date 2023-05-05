;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers);; auto-completion for C/C++ headers
  :config ; execute after the package is loaded
  (add-to-list 'company-c-headers-path-system
               (cond ((eq system-type 'gnu/linux)
                      "/usr/local/include/c++/12.2.0")
                     ((eq system-type 'darwin)
                      "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/")
                     ;;((eq system-type 'windows-nt)
                     ;; )
                     )
               )
  )

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style "linux" ;; set style to "linux"
      c-basic-offset 4); indentation width

(use-package cc-mode
  :init
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete))

(setq package-list '( cmake-mode ; syntax highlighting for CMakeLists.txt and .cmake files.
                      highlight-doxygen
                      function-args
                      ) ); list the packages to be installed (space separated).
(when (not package-archive-contents); fetch the list of packages available
  (package-refresh-contents))

(dolist (package package-list); install the missing packages
  (unless (package-installed-p package)
    (package-install package)))

(require 'cmake-mode)

(use-package highlight-doxygen
  :config
  (highlight-doxygen-global-mode 1));; enable the minor `highlight-doxygen-mode` mode for
                                    ;; all major modes specified in highlight-doxygen-modes (c,c++,objc)
;; function-args
(require 'function-args)
(fa-config-default)

(provide 'setup-c)
