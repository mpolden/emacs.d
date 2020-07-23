;; configure load paths
(let ((lisp-directory (expand-file-name "lisp" user-emacs-directory)))
  ;; add ~/.emacs.d/lisp to load path
  (add-to-list 'load-path lisp-directory)

  ;; save customizations as local (unversioned) settings
  (setq custom-file (expand-file-name "init-local.el" lisp-directory)))

;; packages
(require 'init-package)

;; local settings (optional)
(require 'init-local nil t)

;; appearance
(maybe-require 'init-appearance)
(maybe-require 'init-theme)

;; behaviour
(maybe-require 'init-sane-defaults)
(when (eq system-type 'darwin)
  (maybe-require 'init-mac))

;; editing
(maybe-require 'init-editing)
(maybe-require 'init-server)
(maybe-require 'init-sessions)
(maybe-require 'init-tramp)

;; writing
(maybe-require 'init-flyspell)
(maybe-require 'init-writegood)

;; navigation
(maybe-require 'init-amx)
(maybe-require 'init-dired)
(maybe-require 'init-grep)
(maybe-require 'init-ibuffer)
(maybe-require 'init-imenu)
(maybe-require 'init-ivy)
(maybe-require 'init-swiper)

;; managing code
(maybe-require 'init-eglot)
(maybe-require 'init-flymake)
(maybe-require 'init-git)
(maybe-require 'init-project)

;; languages
(maybe-require 'init-go)
(maybe-require 'init-javascript)
(maybe-require 'init-lisp)
(maybe-require 'init-markdown)
(maybe-require 'init-org)
(maybe-require 'init-python)
(maybe-require 'init-yaml)
