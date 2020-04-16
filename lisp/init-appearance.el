;; disable splash
(setq inhibit-startup-message t)

;; hide menubar when not on os x
(when (and (fboundp 'menu-bar-mode) (not (eq system-type 'darwin)))
  (menu-bar-mode -1))

;; hide toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; hide scrollbar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; disable dialogs
(setq use-dialog-box nil)

;; highlight current line
(use-package hl-line
  :ensure nil ;; package is bundled with emacs
  :config
  (global-hl-line-mode 1))

;; set theme
(use-package doom-themes
  :if (display-graphic-p)
  :config
  (load-theme 'doom-one t)

  ;; make title bar use same style as theme on mac
  (when (eq system-type 'darwin)
    (setq default-frame-alist '((ns-appearance . dark)
                                (ns-transparent-title-bar . t)))))

;; highlight matching parentheses
(use-package paren
  :ensure nil ;; package is bundled with emacs
  :config
  (show-paren-mode 1))

;; highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; disable word wrapping
(setq-default truncate-lines t)

;; display line and column numbers in mode-line
(setq line-number-mode t
      column-number-mode t)

(provide 'init-appearance)
