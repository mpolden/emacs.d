;;; init-appearance.el --- configure appearance  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/font-family "Iosevka" "Set the default font.")

(defvar mpolden/font-size 15 "Set the default font size in points.")

;; set font
(when (and (display-graphic-p)
           (member mpolden/font-family (font-family-list)))
  (set-face-attribute 'default nil
                      :family mpolden/font-family
                      :height (* 10 mpolden/font-size)))

;; maximize frame on startup
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

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

;; avoid potential gaps when frame is maximized
(setq frame-resize-pixelwise t)

;; disable dialogs
(setq use-dialog-box nil)

;; highlight current line
(use-package hl-line
  :hook ((compilation-mode . hl-line-mode)
         (dired-mode . hl-line-mode)
         (ibuffer-mode . hl-line-mode)
         (prog-mode . hl-line-mode)
         (text-mode . hl-line-mode)))

;; highlight matching parentheses
(use-package paren
  :hook ((text-mode . show-paren-mode)))

(defun mpolden/prog-mode-buffer-local-variables ()
  "Set buffer-local variables for `prog-mode'."
  ;; highlight trailing whitespace
  (setq-local show-trailing-whitespace t)
  ;; disable word wrapping
  (setq-local truncate-lines t))

(use-package prog-mode
  :hook ((prog-mode . mpolden/prog-mode-buffer-local-variables)))

;; render colors in compilation buffer
(use-package ansi-color
  :hook ((compilation-filter . ansi-color-compilation-filter)))

;; display line and column numbers in mode-line
(setq line-number-mode t
      column-number-mode t)

;; display time in mode-line
(use-package time
  :init
  ;; civilized societies use a 24 hour clock
  (setq display-time-24hr-format t)
  ;; make sunrise-sunset use a 24 hour clock
  (setq calendar-time-display-form
        '(24-hours ":" minutes
                   (if time-zone " (") time-zone (if time-zone ")")))
  ;; hide load average
  (setq display-time-default-load-average nil)
  :config
  (display-time-mode 1))

;; do not underline compilation messages
(setq compilation-message-face nil)

(provide 'init-appearance)

;;; init-appearance.el ends here
