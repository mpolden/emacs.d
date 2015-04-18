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
(global-hl-line-mode 1)

;; set theme
(if (display-graphic-p)
    (progn (require-package 'color-theme-sanityinc-tomorrow)
           (load-theme 'sanityinc-tomorrow-night t))
  (set-face-background hl-line-face "gray13"))

;; highlight matching parentheses
(show-paren-mode 1)

;; highlight lines exceeding fill-column
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(setq whitespace-line-column nil)
;; make whitespace-mode respect a mode-specific fill-column value
(add-hook 'hack-local-variables-hook
          (lambda ()
            (when (derived-mode-p 'prog-mode)
              (whitespace-mode 1))))

;; disable word wrapping
(setq-default truncate-lines t)

;; display line and column numbers in mode-line
(setq line-number-mode t
      column-number-mode t)

;; display current function in mode-line
(which-function-mode 1)

;; unclutter modeline
(require-package 'diminish)
(require 'diminish)
(eval-after-load "magit" '(diminish 'magit-auto-revert-mode))
(eval-after-load "whitespace" '(diminish 'whitespace-mode))
(eval-after-load "whole-line-or-region" '(diminish 'whole-line-or-region-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "subword" '(diminish 'subword-mode))

(provide 'init-appearance)
