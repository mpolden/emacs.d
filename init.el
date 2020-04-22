;; prevent emacs 25 from automatically initializing package.el
;; (package-initialize)

(let ((lisp-directory (expand-file-name "lisp" user-emacs-directory)))
  ;; add ~/.emacs.d/lisp to load path
  (add-to-list 'load-path lisp-directory)

  ;; save customizations as local (unversioned) settings
  (setq custom-file (expand-file-name "init-local.el" lisp-directory)))

;; packages
(require 'init-package)

;; appearance
(require 'init-appearance)

;; behaviour
(require 'init-sane-defaults)
(when (eq system-type 'darwin)
  (require 'init-mac))

;; editing
(require 'init-editing)
(require 'init-server)
(require 'init-sessions)
(require 'init-tramp)

;; writing
(require 'init-flyspell)
(require 'init-writegood)

;; navigation
(require 'init-amx)
(require 'init-dired)
(require 'init-grep)
(require 'init-ibuffer)
(require 'init-imenu)
(require 'init-ivy)
(require 'init-swiper)

;; managing code
(require 'init-eglot)
(require 'init-flymake)
(require 'init-git)
(require 'init-projectile)

;; languages
(require 'init-go)
(require 'init-javascript)
(require 'init-lisp)
(require 'init-markdown)
(require 'init-org)
(require 'init-python)
(require 'init-yaml)

;; local settings (optional)
(require 'init-local nil t)
