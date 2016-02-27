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
(use-package material-theme
  :if (display-graphic-p)
  :config (load-theme 'material t))

;; highlight matching parentheses
(use-package paren
  :ensure nil ;; package is bundled with emacs
  :config
  (show-paren-mode 1))

;; highlight lines exceeding fill-column
(use-package whitespace
  :ensure nil ;; package is bundled with emacs

  :diminish whitespace-mode

  :init
  (setq whitespace-style '(face empty lines-tail trailing))
  (setq whitespace-line-column nil)

  :config
  ;; make whitespace-mode respect a mode-specific fill-column value
  (add-hook 'hack-local-variables-hook
            (lambda ()
              (when (derived-mode-p 'prog-mode)
                (whitespace-mode 1)))))

;; disable word wrapping
(setq-default truncate-lines t)

;; display line and column numbers in mode-line
(setq line-number-mode t
      column-number-mode t)

(provide 'init-appearance)
