;;; init.el --- load the configuration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; configure load paths
(let ((lisp-directory (expand-file-name "lisp" user-emacs-directory)))
  ;; add ~/.emacs.d/lisp to load path
  (add-to-list 'load-path lisp-directory)

  ;; save customizations as local (unversioned) settings
  (setq custom-file (expand-file-name "init-local.el" lisp-directory)))

;; package management
(require 'init-package)

;; local settings (optional)
(require 'init-local nil t)

;; appearance
(mpolden/maybe-require 'init-appearance)
(mpolden/maybe-require 'init-theme)

;; behaviour
(mpolden/maybe-require 'init-sane-defaults)
(when (eq system-type 'darwin)
  (mpolden/maybe-require 'init-mac))

;; editing
(mpolden/maybe-require 'init-editing)
(mpolden/maybe-require 'init-server)
(mpolden/maybe-require 'init-tramp)

;; writing
(mpolden/maybe-require 'init-eldoc)
(mpolden/maybe-require 'init-flyspell)

;; navigation
(mpolden/maybe-require 'init-amx)
(mpolden/maybe-require 'init-dired)
(mpolden/maybe-require 'init-grep)
(mpolden/maybe-require 'init-ibuffer)
(mpolden/maybe-require 'init-imenu)
(mpolden/maybe-require 'init-ivy)
(mpolden/maybe-require 'init-project)
(mpolden/maybe-require 'init-recentf)

;; clients
(mpolden/maybe-require 'init-eglot)
(mpolden/maybe-require 'init-elfeed)
(mpolden/maybe-require 'init-flymake)
(mpolden/maybe-require 'init-git)
(mpolden/maybe-require 'init-mail)
(mpolden/maybe-require 'init-restclient)

;; languages
(mpolden/maybe-require 'init-go)
(mpolden/maybe-require 'init-javascript)
(mpolden/maybe-require 'init-lisp)
(mpolden/maybe-require 'init-markdown)
(mpolden/maybe-require 'init-org)
(mpolden/maybe-require 'init-python)
(mpolden/maybe-require 'init-rust)
(mpolden/maybe-require 'init-yaml)

(provide 'init)

;;; init.el ends here
