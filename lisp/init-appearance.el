;;; init-appearance.el --- configure appearance  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

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
  :config
  (global-hl-line-mode 1))

;; highlight matching parentheses
(use-package paren
  :config
  (show-paren-mode 1))

(defun mpolden/prog-mode-buffer-local-variables ()
  "Set buffer-local variables for `prog-mode'."
  ;; highlight trailing whitespace
  (setq-local show-trailing-whitespace t)
  ;; disable word wrapping
  (setq-local truncate-lines t))

(use-package prog-mode
  :hook ((prog-mode . mpolden/prog-mode-buffer-local-variables)))

(defun mpolden/colorize-compilation-buffer ()
  "Render ansi colors in compilation buffer."
  (when (eq major-mode 'compilation-mode)
    (ansi-color-apply-on-region compilation-filter-start (point-max))))

(use-package ansi-color
  :hook ((compilation-filter . mpolden/colorize-compilation-buffer)))

;; display line and column numbers in mode-line
(setq line-number-mode t
      column-number-mode t)

(provide 'init-appearance)

;;; init-appearance.el ends here
