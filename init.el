;; prevent emacs 25 from automatically initializing package.el
;; (package-initialize)

(let ((lisp-directory (expand-file-name "lisp" user-emacs-directory)))
  ;; add ~/.emacs.d/lisp to load path
  (add-to-list 'load-path lisp-directory)

  ;; save customizations as local (unversioned) settings
  (setq custom-file (expand-file-name "init-local.el" lisp-directory)))

;; load files
(require 'init-package)
(require 'init-appearance)
(require 'init-sane-defaults)
(when (eq system-type 'darwin)
  (require 'init-mac))
(require 'init-ido)
(require 'init-dired)
(require 'init-projectile)
(require 'init-server)
(require 'init-go-mode)
(require 'init-yaml-mode)
(require 'init-flyspell)
(require 'init-writegood-mode)
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
(require 'init-flycheck)
(require 'init-org)
(require 'init-rust-mode)
(require 'init-lsp-mode)
(require 'init-compile)

;; local settings (optional)
(require 'init-local nil t)
