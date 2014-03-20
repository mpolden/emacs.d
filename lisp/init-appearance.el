;; disable splash
(setq inhibit-startup-message t)

;; hide menubar
(menu-bar-mode -1)

;; hide toolbar
(tool-bar-mode -1)

;; hide scrollbar
(scroll-bar-mode -1)

;; set theme
(require-package 'afternoon-theme)
(load-theme 'afternoon t)
;; reset mode-line font
(set-face-attribute 'mode-line nil
                    :family 'unspecified)

;; display line numbers
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

(provide 'init-appearance)
