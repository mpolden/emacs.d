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

;; set theme
(require-package 'afternoon-theme)
(load-theme 'afternoon t)
;; reset mode-line font
(set-face-attribute 'mode-line nil
                    :family 'unspecified)

;; display line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format " %d ")

;; highlight current line
(global-hl-line-mode)

;; highlight matching parentheses
(show-paren-mode 1)

;; highlight lines exceeding 80 columns
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; disable word wrapping
(setq-default truncate-lines 1)

;; display line and column numbers in mode-line
(setq line-number-mode t)
(setq column-number-mode t)

;; display date and time in mode-line
(setq display-time-default-load-average nil
      display-time-format "%t %a %b %d, %R")
(display-time)

(provide 'init-appearance)
