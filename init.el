;; add ~/.emacs.d/lisp to load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; add ~/.emacs.d/site-lisp to load path, if it exists
;; used for backported code
(let ((site-lisp (expand-file-name "site-lisp" user-emacs-directory)))
  (when (file-directory-p site-lisp)
    (add-to-list 'load-path site-lisp)))

;; load files
(require 'init-package)
(require 'init-appearance)
(require 'init-sane-defaults)
(when (eq system-type 'darwin)
  (require 'init-mac))
(require 'init-ido)
(require 'init-server)
(require 'init-go-mode)
(require 'init-yaml-mode)
(require 'init-markdown-mode)
(require 'init-javascript)
(require 'init-rainbow-delimiters)
(require 'init-ibuffer)
(require 'init-sessions)
(require 'init-git)
(require 'init-lisp)
(require 'init-editing)
(require 'init-ag)
(require 'init-expand-region)
(require 'init-python-mode)
(require 'init-web-mode)
(require 'init-eshell)

;; local settings (optional)
(require 'init-local nil t)
