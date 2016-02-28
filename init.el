;; prevent emacs 25 from automatically initializing package.el
;; (package-initialize)

;; discard changes made with custom
(setq custom-file null-device)

;; add ~/.emacs.d/lisp to load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load files
(require 'init-package)
(require 'init-appearance)
(require 'init-sane-defaults)
(when (eq system-type 'darwin)
  (require 'init-mac))
(require 'init-ido)
(require 'init-projectile)
(require 'init-server)
(require 'init-company-mode)
(require 'init-go-mode)
(require 'init-yaml-mode)
(require 'init-flyspell)
(require 'init-markdown-mode)
(require 'init-javascript)
(require 'init-rainbow-delimiters)
(require 'init-ibuffer)
(require 'init-sessions)
(require 'init-git)
(require 'init-grep)
(require 'init-lisp)
(require 'init-editing)
(require 'init-python-mode)
(require 'init-imenu)
(require 'init-tramp)
(require 'init-nginx)
(require 'init-flycheck)

;; local settings (optional)
(require 'init-local nil t)
